part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {
  const HomeEvent();
}

class PerformHomeEvent extends HomeEvent {
  PerformHomeEvent();
}
