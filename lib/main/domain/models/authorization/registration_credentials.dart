class RegistrationCredentials {
  final String email;
  final String nickname;
  final String phone;
  final String password;

  const RegistrationCredentials({
    required this.email,
    required this.nickname,
    required this.phone,
    required this.password,
  });

  RegistrationCredentials copyWith({String? email, String? nickname, String? phone, String? password}) {
    return RegistrationCredentials(
      email: email ?? this.email,
      nickname: nickname ?? this.nickname,
      phone: phone ?? this.phone,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() => {
        'email': email,
        'nickname': nickname,
        'phone': phone,
        'password': password,
      };

  bool get isValid =>
      (email.isNotEmpty && email.contains('@')) && nickname.isNotEmpty && (phone.isNotEmpty && phone.length == 11) && isPasswordValid;

  bool get isPasswordValid => password.isNotEmpty && password.length >= 8;
}
