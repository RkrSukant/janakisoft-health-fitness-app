// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:janakisoft_health_fitness_app/features/auth/presentation/screens/forgot_password/enter_otp_screen.dart'
    as _i1;
import 'package:janakisoft_health_fitness_app/features/auth/presentation/screens/forgot_password/forgot_password_screen.dart'
    as _i3;
import 'package:janakisoft_health_fitness_app/features/auth/presentation/screens/login_screen.dart'
    as _i4;
import 'package:janakisoft_health_fitness_app/features/auth/presentation/screens/register_screen.dart'
    as _i6;
import 'package:janakisoft_health_fitness_app/features/example/presentation/screens/example_screen.dart'
    as _i2;
import 'package:janakisoft_health_fitness_app/features/landing/presentation/screens/onboarding_screen.dart'
    as _i5;
import 'package:janakisoft_health_fitness_app/features/landing/presentation/screens/splash_screen.dart'
    as _i7;

abstract class $AppRouter extends _i8.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    EnterOTPRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.EnterOTPScreen(),
      );
    },
    ExampleRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ExampleScreen(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.ForgotPasswordScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.LoginScreen(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.OnboardingScreen(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.RegisterScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.EnterOTPScreen]
class EnterOTPRoute extends _i8.PageRouteInfo<void> {
  const EnterOTPRoute({List<_i8.PageRouteInfo>? children})
      : super(
          EnterOTPRoute.name,
          initialChildren: children,
        );

  static const String name = 'EnterOTPRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ExampleScreen]
class ExampleRoute extends _i8.PageRouteInfo<void> {
  const ExampleRoute({List<_i8.PageRouteInfo>? children})
      : super(
          ExampleRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExampleRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ForgotPasswordScreen]
class ForgotPasswordRoute extends _i8.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i8.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LoginScreen]
class LoginRoute extends _i8.PageRouteInfo<void> {
  const LoginRoute({List<_i8.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i5.OnboardingScreen]
class OnboardingRoute extends _i8.PageRouteInfo<void> {
  const OnboardingRoute({List<_i8.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i6.RegisterScreen]
class RegisterRoute extends _i8.PageRouteInfo<void> {
  const RegisterRoute({List<_i8.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i7.SplashScreen]
class SplashRoute extends _i8.PageRouteInfo<void> {
  const SplashRoute({List<_i8.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}
