import 'dart:convert';

class Coordinates {
  final int? id;
  final double? latitude;
  final double? longitude;
  final String? addressName;

  const Coordinates({
    this.id,
    this.latitude,
    this.longitude,
    this.addressName,
  });

  Coordinates copyWith({
    int? id,
    double? latitude,
    double? longitude,
    String? addressName,
  }) {
    return Coordinates(
      id: id ?? this.id,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      addressName: addressName ?? this.addressName,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (latitude != null) {
      result.addAll({'latitude': latitude});
    }
    if (longitude != null) {
      result.addAll({'longitude': longitude});
    }
    if (addressName != null) {
      result.addAll({'address_name': addressName});
    }

    return result;
  }

  factory Coordinates.fromMap(Map<String, dynamic> map) {
    return Coordinates(
      id: map['id']?.toInt(),
      latitude: map['latitude']?.toDouble(),
      longitude: map['longitude']?.toDouble(),
      addressName: map['address_name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Coordinates.fromJson(String source) => Coordinates.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Coordinates(id: $id, latitude: $latitude, longitude: $longitude, addressName: $addressName)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Coordinates &&
        other.id == id &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.addressName == addressName;
  }

  @override
  int get hashCode {
    return id.hashCode ^ latitude.hashCode ^ longitude.hashCode ^ addressName.hashCode;
  }
}
