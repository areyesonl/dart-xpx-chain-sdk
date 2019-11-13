part of xpx_chain_sdk;

class _AccountPropertiesInfoDTO {
  _AccountPropertiesInfoDTO.fromJson(Map<String, dynamic> json)
      : assert(json != null, 'json must not be null') {
    _meta = _AccountPropertiesMetaDTO.fromJson(json['meta']);
    _accountProperties =
        _AccountPropertiesDTO.fromJson(json['accountProperties']);
  }

  _AccountPropertiesMetaDTO _meta;

  _AccountPropertiesDTO _accountProperties;

  static List<_AccountPropertiesInfoDTO> listFromJson(List<dynamic> json) =>
      json == null
          ? null
          : json
              .map((value) => _AccountPropertiesInfoDTO.fromJson(value))
              .toList();

  static Map<String, _AccountPropertiesInfoDTO> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    final Map<String, _AccountPropertiesInfoDTO> map = {};
    if (json != null && json.isNotEmpty) {
      json.forEach(
          (key, value) => map[key] = _AccountPropertiesInfoDTO.fromJson(value));
    }
    return map;
  }

  Map<String, dynamic> toJson() =>
      {'meta': _meta, 'accountProperties': _accountProperties};
}