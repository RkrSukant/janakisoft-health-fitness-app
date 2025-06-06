// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i16;
import 'package:flutter/material.dart' as _i17;
import 'package:janakisoft_health_fitness_app/features/auth/presentation/screens/forgot_password/enter_otp_screen.dart'
    as _i4;
import 'package:janakisoft_health_fitness_app/features/auth/presentation/screens/forgot_password/forgot_password_screen.dart'
    as _i7;
import 'package:janakisoft_health_fitness_app/features/auth/presentation/screens/login_screen.dart'
    as _i9;
import 'package:janakisoft_health_fitness_app/features/auth/presentation/screens/register_screen.dart'
    as _i11;
import 'package:janakisoft_health_fitness_app/features/cardio/screens/cardio_main_screen.dart'
    as _i1;
import 'package:janakisoft_health_fitness_app/features/common/presentation/screens/common_home_screen.dart'
    as _i2;
import 'package:janakisoft_health_fitness_app/features/dashboard/presentation/screens/dashboard_screen.dart'
    as _i3;
import 'package:janakisoft_health_fitness_app/features/exercise/data/model/workout_model.dart'
    as _i18;
import 'package:janakisoft_health_fitness_app/features/exercise/presentation/screens/exercise_detail_screen.dart'
    as _i5;
import 'package:janakisoft_health_fitness_app/features/exercise/presentation/screens/exercise_workout_detail_screen.dart'
    as _i6;
import 'package:janakisoft_health_fitness_app/features/exercise/presentation/screens/workout_list_screen.dart'
    as _i15;
import 'package:janakisoft_health_fitness_app/features/landing/presentation/screens/landing_screen.dart'
    as _i8;
import 'package:janakisoft_health_fitness_app/features/landing/presentation/screens/splash_screen.dart'
    as _i14;
import 'package:janakisoft_health_fitness_app/features/onboarding/presentation/screens/onboarding_screen.dart'
    as _i10;
import 'package:janakisoft_health_fitness_app/features/skin_care/screens/skin_care_main_screen.dart'
    as _i12;
import 'package:janakisoft_health_fitness_app/features/skin_care/screens/skin_care_survey_screen.dart'
    as _i13;

abstract class $AppRouter extends _i16.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i16.PageFactory> pagesMap = {
    CardioMainRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CardioMainScreen(),
      );
    },
    CommonHomeRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.CommonHomeScreen(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.DashboardScreen(),
      );
    },
    EnterOTPRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.EnterOTPScreen(),
      );
    },
    ExerciseDetailRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.ExerciseDetailScreen(),
      );
    },
    ExerciseWorkoutDetailRoute.name: (routeData) {
      final args = routeData.argsAs<ExerciseWorkoutDetailRouteArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.ExerciseWorkoutDetailScreen(
          key: args.key,
          workoutModel: args.workoutModel,
        ),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.ForgotPasswordScreen(),
      );
    },
    LandingRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.LandingScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.LoginScreen(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.OnboardingScreen(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.RegisterScreen(),
      );
    },
    SkinCareMainRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.SkinCareMainScreen(),
      );
    },
    SkinCareSurveyRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.SkinCareSurveyScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.SplashScreen(),
      );
    },
    WorkoutListRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.WorkoutListScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.CardioMainScreen]
class CardioMainRoute extends _i16.PageRouteInfo<void> {
  const CardioMainRoute({List<_i16.PageRouteInfo>? children})
      : super(
          CardioMainRoute.name,
          initialChildren: children,
        );

  static const String name = 'CardioMainRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CommonHomeScreen]
class CommonHomeRoute extends _i16.PageRouteInfo<void> {
  const CommonHomeRoute({List<_i16.PageRouteInfo>? children})
      : super(
          CommonHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'CommonHomeRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i3.DashboardScreen]
class DashboardRoute extends _i16.PageRouteInfo<void> {
  const DashboardRoute({List<_i16.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i4.EnterOTPScreen]
class EnterOTPRoute extends _i16.PageRouteInfo<void> {
  const EnterOTPRoute({List<_i16.PageRouteInfo>? children})
      : super(
          EnterOTPRoute.name,
          initialChildren: children,
        );

  static const String name = 'EnterOTPRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i5.ExerciseDetailScreen]
class ExerciseDetailRoute extends _i16.PageRouteInfo<void> {
  const ExerciseDetailRoute({List<_i16.PageRouteInfo>? children})
      : super(
          ExerciseDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExerciseDetailRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ExerciseWorkoutDetailScreen]
class ExerciseWorkoutDetailRoute
    extends _i16.PageRouteInfo<ExerciseWorkoutDetailRouteArgs> {
  ExerciseWorkoutDetailRoute({
    _i17.Key? key,
    required _i18.WorkoutModel workoutModel,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          ExerciseWorkoutDetailRoute.name,
          args: ExerciseWorkoutDetailRouteArgs(
            key: key,
            workoutModel: workoutModel,
          ),
          initialChildren: children,
        );

  static const String name = 'ExerciseWorkoutDetailRoute';

  static const _i16.PageInfo<ExerciseWorkoutDetailRouteArgs> page =
      _i16.PageInfo<ExerciseWorkoutDetailRouteArgs>(name);
}

class ExerciseWorkoutDetailRouteArgs {
  const ExerciseWorkoutDetailRouteArgs({
    this.key,
    required this.workoutModel,
  });

  final _i17.Key? key;

  final _i18.WorkoutModel workoutModel;

  @override
  String toString() {
    return 'ExerciseWorkoutDetailRouteArgs{key: $key, workoutModel: $workoutModel}';
  }
}

/// generated route for
/// [_i7.ForgotPasswordScreen]
class ForgotPasswordRoute extends _i16.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i16.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i8.LandingScreen]
class LandingRoute extends _i16.PageRouteInfo<void> {
  const LandingRoute({List<_i16.PageRouteInfo>? children})
      : super(
          LandingRoute.name,
          initialChildren: children,
        );

  static const String name = 'LandingRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i9.LoginScreen]
class LoginRoute extends _i16.PageRouteInfo<void> {
  const LoginRoute({List<_i16.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i10.OnboardingScreen]
class OnboardingRoute extends _i16.PageRouteInfo<void> {
  const OnboardingRoute({List<_i16.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i11.RegisterScreen]
class RegisterRoute extends _i16.PageRouteInfo<void> {
  const RegisterRoute({List<_i16.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i12.SkinCareMainScreen]
class SkinCareMainRoute extends _i16.PageRouteInfo<void> {
  const SkinCareMainRoute({List<_i16.PageRouteInfo>? children})
      : super(
          SkinCareMainRoute.name,
          initialChildren: children,
        );

  static const String name = 'SkinCareMainRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i13.SkinCareSurveyScreen]
class SkinCareSurveyRoute extends _i16.PageRouteInfo<void> {
  const SkinCareSurveyRoute({List<_i16.PageRouteInfo>? children})
      : super(
          SkinCareSurveyRoute.name,
          initialChildren: children,
        );

  static const String name = 'SkinCareSurveyRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i14.SplashScreen]
class SplashRoute extends _i16.PageRouteInfo<void> {
  const SplashRoute({List<_i16.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i15.WorkoutListScreen]
class WorkoutListRoute extends _i16.PageRouteInfo<void> {
  const WorkoutListRoute({List<_i16.PageRouteInfo>? children})
      : super(
          WorkoutListRoute.name,
          initialChildren: children,
        );

  static const String name = 'WorkoutListRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}
