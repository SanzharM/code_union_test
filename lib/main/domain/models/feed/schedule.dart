import 'dart:convert';

class Schedule {
  final int? id;
  final String? opening;
  final String? closing;

  const Schedule({
    this.id,
    this.opening,
    this.closing,
  });

  Schedule copyWith({
    int? id,
    String? opening,
    String? closing,
  }) {
    return Schedule(
      id: id ?? this.id,
      opening: opening ?? this.opening,
      closing: closing ?? this.closing,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (opening != null) {
      result.addAll({'opening': opening});
    }
    if (closing != null) {
      result.addAll({'closing': closing});
    }

    return result;
  }

  factory Schedule.fromMap(Map<String, dynamic> map) {
    return Schedule(
      id: map['id']?.toInt(),
      opening: map['opening'],
      closing: map['closing'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Schedule.fromJson(String source) => Schedule.fromMap(json.decode(source));

  @override
  String toString() => 'Schedule(id: $id, opening: $opening, closing: $closing)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Schedule && other.id == id && other.opening == opening && other.closing == closing;
  }

  @override
  int get hashCode => id.hashCode ^ opening.hashCode ^ closing.hashCode;
}
