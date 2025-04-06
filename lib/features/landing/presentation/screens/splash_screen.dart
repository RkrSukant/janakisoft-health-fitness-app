import 'package:auto_route/auto_route.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sukant_flutter_boilerplate/di/service_locator.dart';
import 'package:sukant_flutter_boilerplate/routes/route_util.dart';
import 'package:sukant_flutter_boilerplate/routes/router_paths.dart';
import 'package:sukant_flutter_boilerplate/shared/enums/toast_type.dart';
import 'package:sukant_flutter_boilerplate/shared/helpers/dimens.dart';
import 'package:sukant_flutter_boilerplate/shared/helpers/extensions.dart';
import 'package:sukant_flutter_boilerplate/shared/helpers/strings.dart';
import 'package:sukant_flutter_boilerplate/shared/helpers/utils.dart';
import 'package:sukant_flutter_boilerplate/shared/storage/shared_preferences/shared_preferences_service.dart';

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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              addVerticalSpace(Dimens.spacing_40),
              const Icon(
                Icons.android_rounded,
                size: Dimens.spacing_40,
              ),
              addVerticalSpace(Dimens.spacing_16),
              const Expanded(child: SizedBox()),
              const Text(Strings.appBy)
            ],
          ),
        ),
      ),
    );
  }

  void initTimer() async {
    if (await checkInternetConnection()) {
      await Future.delayed(const Duration(seconds: 50));
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
