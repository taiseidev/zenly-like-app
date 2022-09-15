import 'package:dio/dio.dart';

/// ヘッダーに認証情報等を付加
class HeaderInterceptor extends Interceptor {
  HeaderInterceptor([this.overwriteUrl]);

  String? overwriteUrl;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    // baseUrlを上書き？
    options.headers['Referrer'] = overwriteUrl ?? options.baseUrl;
    options.headers['Origin'] = options.baseUrl;
    options.headers['Accept'] = '';
    // BearerToken等がある場合はここで指定
    // if ($.isNotEmpty) {
    //   options.headers['Authorization'] = 'token $';
    // }
    return handler.next(options);
  }
}
