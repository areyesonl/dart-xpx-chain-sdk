part of xpx_chain_sdk.transaction;

// AliasTransaction
class AccountPropertiesAddressTransaction extends AbstractTransaction implements Transaction {
  AccountPropertiesAddressTransaction(Deadline deadline, this.propertyType, this.modifications, int networkType)
      : super() {
    version = accountPropertyAddressVersion;
    this.deadline = deadline;
    type = TransactionType.accountPropertyAddress;
    this.networkType = networkType;
  }

  AccountPropertiesAddressTransaction.fromDTO(AccountPropertiesAddressTransactionInfoDTO dto)
      : assert(dto != null, 'dto must not be null'),
        super.fromDto(dto.transaction, dto.meta) {
    propertyType = AccountPropertyType.fromInt(dto.transaction.propertyType);
    modifications = AccountPropertiesAddressModification.listFromJson(dto.transaction.modifications);
  }

  AccountPropertyType propertyType;
  List<AccountPropertiesAddressModification> modifications;

  int get size => _size();

  @override
  TransactionType entityType() => type;

  AbstractTransaction get abstractTransaction => absTransaction();

  @override
  String toString() => '{\n'
      '\t"abstractTransaction": ${_absToString()}\n'
      '\t"propertyType": $propertyType,\n'
      '\t"modifications": $modifications\n'
      '}\n';

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['abstractTransaction'] = _absToJson();
    data['propertyType'] = propertyType;
    data['modifications'] = modifications;

    return data;
  }

  @override
  int _size() => accountPropertyAddressHeader + (accountPropertiesAddressModificationSize * modifications.length);

  @override
  AbstractTransaction absTransaction() => _absTransaction();

  @override
  Uint8List generateBytes() {
    final builder = fb.Builder(initialSize: 0);

    /// Create mosaics
    final List<int> msb = List(modifications.length);
    int i = 0;
    for (final modification in modifications) {
      final address = modification.address.decode();
      final aV = builder.writeListUint8(address);

      final ms = PropertyModificationBufferBuilder(builder)
        ..begin()
        ..addModificationType(modification.modificationType.index)
        ..addValueOffset(aV);
      msb[i] = ms.finish();
      i++;
    }

    final mV = builder.writeList(msb);

    final vectors = _generateVector(builder);

    final txnBuilder = AccountPropertiesTransactionBufferBuilder(builder)
      ..begin()
      ..addSize(_size())
      ..addPropertyType(propertyType.value)
      ..addModificationCount(modifications.length)
      ..addModificationsOffset(mV);
    _buildVector(builder, vectors);

    final codedAccountProperty = txnBuilder.finish();

    return accountPropertyTransactionSchema().serialize(builder.finish(codedAccountProperty));
  }
}
