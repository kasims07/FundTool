import '../../../api_models/api_response.dart';
import '../model/home_model.dart';

abstract class HomeRepository {
  Future<ApiResponse<HomeModel>> home();
}
