import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sukant_flutter_boilerplate/di/service_locator.dart';
import 'package:sukant_flutter_boilerplate/routes/app_route.dart';
import 'package:sukant_flutter_boilerplate/shared/helpers/app_theme.dart';
import 'package:sukant_flutter_boilerplate/shared/helpers/strings.dart';
import 'di/service_locator.dart' as di;

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.setUpServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final appRoute = locator<AppRouter>();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(child: Consumer(builder: (context, ref, child) {
      return MaterialApp.router(
        builder: EasyLoading.init(),
        debugShowCheckedModeBanner: false,
        title: Strings.appName,
        theme: AppTheme.define(),
        // routerConfig: ref.read(appRouterProvider).config(),
        routerConfig: appRoute.config(),
      );
    }));
  }
}
