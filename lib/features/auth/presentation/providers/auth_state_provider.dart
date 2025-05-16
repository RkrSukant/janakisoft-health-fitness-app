import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:janakisoft_health_fitness_app/features/auth/presentation/providers/state/auth_notifier.dart';
import 'package:janakisoft_health_fitness_app/shared/models/state_notifier_common_state.dart';

final authStateNotifierProvider =
    StateNotifierProvider<AuthNotifier, StateNotifierCommonState>((ref) {
  return AuthNotifier(ref);
});
