part of 'login_screen_bloc.dart';

@immutable
abstract class LoginScreenEvent {
  const LoginScreenEvent();
}

class PerformLoginScreenEvent extends LoginScreenEvent {
  final dynamic data;

  PerformLoginScreenEvent({required this.data});
}
