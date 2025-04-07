import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:janakisoft_health_fitness_app/config/app_config.dart';
import 'package:janakisoft_health_fitness_app/shared/exceptions/app_exception.dart';
import 'package:janakisoft_health_fitness_app/shared/network/rest/rest_service.dart';
import 'package:janakisoft_health_fitness_app/shared/exceptions/exception_handler_mixin.dart';
import 'package:janakisoft_health_fitness_app/shared/models/either.dart';
import 'package:janakisoft_health_fitness_app/shared/models/response.dart' as response;

class DioNetworkService extends RestNetworkService with ExceptionHandlerMixin{
  final Dio dio;
  // final SharedPrefsService pref_ = locator<SharedPrefsService>();

  DioNetworkService(this.dio) {
    if (!kReleaseMode) {
      dio.options = dioBaseOptions;
      if (kDebugMode) {
        dio.interceptors
            .add(LogInterceptor(requestBody: true, responseBody: true));
      }
    }
  }

  BaseOptions get dioBaseOptions => BaseOptions(
    baseUrl: baseUrl,
    headers: headers,
  );
  @override
  String get baseUrl => ApiConstants.baseUrl;

  @override
  Map<String, Object> get headers => {
    'accept': 'application/json',
    'content-type': 'application/json',
  };

  @override
  Map<String, dynamic>? updateHeader(Map<String, dynamic> data) {
    final header = {...data, ...headers};
    if (!kReleaseMode) {
      dio.options.headers = header;
    }
    return header;
  }

  @override
  Future<Either<AppException, response.Response>> post(String endpoint,
      {Map<String, dynamic>? data}) {
    final res = handleException(
          () => dio.post(
        endpoint,
        data: data,
      ),
      endpoint: endpoint,
    );
    return res;
  }

  @override
  Future<Either<AppException, response.Response>> get(String endpoint,
      {Map<String, dynamic>? queryParameters}) {
    final res = handleException(
          () => dio.get(
        endpoint,
        queryParameters: queryParameters,
      ),
      endpoint: endpoint,
    );
    return res;
  }
}
