import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final getCurrentPositionFutureProvider = FutureProvider<Position>(
  (ref) async {
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    return position;
  },
);

final initialPositionFutureProvider =
    FutureProvider<CameraPosition>((ref) async {
  final currentPosition =
      await ref.watch(getCurrentPositionFutureProvider.future);
  return CameraPosition(
    target: LatLng(currentPosition.latitude, currentPosition.longitude),
    zoom: 1,
  );
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
    locationSettings: ref.watch(locationSettingsProvider),
  ).listen((Position? position) {
    // 現在地が変更した時の処理
    print(position);
  });
});
