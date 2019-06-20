part of xpx_chain_sdk;

class Multisig {
  Multisig.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    accountAddress =  Address.fromEncoded(json['accountAddress'] as String);
    account =  PublicAccount.fromPublicKey(
        json['account'] as String, accountAddress._networkType);
    minApproval = json['minApproval'] as int;
    minRemoval = json['minRemoval'] as int;
    cosignatories = (json['cosignatories'] as List)
        .map((dynamic item) => item as String)
        .toList();
    multisigAccounts = (json['multisigAccounts'] as List)
        .map((dynamic item) => item as String)
        .toList();
  }

  PublicAccount account;

  Address accountAddress;

  int minApproval;

  int minRemoval;

  List<String> cosignatories = [];

  List<String> multisigAccounts = [];

  @override
  String toString() {
    return '{\n'
        '\taccount: $account,\n'
        '\tminApproval: $minApproval,\n'
        '\tminRemoval: $minRemoval,\n'
        '\tcosignatories: $cosignatories,\n'
        '\tmultisigAccounts: $multisigAccounts\n'
        '}\n';
  }

  static List<Multisig> listFromJson(List<dynamic> json) {
    return json == null
        ?  List<Multisig>()
        : json
            .map((dynamic value) =>
                 Multisig.fromJson(value as Map<String, dynamic>))
            .toList();
  }

  static Map<String, Multisig> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map =  Map<String, Multisig>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] =  Multisig.fromJson(value));
    }
    return map;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['account'] = account;
    data['accountAddress'] = accountAddress;
    data['minApproval'] = minApproval;
    data['minRemoval'] = minRemoval;
    data['cosignatories'] = cosignatories;
    data['multisigAccounts'] = multisigAccounts;

    return data;
  }
}

class MultisigAccountGraphInfo {
  MultisigAccountGraphInfo.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    level = json['level'] as int;
    multisigEntries = MultisigAccountInfo.listFromJson(
        json['multisigEntries'] as List<dynamic>);
  }

  int level;

  List<MultisigAccountInfo> multisigEntries = [];

  @override
  String toString() {
    return '{\n'
        '\tlevel: $level,\n'
        '\tmultisigEntries: $multisigEntries\n'
        '}\n';
  }

  static List<MultisigAccountGraphInfo> listFromJson(List<dynamic> json) {
    return json == null
        ?  List<MultisigAccountGraphInfo>()
        : json
            .map((dynamic value) =>  MultisigAccountGraphInfo.fromJson(
                value as Map<String, dynamic>))
            .toList();
  }

  static Map<String, MultisigAccountGraphInfo> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map =  Map<String, MultisigAccountGraphInfo>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] =  MultisigAccountGraphInfo.fromJson(value));
    }
    return map;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['level'] = level;
    data['multisigEntries'] = multisigEntries;

    return data;
  }
}

class MultisigAccountInfo {
  MultisigAccountInfo.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    multisig =  Multisig.fromJson(json['multisig'] as Map<String, dynamic>);
  }

  Multisig multisig;

  @override
  String toString() {
    return '${toJson()}';
  }

  static List<MultisigAccountInfo> listFromJson(List<dynamic> json) {
    return json == null
        ?  List<MultisigAccountInfo>()
        : json
            .map((dynamic value) =>
                 MultisigAccountInfo.fromJson(value as Map<String, dynamic>))
            .toList();
  }

  static Map<String, MultisigAccountInfo> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map =  Map<String, MultisigAccountInfo>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] =  MultisigAccountInfo.fromJson(value));
    }
    return map;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['multisig'] = multisig;
    return data;
  }
}