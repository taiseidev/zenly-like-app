import 'package:flutter/material.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';

// enum WeatherType {
//   heavyRainy,
//   heavySnow,
//   middleSnow,
//   thunder,
//   lightRainy,
//   lightSnow,
//   sunnyNight,
//   sunny,
//   cloudy,
//   cloudyNight,
//   middleRainy,
//   overcast,
//   hazy,
//   foggy,
//   dusty,
// }

class BackGroundWhether extends StatelessWidget {
  const BackGroundWhether({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return WeatherBg(
      weatherType: WeatherType.thunder,
      width: width,
      height: height,
    );
  }
}
