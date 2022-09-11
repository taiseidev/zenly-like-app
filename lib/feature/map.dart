import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 現在地を取得
final getCurrentPositionProvider = FutureProvider<CameraPosition>(
  (ref) async {
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    return CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: 1,
    );
  },
);

final controllerProvider = Provider.autoDispose(
  (_) => Completer<GoogleMapController>(),
);

// 現在地にカメラを移動
final moveCurrentPositionProvider =
    FutureProvider.autoDispose<void>((ref) async {
  final position = await ref.read(getCurrentPositionProvider.future);
  final controller = await ref.read(controllerProvider).future;
  await controller.animateCamera(CameraUpdate.newCameraPosition(position));
});

final locationSettingsProvider = Provider<LocationSettings>(
  (_) => const LocationSettings(
    accuracy: LocationAccuracy.high, //正確性:highはAndroid(0-100m),iOS(10m)
    distanceFilter: 100,
  ),
);

// 権限チェック
final locationPermissionProvider = FutureProvider<void>((_) async {
  final permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    await Geolocator.requestPermission();
  }
});

// 現在地を監視
final positionStreamProvider = Provider.autoDispose((ref) {
  Geolocator.getPositionStream(
    locationSettings: ref.read(locationSettingsProvider),
  ).listen((Position? position) {
    // 現在地が変更した時の処理
    print(position);
  });
});
