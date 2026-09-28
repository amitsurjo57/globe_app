import 'package:flutter/material.dart';
import 'package:flutter_earth_globe/flutter_earth_globe.dart';
import 'package:flutter_earth_globe/flutter_earth_globe_controller.dart';

class EarthNightScreen extends StatelessWidget {
  final FlutterEarthGlobeController controller;
  final double radius;

  const EarthNightScreen({super.key, required this.controller, this.radius = 60});

  @override
  Widget build(BuildContext context) {
    return FlutterEarthGlobe(
      controller: controller,
      radius: radius,
    );
  }
}
