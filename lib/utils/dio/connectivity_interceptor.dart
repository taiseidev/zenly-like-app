import 'package:dio/dio.dart';
import 'package:zenly_like_app/utils/connectivity.dart';

/// ネットワーク接続を確認しネットワーク接続がない場合はエラーを出す
class ConnectivityInterceptor extends Interceptor {
  ConnectivityInterceptor();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (!await isNetworkConnected()) {
      return handler.reject(
        DioError(
          error: 'ネットワーク接続エラー',
          requestOptions: options,
        ),
      );
    }
    return handler.next(options);
  }
}
