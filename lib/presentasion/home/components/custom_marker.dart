import 'package:custom_map_markers/custom_map_markers.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// 自作マーカー
MarkerData marker({
  required String markerId,
  required LatLng latLng,
  required String imageUrl,
}) {
  return MarkerData(
    marker: Marker(
      markerId: MarkerId(markerId),
      position: latLng,
    ),
    child: CustomMarker(imageUrl: imageUrl),
  );
}

class CustomMarker extends StatelessWidget {
  CustomMarker({
    required this.imageUrl,
    super.key,
  });

  String imageUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
            radius: 50,
          ),
        ],
      ),
    );
  }
}
