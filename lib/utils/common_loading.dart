import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';

// ローディングの呼び出し
// ref.read(loadingServiceProvider.notifier).wrap(
//   Futureメソッド
// );

final loadingServiceProvider =
    StateNotifierProvider<LoadingService, bool>((ref) {
  return LoadingService();
});

/// LoadingService represents interfaces to control the progress indicator.
class LoadingService extends StateNotifier<bool> {
  LoadingService() : super(false);

  int _count = 0;

  /// Wrap the a future completed value and show / hide the loader before and after processing.
  Future<T> wrap<T>(Future<T> future) async {
    _present();
    try {
      return await future;
    } finally {
      _dismiss();
    }
  }

  void _present() {
    _count = _count + 1;
    // Set the state to true.
    state = true;
  }

  void _dismiss() {
    _count = _count - 1;
    // Set the state to false only if all processing requiring a loader has been completed.
    if (_count == 0) {
      state = false;
    }
  }
}

class CommonLoading extends StatelessWidget {
  const CommonLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Center(
        child: Lottie.network(
          'https://assets5.lottiefiles.com/packages/lf20_nJvMWQ.json',
          width: 100,
        ),
      ),
    );
  }
}
