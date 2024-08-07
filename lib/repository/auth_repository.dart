import 'package:provider_mvvm_demo/data/network/base_api_services.dart';
import 'package:provider_mvvm_demo/data/network/network_api_services.dart';
import 'package:provider_mvvm_demo/res/app_url.dart';

class AuthRepository {
  BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.loginEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> signUpApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.registerEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
