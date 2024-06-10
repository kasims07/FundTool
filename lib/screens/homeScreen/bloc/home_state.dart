part of 'home_bloc.dart';

@immutable
class HomeState {
  final bool isLoading;
  final ApiError? error;
  final String? errorMsg;
  final bool isCompleted;
  final bool isFailed;
  final HomeModel? model;

  HomeState({
    this.isLoading = false,
    this.error,
    this.errorMsg = '',
    this.isCompleted = false,
    this.isFailed = false,
    this.model,
  });
}
