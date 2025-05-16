import 'package:janakisoft_health_fitness_app/di/service_locator.dart';
import 'package:janakisoft_health_fitness_app/features/auth/data/auth_repository.dart';
import 'package:janakisoft_health_fitness_app/features/auth/data/model/login_request.dart';
import 'package:janakisoft_health_fitness_app/features/auth/data/model/login_response.dart';
import 'package:janakisoft_health_fitness_app/features/auth/data/remote/auth_remote.dart';

class AuthRepositoryImpl implements AuthRepository {

  final AuthRemote _remote = locator<AuthRemote>();

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async{
    return await _remote.login(loginRequest);
  }
}