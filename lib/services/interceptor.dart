import 'package:alfaridzi_me/utils/config.dart';
import 'package:alfaridzi_me/utils/constant.dart';
import 'package:alfaridzi_me/utils/utility.dart';
import 'package:dio/dio.dart';

class AppInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    Config.log('Uri: ${options.uri}');
    Config.log('Header: ${options.headers}');
    Config.log('Path: ${options.path}');
    Config.log('Request: ${options.data}');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (Constant.showLog) Config.log(response.toString());
    if (Constant.showLog) Config.log("<-- END HTTP");

    final result = response.data;
    String message = '';
    try {
      if (result.containsKey('errorCode')) {
        if (result.containsKey('fullMessage')) {
          message = result['fullMessage'] as String;
        }
      }
    } catch (e) {
      Config.log('Error: ${e.toString()}');
    }
    if (message.isNotEmpty) {
      handler.reject(
          DioError(requestOptions: response.requestOptions, error: message),
          false);
    }
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    Config.log(
        'ERROR: [${err.response?.statusCode}, ${err.response?.statusMessage}, ${err.type}, ${err.response?.data}]');
    if (err.message.contains(Constant.rTIMEOUT)) {
      err.type = DioErrorType.cancel;
      err.error = Utility.handleError(err);
    } else if (err.message.contains(Constant.rREFUSED)) {
      err.type = DioErrorType.cancel;
      err.error = Utility.handleError(err);
    } else if (err.message.contains(Constant.rFAILED)) {
      err.type = DioErrorType.cancel;
      err.error = Utility.handleError(err);
    } else if (err.message.contains(Constant.rSOCKETEXC)) {
      err.type = DioErrorType.cancel;
      err.error = Utility.handleError(err);
    } else if (err.message.contains(Constant.rEXCEPT)) {
      err.error = Utility.handleError(err);
    } else {
      err.error = Constant.errSERVER;
    }
    return super.onError(err, handler);
  }
}
