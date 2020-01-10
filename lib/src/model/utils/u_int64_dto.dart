part of xpx_chain_sdk.utils;

class UInt64DTO {
  UInt64DTO([this.higher, this.lower]);

  UInt64DTO.fromJson(json) {
    if (json == null) {
      return;
    }

    higher = Int32(json[0]);
    lower = Int32(json[1]);
  }

  UInt64DTO.fromBigInt(BigInt v) : assert(v != null, 'json must not be null') {
    final u64 = v.toInt();
    higher = Int32(u64 & 0xFFFFFFFF);
    lower = Int32(u64 >> 32);
  }

  Int32 lower, higher;

  static List<UInt64DTO> listFromJson(List<dynamic> json) => json == null
      ? null
      : json.map((value) => UInt64DTO.fromJson(value)).toList();

  static Map<String, UInt64DTO> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    final map = <String, UInt64DTO>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((key, value) => map[key] = UInt64DTO.fromJson(value));
    }
    return map;
  }

  BigInt toBigInt() {
    if (lower == null || higher == null) {
      return null;
    }
    final buffer = Buffer.bigEndian(8)
      ..writeInt32(lower.toInt())
      ..writeInt32(higher.toInt());

    return buffer.toBigInt();
  }

  int toInt() {
    if (lower == null || higher == null) {
      return 0;
    }
    final buffer = Buffer.bigEndian(8)
      ..writeInt32(lower.toInt())
      ..writeInt32(higher.toInt());

    return buffer.position;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['higher'] = higher;
    data['lower'] = lower;
    return data;
  }
}


