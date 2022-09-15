import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

/// レスポンスのサマリーをコンソールに出力する
class ResponseInterceptor extends Interceptor {
  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    final requestOptions = response.requestOptions;
    debugPrint('*** Response ***');
    final stringBuffer = StringBuffer()
      ..writeln(
        '${requestOptions.method} '
        '${requestOptions.baseUrl}${requestOptions.path}',
      )
      ..writeln('${response.statusCode} ${response.statusMessage}');
    debugPrint(stringBuffer.toString());
    super.onResponse(response, handler);
  }
}
