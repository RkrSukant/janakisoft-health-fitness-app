import 'package:auto_route/auto_route.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:janakisoft_health_fitness_app/di/service_locator.dart';
import 'package:janakisoft_health_fitness_app/routes/route_util.dart';
import 'package:janakisoft_health_fitness_app/routes/router_paths.dart';
import 'package:janakisoft_health_fitness_app/shared/enums/toast_type.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/dimens.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/extensions.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/strings.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/utils.dart';
import 'package:janakisoft_health_fitness_app/shared/storage/shared_preferences/shared_preferences_service.dart';
import 'package:lottie/lottie.dart';

@RoutePage()
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  final SharedPreferencesService sharedPrefManager =
      locator<SharedPreferencesService>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        initTimer();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Dimens.spacing_16),
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    addVerticalSpace(Dimens.spacing_120),
                    const Icon(
                      Icons.android_rounded,
                      size: Dimens.spacing_40,
                    ),
                    addVerticalSpace(Dimens.spacing_16),
                    const Text(Strings.appName),
                    const Expanded(child: SizedBox(),),
                  ],
                ),
              ),
              Align(alignment: Alignment.bottomCenter,child: Text(Strings.appBy))
            ],
          ),
        ),
      ),
    );
  }

  void initTimer() async {
    if (await checkInternetConnection()) {
      await Future.delayed(const Duration(seconds: 500));
      navigate();
    } else {
      if (!mounted) return;
      context.showToast(Strings.noInternetError, ToastType.error);
      await Future.delayed(const Duration(seconds: 3));
      navigate();
    }
  }

  Future<void> navigate() async {
    context.replaceRouteTo(Paths.loginScreen);
  }

  Future<bool> checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }
}
