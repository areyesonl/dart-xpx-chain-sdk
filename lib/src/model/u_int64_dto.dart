part of xpx_catapult_sdk;

class UInt64DTO {
  Int64 lower, higher;

  UInt64DTO();

  @override
  String toString() {
    return '[${higher}, ${lower}]';
  }

  UInt64DTO.fromJson(dynamic json) {
    if (json == null) return;
    higher = Int64(json[0]);
    lower = Int64(json[1]);
  }

  UInt64DTO.fromBigInt(BigInt v) {
    if (json == null) return;

    var u64 = v.toInt();
    higher = Int64(u64 & 0xFFFFFFFF);
    lower = Int64(u64 >> 32);
  }

  Map<String, dynamic> toJson() {
    return {};
  }

  static List<UInt64DTO> listFromJson(List<dynamic> json) {
    return json == null
        ? new List<UInt64DTO>()
        : json.map((value) => new UInt64DTO.fromJson(value)).toList();
  }

  static Map<String, UInt64DTO> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, UInt64DTO>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = new UInt64DTO.fromJson(value));
    }
    return map;
  }

  BigInt toBigInt() {
    var buffer = new Uint8List(8).buffer;
    var bdata = new ByteData.view(buffer);

    bdata.setInt32(0, this.lower.toInt());
    bdata.setInt32(4, this.higher.toInt());

    return decodeBigInt(buffer.asUint8List());
  }
}

/// Decode a BigInt from bytes in big-endian encoding.
BigInt decodeBigInt(List<int> bytes) {
  BigInt result = new BigInt.from(0);
  for (int i = 0; i < bytes.length; i++) {
    result += new BigInt.from(bytes[bytes.length - i - 1]) << (8 * i);
  }
  return result;
}