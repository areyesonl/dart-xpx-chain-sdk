part of xpx_catapult_sdk;

class _abstractTransactionDTO  {
	int Type;
  int Version;
	UInt64DTO Fee;
  UInt64DTO Deadline;
	String Signature;
  String Signer;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['signature'] = this.Signature;
    data['signer'] = this.Signer;
    data['version'] = this.Version;
    data['type'] = this.Type;
    data['maxFee'] = this.Fee;
    data['deadline'] = this.Deadline;
    return data;
  }
}

class _transferTransactionInfoDTO {
  _metaTransactionDTO _meta;
  _transferTransactionDTO _transaction;

  Autogenerated({_metaTransactionDTO meta, _transferTransactionDTO transaction}) {
    this._meta = meta;
    this._transaction = transaction;
  }

  _metaTransactionDTO get meta => _meta;
  set meta(_metaTransactionDTO meta) => _meta = meta;
  _transferTransactionDTO get transaction => _transaction;
  set transaction(_transferTransactionDTO transaction) => _transaction = transaction;

  _transferTransactionInfoDTO.fromJson(Map<String, dynamic> json) {
    _meta = json['meta'] != null ? new _metaTransactionDTO.fromJson(json['meta']) : null;
    _transaction = json['transaction'] != null
        ? new _transferTransactionDTO.fromJson(json['transaction'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._meta != null) {
      data['meta'] = this._meta.toJson();
    }
    if (this._transaction != null) {
      data['transaction'] = this._transaction.toJson();
    }
    return data;
  }
}

class _metaTransactionDTO {
  UInt64DTO _height;
  String _hash;
  String _merkleComponentHash;
  int _index;
  String _id;

  _metaTransactionDTO(
      {List<int> height,
        String hash,
        String merkleComponentHash,
        int index,
        String id}) {
    this._height = UInt64DTO.fromJson(height);
    this._hash = hash;
    this._merkleComponentHash = merkleComponentHash;
    this._index = index;
    this._id = id;
  }

  _metaTransactionDTO.fromJson(Map<String, dynamic> json) {
    _height = UInt64DTO.fromJson(json['height']);
    _hash = json['hash'];
    _merkleComponentHash = json['merkleComponentHash'];
    _index = json['index'];
    _id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this._height;
    data['hash'] = this._hash;
    data['merkleComponentHash'] = this._merkleComponentHash;
    data['index'] = this._index;
    data['id'] = this._id;
    return data;
  }
}

class _transferTransactionDTO extends _abstractTransactionDTO {
  String _recipient;
  List<_mosaicDTO> _mosaics;
  _messageDTO _message;

  _transferTransactionDTO(
      {String signature,
        String signer,
        int version,
        int type,
        List<int> maxFee,
        List<int> deadline,
        String recipient,
        List<_mosaicDTO> mosaics,
        _messageDTO message}) {
    this.Signature = signature;
    this.Signer = signer;
    this.Version = version;
    this.Type = type;
    this.Fee = UInt64DTO.fromJson(maxFee);
    this.Deadline = UInt64DTO.fromJson(deadline);
    this._recipient = recipient;
    this._mosaics = mosaics;
    this._message = message;
  }

  _transferTransactionDTO.fromJson(Map<String, dynamic> json) {
    this.Signature = json['signature'];
    this.Signer = json['signer'];
    this.Version = json['version'];
    this.Type = json['type'];
    this.Fee = UInt64DTO.fromJson(json['maxFee']);
    this.Deadline = UInt64DTO.fromJson(json['deadline']);
    _recipient = json['recipient'];
    if (json['mosaics'] != null) {
      _mosaics = new List<_mosaicDTO>();
      json['mosaics'].forEach((v) {
        _mosaics.add(new _mosaicDTO.fromJson(v));
      });
    }
    this._message = _messageDTO.fromJson(json['message']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['signature'] = this.Signature;
    data['signer'] = this.Signer;
    data['version'] = this.Version;
    data['type'] = this.Type;
    data['maxFee'] = this.Fee;
    data['deadline'] = this.Deadline;
    data['recipient'] = this._recipient;
    if (this._mosaics != null) {
      data['mosaics'] = this._mosaics.map((v) => v.toJson()).toList();
    }
    data['message'] = this._message;
    return data;
  }
}

// Message
class _messageDTO {
  int _type;
  String _payload;

  _messageDTO({int type, String payload}) {
    this._type = type;
    this._payload = payload;
  }

  int get type => _type;
  set type(int type) => _type = type;
  String get payload => _payload;
  set payload(String payload) => _payload = payload;

  _messageDTO.fromJson(Map<String, dynamic> json) {
    _type = json['type'];
    _payload = json['payload'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this._type;
    data['tayload'] = this._payload;
    return data;
  }
}