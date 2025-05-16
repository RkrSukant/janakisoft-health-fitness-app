
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:janakisoft_health_fitness_app/features/skin_care/screens/skin_care_main_screen.dart';
import 'package:janakisoft_health_fitness_app/routes/router_paths.dart';

import 'app_route.gr.dart';

final appRouterProvider = Provider((ref) => AppRouter());

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter{

  @override
  RouteType get defaultRouteType =>
      const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      initial: true,
      path: Paths.splashScreen,
      page: SplashRoute.page,
    ),
    AutoRoute(
      path: Paths.loginScreen,
      page: LoginRoute.page,
    ),
    AutoRoute(
      path: Paths.registerScreen,
      page: RegisterRoute.page,
    ),
    AutoRoute(
      path: Paths.forgotPasswordScreen,
      page: ForgotPasswordRoute.page,
    ),
    AutoRoute(
      path: Paths.onBoarding,
      page: OnboardingRoute.page,
    ),
    AutoRoute(
      path: Paths.dashboard,
      page: DashboardRoute.page,
    ),
    AutoRoute(
      path: Paths.cardioMain,
      page: CardioMainRoute.page,
    ),
    AutoRoute(
      path: Paths.skinCareMain,
      page: SkinCareMainRoute.page,
    ),
  ];
}