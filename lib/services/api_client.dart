import 'package:alfaridzi_me/services/interceptor.dart';
import 'package:alfaridzi_me/utils/config.dart';
import 'package:dio/dio.dart';

class ApiClient {
  late Dio dio;

  ApiClient() {
    dio = Dio();
    dio.options.baseUrl = Config.currentUrl;

    dio.options.headers['Access-Control-Allow-Origin'] = '*';
    dio.options.headers['Access-Control-Allow-Methods'] =
        'GET,PATCH,POST,DELETE';
    dio.options.headers['Access-Control-Allow-Headers'] =
        'Origin, X-Requested-With, Content-Type, Accept';
    dio.options.headers['origin'] = '';
    dio.options.headers['x-requested-with'] = '';
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['Accept'] = 'application/json';
    dio.options.headers['Authorization'] = "Bearer ${Config.apiKey}";
    dio.options.headers['Notion-Version'] = Config.notionVersion;
    dio.interceptors.add(AppInterceptors());
  }

  Future<Response<T>> post<T>(String url, Map<String, dynamic> data) {
    return dio.post(url, data: data);
  }

  Future<Response<T>> get<T>(String url, Map<String, dynamic> data) {
    return dio.get(url, queryParameters: data);
  }
}
