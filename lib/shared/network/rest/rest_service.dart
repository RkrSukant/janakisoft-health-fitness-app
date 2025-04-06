import 'package:sukant_flutter_boilerplate/shared/exceptions/app_exception.dart';
import 'package:sukant_flutter_boilerplate/shared/models/either.dart';
import 'package:sukant_flutter_boilerplate/shared/models/response.dart';

abstract class RestNetworkService{
  String get baseUrl;

  Map<String,Object> get headers;

  void updateHeader(Map<String, dynamic> data);

  Future<Either<AppException, Response>> get(
      String endpoint, {
        Map<String, dynamic>? queryParameters,
      });

  Future<Either<AppException, Response>> post(
      String endpoint, {
        Map<String, dynamic>? data,
      });
}