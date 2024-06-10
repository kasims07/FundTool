import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:fundtool_app/constants/app_constants.dart';
import 'package:fundtool_app/screens/homeScreen/model/home_model.dart';
import 'package:fundtool_app/utils/app_helper.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../api_models/api_error.dart';
import '../../../api_models/api_status.dart';
import '../../../utils/alert_utils.dart';
import '../repository/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final _repository = GetIt.I<HomeRepository>();
  HomeBloc() : super(HomeState()) {
    on<PerformHomeEvent>(_performSignup);
  }
  void _performSignup(PerformHomeEvent event, Emitter<HomeState> emit) async {
    emit(HomeState(isLoading: true));
    var internet = await AppHelper.checkInternet();
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (internet) {
      final response = await _repository.home();
      print('REPONSE_STATUS ${response.status}');
      if (response.status == ApiStatus.success) {
        print('REPONSE_STATUS ${response.status}');
        emit(HomeState(
          isCompleted: true,
          isLoading: false,
          model: response.data,
        ));
      } else {
        emit(HomeState(
          error: response.error,
          errorMsg: response.errorMsg,
          isFailed: true,
          isLoading: false,
          isCompleted: false,
        ));
      }
    } else {
      var data = pref.getString(AppConstants.homeData);
      if (data != null) {
        Map<String, dynamic> deviceMap = jsonDecode(data) as Map<String, dynamic>;
        var deviceDetails = HomeModel.fromJson(deviceMap);
        emit(HomeState(
          isCompleted: true,
          isLoading: false,
          model: deviceDetails,
        ));
      } else {
        emit(HomeState(
          errorMsg: "Please check internet connection.",
          isFailed: true,
          isLoading: false,
          isCompleted: false,
        ));
      }
    }
  }
}
