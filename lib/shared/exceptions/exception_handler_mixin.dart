import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:janakisoft_health_fitness_app/shared/exceptions/app_exception.dart';
import 'package:janakisoft_health_fitness_app/shared/models/either.dart';
import 'package:janakisoft_health_fitness_app/shared/models/response.dart' as response;
import 'package:janakisoft_health_fitness_app/shared/network/rest/rest_service.dart';

mixin ExceptionHandlerMixin on RestNetworkService {
  Future<Either<AppException, response.Response>>
  handleException<T extends Object>(
      Future<Response<dynamic>> Function() handler,
      {String endpoint = ''}) async {
    try {
      final res = await handler();
      return Right(
        response.Response(
          statusCode: res.statusCode ?? 200,
          data: res.data,
          statusMessage: res.statusMessage,
        ),
      );
    } catch (e) {
      String message = '';
      String identifier = '';
      int statusCode = 0;
      log(e.runtimeType.toString());
      switch (e.runtimeType) {
        case SocketException _:
          e as SocketException;
          message = 'Unable to connect to the server.';
          statusCode = 0;
          identifier = 'Socket Exception ${e.message}\n at  $endpoint';
          break;

        case DioException _:
          e as DioException;
          message = e.response?.data?['message'] ?? 'Internal Error occurred';
          statusCode = 1;
          identifier = 'DioException ${e.message} \nat  $endpoint';
          break;

        default:
          message = 'Unknown error occurred';
          statusCode = 2;
          identifier = 'Unknown error ${e.toString()}\n at $endpoint';
      }
      return Left(
        AppException(
          message: message,
          statusCode: statusCode,
          identifier: identifier,
        ),
      );
    }
  }
}