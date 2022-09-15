// インターネットの接続状況をチェック
import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> isNetworkConnected() async {
  final result = await Connectivity().checkConnectivity();
  return result != ConnectivityResult.none;
}
