import 'dart:convert';

class RegistrationCredentials {
  final String? email;
  final String? nickname;
  final String? phone;
  final String? password;

  const RegistrationCredentials({
    this.email,
    this.nickname,
    this.phone,
    this.password,
  });

  RegistrationCredentials copyWith({
    String? email,
    String? nickname,
    String? phone,
    String? password,
  }) {
    return RegistrationCredentials(
      email: email ?? this.email,
      nickname: nickname ?? this.nickname,
      phone: phone ?? this.phone,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (email != null) {
      result.addAll({'email': email});
    }
    if (nickname != null) {
      result.addAll({'nickname': nickname});
    }
    if (phone != null) {
      result.addAll({'phone': phone});
    }
    if (password != null) {
      result.addAll({'password': password});
    }

    return result;
  }

  factory RegistrationCredentials.fromMap(Map<String, dynamic> map) {
    return RegistrationCredentials(
      email: map['email'],
      nickname: map['nickname'],
      phone: map['phone'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RegistrationCredentials.fromJson(String source) => RegistrationCredentials.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RegistrationCredentials(email: $email, nickname: $nickname, phone: $phone, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RegistrationCredentials &&
        other.email == email &&
        other.nickname == nickname &&
        other.phone == phone &&
        other.password == password;
  }

  @override
  int get hashCode {
    return email.hashCode ^ nickname.hashCode ^ phone.hashCode ^ password.hashCode;
  }
}
