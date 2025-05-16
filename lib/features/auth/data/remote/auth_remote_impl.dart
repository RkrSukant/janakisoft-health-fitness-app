import 'package:janakisoft_health_fitness_app/features/auth/data/model/login_request.dart';
import 'package:janakisoft_health_fitness_app/features/auth/data/model/login_response.dart';
import 'package:janakisoft_health_fitness_app/features/auth/data/remote/auth_remote.dart';

class AuthRemoteImpl implements AuthRemote {
  @override
  Future<LoginResponse> login(LoginRequest request) async{
    Future.delayed(const Duration(milliseconds: 2000));
    return LoginResponse(user: "Testing");
  }
}