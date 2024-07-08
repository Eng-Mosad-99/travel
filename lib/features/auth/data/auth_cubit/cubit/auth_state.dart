class AuthState {}

final class AuthInitial extends AuthState {}

final class SignUpLoading extends AuthState {}

final class SignUpSuccessful extends AuthState {}

final class SingUpFailure extends AuthState {
  final String errorMessage;

  SingUpFailure(this.errorMessage);
}

final class SignInLoading extends AuthState {}

final class SignInSuccessful extends AuthState {}

final class SingInFailure extends AuthState {
  final String errorMessage;

  SingInFailure(this.errorMessage);
}

final class ResetPasswordLoading extends AuthState {}

final class ResetPasswordSuccessful extends AuthState {}

final class ResetPasswordFailure extends AuthState {
  final String errorMessage;

  ResetPasswordFailure(this.errorMessage);
}

final class ObscurePasswordTextUpdateState extends AuthState {}
