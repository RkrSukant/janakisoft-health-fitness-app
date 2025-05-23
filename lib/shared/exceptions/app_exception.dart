import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:janakisoft_health_fitness_app/shared/models/either.dart';
import 'package:janakisoft_health_fitness_app/shared/models/response.dart';

class AppException implements IOException {
  final String message;
  final int statusCode;
  final String identifier;

  AppException({required this.message, required this.statusCode, required this.identifier});

  @override
  String toString() {
    return 'statusCode=$statusCode\nmessage=$message\nidentifier=$identifier';
  }
}

class CacheFailureException extends Equatable implements AppException {
  @override
  String get identifier => 'Cache failure exception';

  @override
  String get message => 'Unable to save user';

  @override
  int get statusCode => 100;

  @override
  List<Object?> get props => [message, statusCode, identifier];
}

//  extension

extension HttpExceptionExtension on AppException {
  Left<AppException, Response> get toLeft => Left<AppException, Response>(this);
}
