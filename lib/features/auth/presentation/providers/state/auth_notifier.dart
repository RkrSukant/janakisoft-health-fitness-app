import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:janakisoft_health_fitness_app/di/service_locator.dart';
import 'package:janakisoft_health_fitness_app/features/auth/data/auth_repository.dart';
import 'package:janakisoft_health_fitness_app/features/auth/data/model/login_request.dart';
import 'package:janakisoft_health_fitness_app/shared/enums/data_state_helper.dart';
import 'package:janakisoft_health_fitness_app/shared/exceptions/parse_error.dart';
import 'package:janakisoft_health_fitness_app/shared/models/state_notifier_common_state.dart';

class AuthNotifier extends StateNotifier<StateNotifierCommonState> {
  final AuthRepository repository = locator<AuthRepository>();
  final Ref ref;

  AuthNotifier(this.ref) : super(const StateNotifierCommonState.initial());

  Future<void> login(LoginRequest request) async{
    state = const StateNotifierCommonState(state: DataConcreteState.loading);
    try{
      var response = await repository.login(request);
      state = StateNotifierCommonState(state: DataConcreteState.loaded, data: response);
    }catch(error){
      state = StateNotifierCommonState(state: DataConcreteState.failure, errorMessage: parseError(error));
    }
  }
}
