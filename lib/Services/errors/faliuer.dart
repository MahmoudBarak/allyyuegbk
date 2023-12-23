import 'package:dio/dio.dart';

abstract class Failure{
  final String errMassage;

  Failure(this.errMassage);
}
class ServerFailure extends Failure {
  ServerFailure(String errMassage) : super(errMassage);
  factory ServerFailure.fromDioError(DioException dioError)
  {
    switch(dioError.type) {
      case DioExceptionType.connectionTimeout:
        return(ServerFailure('Connection time out with server' ));
      case DioExceptionType.sendTimeout:
        return(ServerFailure('Send time out with server'));

      case DioExceptionType.receiveTimeout:
        return(ServerFailure('Receive time out with server'));
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad Certificate');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(dioError.response!.statusCode!, dioError.response!.data!);

      case DioExceptionType.cancel:
        return ServerFailure('Request to server was canceled');

      case DioExceptionType.connectionError:
        if(dioError.message!.contains('SocketExceptions')){
          return ServerFailure('no Internet connection');
        }
        return ServerFailure('UnExpected Error');
      case DioExceptionType.unknown:
        return ServerFailure(' Oops UnExpected Error');
      default:
        return ServerFailure('Oops there was an  error,  try again');
    }

  }

  factory ServerFailure.fromResponse(int statusCode,dynamic response)
  {
    if ( statusCode==400 || statusCode==401 ||statusCode==403 ) {
      return ServerFailure('${response}');

    } else if (statusCode==404){
      return ServerFailure('Request not found, Please try later');
    }else if(statusCode==500)
    {
      return ServerFailure('Internal server error, Please try later');
    }else
    {
      return ServerFailure('Oops there was an  error, Please try again');

    }


  }


}