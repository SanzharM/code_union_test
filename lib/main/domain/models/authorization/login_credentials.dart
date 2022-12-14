class LoginCredentials {
  final String? login;
  final String? password;

  const LoginCredentials({this.login, this.password});

  LoginCredentials copyWith({String? login, String? password}) {
    return LoginCredentials(
      login: login ?? this.login,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() => {
        'email': login,
        'password': password,
      };

  bool get isValid => (login?.isNotEmpty ?? false) && isPasswordValid;
  bool get isPasswordValid => (password?.isNotEmpty ?? false) && (password?.length ?? 0) >= 8;
}
