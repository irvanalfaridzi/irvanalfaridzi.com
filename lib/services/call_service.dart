import 'package:alfaridzi_me/services/api_client.dart';
import 'package:alfaridzi_me/services/locator.dart';
import 'package:alfaridzi_me/utils/config.dart';
import 'package:alfaridzi_me/utils/constant.dart';
import 'package:alfaridzi_me/utils/utility.dart';
import 'package:dio/dio.dart';

class CallService {
  var apiClient = locator<ApiClient>();
  CallService();

  Future<Response<dynamic>> connect(
      String path, Map<String, dynamic> data, String method) async {
    try {
      Response<dynamic> response;
      var json = data;

      if (Constant.showLog) Config.log('paramsss $json');

      switch (method) {
        case Constant.get:
          response = await apiClient.get(path, json);
          break;
        case Constant.post:
          response = await apiClient.post(path, json);
          break;
        default:
          response = await apiClient.post(path, json);
      }
      return response;
    } on DioError catch (e) {
      if (Constant.showLog) Config.log(Utility.handleError(e));
      throw Exception(Utility.handleError(e));
    }
  }
}
