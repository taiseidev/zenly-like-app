import 'package:dio/dio.dart';

import '../../models/result.dart';

/// API クライアントの抽象クラス
abstract class AbstractApiClient {
  Future<Result<dynamic>> get(
    String path, {
    required Map<String, dynamic> queryParameters,
    required Map<String, dynamic> header,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  });
}
