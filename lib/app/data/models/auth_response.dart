// lib/models/auth_response.dart

class AuthResponse {
  final String? token;
  final int? id;
  final String? error;

  AuthResponse({this.token, this.id, this.error});

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      token: json['token'],
      id: json['id'],
      error: json['error'],
    );
  }
}
