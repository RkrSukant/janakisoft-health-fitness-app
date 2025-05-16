import 'package:janakisoft_health_fitness_app/features/auth/data/model/login_request.dart';
import 'package:janakisoft_health_fitness_app/features/auth/data/model/login_response.dart';

abstract class AuthRemote {
  Future<LoginResponse> login(LoginRequest request);
}
