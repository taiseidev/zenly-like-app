import 'dart:async';

import 'package:custom_map_markers/custom_map_markers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zenly_like_app/feature/map.dart';
import 'package:zenly_like_app/feature/weather.dart';
import 'package:zenly_like_app/presentasion/home/components/custom_marker.dart';
import 'package:zenly_like_app/presentasion/home/components/prefecture_text.dart';
import 'package:zenly_like_app/utils/common_loading.dart';

class HomePage extends HookConsumerWidget {
  HomePage({super.key});

  // 初期位置
  final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(43.068, 141.34),
    zoom: 5,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CameraPosition? initialPosition;
    useEffect(
      () {
        Future(() async {
          await ref
              .read(getCurrentPositionProvider.future)
              .then((value) => initialPosition = value);
          await ref.read(locationPermissionProvider.future);
          ref.watch(positionStreamProvider);
        });
        return null;
      },
      [],
    );
    return Scaffold(
      body: Stack(
        children: [
          BackGroundWhether(),
          Opacity(
            opacity: 0.7,
            child: CustomGoogleMapMarkerBuilder(
              // 共有ユーザーのマーカーを表示
              customMarkers: [],
              builder: (BuildContext context, Set<Marker>? markers) {
                // customMarkersの用意が出来たらbuilderにmarkersが渡される。
                if (markers == null) {
                  return const CommonLoading();
                }
                return GoogleMap(
                  markers: markers,
                  initialCameraPosition:
                      initialPosition ?? _kGooglePlex, // デフォルトのカメラ位置
                  myLocationButtonEnabled: false, // デフォルトの現在地ボタン
                  myLocationEnabled: true, // 現在地アイコンの表示
                  onMapCreated: ref.watch(controllerProvider).complete,
                );
              },
            ),
          ),
          PrefectureText(
            '北海道',
            Colors.black,
          ),
        ],
      ),
    );
  }
}
