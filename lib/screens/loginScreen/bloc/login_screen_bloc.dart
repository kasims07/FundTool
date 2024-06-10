import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

import '../../../api_models/api_error.dart';
import '../../../api_models/api_status.dart';
import '../model/login_screen_model.dart';
import '../repository/login_screen_repository.dart';

part 'login_screen_event.dart';
part 'login_screen_state.dart';

class LoginScreenBloc extends Bloc<LoginScreenEvent, LoginScreenState> {
  final _loginRepository = GetIt.I<LoginRepository>();
  LoginScreenBloc() : super(LoginScreenState()) {
    on<PerformLoginScreenEvent>(_performSignup);
  }
  void _performSignup(PerformLoginScreenEvent event, Emitter<LoginScreenState> emit) async {
    emit(LoginScreenState(isLoading: true));

    final response = await _loginRepository.login(event.data);
    print('REPONSE_STATUS ${response.status}');
    if (response.status == ApiStatus.success) {
      print('REPONSE_STATUS ${response.status}');
      emit(LoginScreenState(
        isCompleted: true,
        isLoading: false,
        model: response.data,
      ));
    } else {
      emit(LoginScreenState(
        error: response.error,
        errorMsg: response.errorMsg,
        isFailed: true,
        isLoading: false,
        isCompleted: false,
      ));
    }
  }
}
