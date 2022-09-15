import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zenly_like_app/utils/constants/int.dart';
import 'package:zenly_like_app/utils/dio/header_interceptor.dart';
import 'package:zenly_like_app/utils/dio/request_interceptor.dart';
import 'package:zenly_like_app/utils/dio/response_interceptor.dart';

// Dioの各種設定
final dioProvider = Provider<Dio>((ref) {
  final dio = Dio()
    ..httpClientAdapter = DefaultHttpClientAdapter()
    ..options = BaseOptions(
      baseUrl:
          'https://mreversegeocoder.gsi.go.jp/reverse-geocoder/LonLatToAddress?lat=43.0686718333333&lon=141.351173694444',
      connectTimeout: connectionTimeoutMilliSeconds,
      receiveTimeout: receiveTimeoutMilliSeconds,
      // 特定のステータスコードを回避することができる。
      validateStatus: (_) => true,
    )
    ..interceptors.addAll(<Interceptor>[
      HeaderInterceptor(),
      // デバッグモードでは RequestInterceptor を追加する
      if (kDebugMode) RequestInterceptor(),
      // デバッグモードでは ResponseInterceptor を追加
      if (kDebugMode) ResponseInterceptor(),
    ]);
  return dio;
});
