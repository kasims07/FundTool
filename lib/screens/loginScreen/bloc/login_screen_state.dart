part of 'login_screen_bloc.dart';

class LoginScreenState {
  final bool isLoading;
  final ApiError? error;
  final String? errorMsg;
  final bool isCompleted;
  final bool isFailed;
  final LoginModel? model;

  LoginScreenState({
    this.isLoading = false,
    this.error,
    this.errorMsg = '',
    this.isCompleted = false,
    this.isFailed = false,
    this.model,
  });
}
