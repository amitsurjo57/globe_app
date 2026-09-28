import 'package:flutter/material.dart';
import 'package:flutter_earth_globe/flutter_earth_globe.dart';
import 'package:flutter_earth_globe/flutter_earth_globe_controller.dart';

class EarthDayScreen extends StatelessWidget {
  final FlutterEarthGlobeController controller;
  final double radius;

  const EarthDayScreen({super.key, required this.controller, this.radius = 60});

  @override
  Widget build(BuildContext context) {
    return FlutterEarthGlobe(
      controller: controller,
      radius: radius,
    );
  }
}
