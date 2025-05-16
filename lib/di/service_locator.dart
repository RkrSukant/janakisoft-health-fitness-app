import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:janakisoft_health_fitness_app/features/auth/data/auth_repository.dart';
import 'package:janakisoft_health_fitness_app/features/auth/data/auth_repository_impl.dart';
import 'package:janakisoft_health_fitness_app/features/auth/data/local/auth_local.dart';
import 'package:janakisoft_health_fitness_app/features/auth/data/local/auth_local_impl.dart';
import 'package:janakisoft_health_fitness_app/features/auth/data/remote/auth_remote.dart';
import 'package:janakisoft_health_fitness_app/features/auth/data/remote/auth_remote_impl.dart';
import 'package:janakisoft_health_fitness_app/routes/app_route.dart';
import 'package:janakisoft_health_fitness_app/shared/network/rest/rest_service_impl.dart';
import 'package:janakisoft_health_fitness_app/shared/storage/shared_preferences/shared_preferences_service.dart';
import 'package:janakisoft_health_fitness_app/shared/storage/sqlite/db_manager.dart';

final GetIt locator = GetIt.instance;

Future setUpServiceLocator() async {
  //Shared Preferences
  SharedPreferencesService sharedPrefService =
      await SharedPreferencesService.getInstance();
  locator.registerSingleton(sharedPrefService);

  //Database
  var databaseManager = await DatabaseManager.getDbInstance();
  locator.registerLazySingleton(() => databaseManager);

  //Router
  locator.registerSingleton(AppRouter());

  //Dio
  locator.registerLazySingleton(
    () {
      final Dio dio = Dio();
      return DioNetworkService(dio);
    },
  );

  //Auth
  locator.registerLazySingleton<AuthLocal>(() => AuthLocalImpl());
  locator.registerLazySingleton<AuthRemote>(() => AuthRemoteImpl());
  locator
      .registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
}
