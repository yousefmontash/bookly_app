import 'package:dio/dio.dart';

abstract class Failures {
  final String errorMessage;

  Failures(this.errorMessage);
}

class ServiceFailure extends Failures {
  ServiceFailure(super.errorMessage);

  factory ServiceFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServiceFailure("Connection timeout with ApiServer");
      case DioExceptionType.sendTimeout:
        return ServiceFailure("Send timeout with ApiServer");
      case DioExceptionType.receiveTimeout:
        return ServiceFailure("Receive timeout with ApiServer");
      case DioExceptionType.badResponse:
        return ServiceFailure.fromBadResponse(
            dioException.response!.statusCode, dioException.response);
      case DioExceptionType.cancel:
        return ServiceFailure("Request to ApiServer was Canceled");
      case DioExceptionType.connectionError:
        return ServiceFailure("No internet connection");
      case DioExceptionType.badCertificate:
        return ServiceFailure("Bad certificate, Not trusted request");
      case DioExceptionType.unknown:
        return ServiceFailure("Unexpected error, please try again!");
      default:
        return ServiceFailure("Oops There was an error, please try again!");
    }
  }

  factory ServiceFailure.fromBadResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServiceFailure(response["error"]["message"]);
    } else if (statusCode == 404) {
      return ServiceFailure("Your request not found, try again later!");
    } else if (statusCode == 500) {
      return ServiceFailure("Internal server error, try again later!");
    } else {
      return ServiceFailure("Oops There was an error, please try again!");
    }
  }
}
