import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zenly_like_app/models/result.dart';
import 'package:zenly_like_app/utils/api/abstract_api_client.dart';
import 'package:zenly_like_app/utils/dio/dio.dart';

final apiClientProvider = Provider<ApiClient>((ref) => ApiClient(ref.read));

class ApiClient implements AbstractApiClient {
  ApiClient(this._read);
  final Reader _read;

  @override
  Future<Result<dynamic>> get(
    String path, {
    required Map<String, dynamic> queryParameters,
    required Map<String, dynamic> header,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _read(dioProvider).get<dynamic>(path);
      return _parseResponse(response);
    } on DioError catch (dioError) {
      return Result<dynamic>.failure(Error());
    }
  }

  /// Dio の Response を受け取り、
  /// ステータスコードと success を確認して問題があれば例外をスローする。
  /// 問題がなければ dynamic 型のレスポンスボディを BaseResponseData に変換して返す。
  Result<dynamic> _parseResponse(Response<dynamic> response) {
    final statusCode = response.statusCode;

    if (statusCode == '200') {
      return Result<dynamic>.success(response.data);
    }
    return Result<dynamic>.failure(Error());
  }
}
