abstract class AuthState{}
class AuthInitial extends AuthState{}
class LogInLoading extends AuthState{}
class LogInSuccess extends AuthState{}
class LogInFailure extends AuthState{
  String errorMessage;
  LogInFailure({required this.errorMessage});
}


class RegisterLoading extends AuthState{}
class RegisterSuccess extends AuthState{}
class RegisterFailure extends AuthState{
  String errorMessage;
  RegisterFailure({required this.errorMessage});
}



