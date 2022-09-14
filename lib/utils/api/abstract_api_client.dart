import '../../models/result.dart';

/// API クライアントの抽象クラス
abstract class AbstractApiClient {
  Future<Result> get(
    String path, {
    Map<String, dynamic> queryParameters,
    Map<String, dynamic> header,
    // Options options,
    // CancelToken cancelToken,
    // ProgressCallback onReceiveProgress,
  });
}
