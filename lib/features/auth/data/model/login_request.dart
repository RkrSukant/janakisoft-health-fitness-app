class LoginRequest {
  String username;
  String password;
  String version;
  String? firebaseToken;

  LoginRequest({
    required this.username,
    required this.password,
    required this.version,
    this.firebaseToken,
  });
}