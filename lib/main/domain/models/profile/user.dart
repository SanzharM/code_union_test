import 'dart:convert';

class User {
  final int? id;
  final String? nickname;
  final String? email;

  const User({
    this.id,
    this.nickname,
    this.email,
  });

  User copyWith({
    int? id,
    String? nickname,
    String? email,
  }) {
    return User(
      id: id ?? this.id,
      nickname: nickname ?? this.nickname,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (nickname != null) {
      result.addAll({'nickname': nickname});
    }
    if (email != null) {
      result.addAll({'email': email});
    }

    return result;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id']?.toInt(),
      nickname: map['nickname'],
      email: map['email'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() => 'User(id: $id, nickname: $nickname, email: $email)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User && other.id == id && other.nickname == nickname && other.email == email;
  }

  @override
  int get hashCode => id.hashCode ^ nickname.hashCode ^ email.hashCode;
}
