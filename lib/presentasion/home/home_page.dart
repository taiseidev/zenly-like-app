import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zenly_like_app/feature/map.dart';

import '../../feature/auth.dart';

class HomePage extends HookConsumerWidget {
  HomePage({super.key});
  final _controller = Completer<dynamic>();

  // 初期位置
  final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(43.0686606, 141.3485613),
    zoom: 14,
  );

  static final LatLng _kMapCenter1 = LatLng(43.0686606, 141.3485613);

  Set<Marker> _createMarker() {
    return {
      Marker(
        markerId: MarkerId("marker_1"),
        position: _kMapCenter1,
      ),
    };
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CameraPosition? initialPosition;
    useEffect(() {
      Future(() async {
        // initialPosition = await ref.read(initialPositionFutureProvider.future);
        await ref.read(locationPermissionProvider.future);
        ref.watch(positionStreamProvider);
      });
    }, []);

    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: initialPosition ?? _kGooglePlex, // デフォルトのカメラ位置
        myLocationButtonEnabled: false, // デフォルトの現在地ボタン
        myLocationEnabled: true, // 現在地アイコンの表示
        markers: _createMarker(),
        onMapCreated: _controller.complete,
      ),
    );
  }
}
