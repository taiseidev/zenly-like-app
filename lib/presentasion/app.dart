import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zenly_like_app/feature/auth/auth.dart';
import 'package:zenly_like_app/presentasion/home/home_page.dart';
import 'package:zenly_like_app/presentasion/top/top_page.dart';

class App extends HookConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authUserProvider);
    return MaterialApp(
      title: 'Zenly-Like-Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: authState.when(
        data: (authState) {
          if (authState != null) {
            return HomePage();
          }
          return const TopPage();
        },
        error: (error, stackTrace) {},
        loading: () {},
      ),
    );
  }
}
