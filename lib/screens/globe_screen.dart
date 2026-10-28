import 'package:flutter/material.dart';
import 'package:flutter_earth_globe/flutter_earth_globe_controller.dart';
import 'package:flutter_earth_globe/globe_coordinates.dart';
import 'package:flutter_earth_globe/point.dart';
import 'package:globe_app/screens/earth_cloud_screen.dart';
import 'package:globe_app/screens/earth_color.dart';
import 'package:globe_app/screens/earth_day_screen.dart';
import 'package:globe_app/screens/earth_night_screen.dart';
import 'package:globe_app/screens/moon_screen.dart';
import 'package:globe_app/screens/sun_screen.dart';

class GlobeScreen extends StatefulWidget {
  const GlobeScreen({super.key});

  @override
  State<GlobeScreen> createState() => _GlobeScreenState();
}

class _GlobeScreenState extends State<GlobeScreen> {
  final PageController _pageController = PageController();
  late FlutterEarthGlobeController _earthDayController;
  late FlutterEarthGlobeController _earthColorController;
  late FlutterEarthGlobeController _earthNightController;
  late FlutterEarthGlobeController _earthCloudController;
  late FlutterEarthGlobeController _moonController;
  late FlutterEarthGlobeController _sunController;

  int _pageIndex = 0;

  final String _bgImagePath = "assets/2k_stars.jpg";

  @override
  void initState() {
    super.initState();
    _initializingAllControllers();
    _addPointToController();
  }

  void _initializingAllControllers() {
    _earthDayController = FlutterEarthGlobeController(
      rotationSpeed: 0.05,
      isBackgroundFollowingSphereRotation: true,
      lightIntensity: 2,
      background: Image.asset(_bgImagePath).image,
      surface: Image.asset("assets/8k_earth-day.jpg").image,
    );
    _earthColorController = FlutterEarthGlobeController(
      rotationSpeed: 0.05,
      isBackgroundFollowingSphereRotation: true,
      lightIntensity: 2,
      background: Image.asset(_bgImagePath).image,
      surface: Image.asset("assets/earth_color.jpg").image,
    );
    _earthNightController = FlutterEarthGlobeController(
      rotationSpeed: 0.05,
      isBackgroundFollowingSphereRotation: true,
      lightIntensity: 2,
      background: Image.asset(_bgImagePath).image,
      surface: Image.asset("assets/8k_earth_nightmap.jpg").image,
    );
    _earthCloudController = FlutterEarthGlobeController(
      rotationSpeed: 0.05,
      isBackgroundFollowingSphereRotation: true,
      background: Image.asset(_bgImagePath).image,
      surface: Image.asset("assets/8k_earth_clouds.jpg").image,
    );
    _sunController = FlutterEarthGlobeController(
      rotationSpeed: 0.05,
      isBackgroundFollowingSphereRotation: true,
      lightIntensity: 2,
      background: Image.asset(_bgImagePath).image,
      surface: Image.asset("assets/8k_sun.jpg").image,
    );
    _moonController = FlutterEarthGlobeController(
      rotationSpeed: 0.05,
      isBackgroundFollowingSphereRotation: true,
      background: Image.asset(_bgImagePath).image,
      surface: Image.asset("assets/8k_moon.jpg").image,
    );
  }

  void _addPointToController() {
    _earthDayController.addPoint(
      Point(
        id: '1',
        coordinates: const GlobeCoordinates(23.777176, 90.399452),
        labelBuilder: (context, point, isHovering, isVisible) =>
            Chip(backgroundColor: Colors.white, label: Text("Dhaka")),
        isLabelVisible: true,
        style: const PointStyle(color: Colors.red),
      ),
    );
    _earthNightController.addPoint(
      Point(
        id: '1',
        coordinates: const GlobeCoordinates(23.777176, 90.399452),
        label: 'Dhaka',
        isLabelVisible: true,
        style: const PointStyle(color: Colors.red),
      ),
    );
    _earthCloudController.addPoint(
      Point(
        id: '1',
        coordinates: const GlobeCoordinates(23.777176, 90.399452),
        label: 'Dhaka',
        isLabelVisible: true,
        style: const PointStyle(color: Colors.red),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _earthDayController.dispose();
    _earthColorController.dispose();
    _earthNightController.dispose();
    _earthCloudController.dispose();
    _sunController.dispose();
    _moonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (value) => setState(() => _pageIndex = value),
          children: [
            EarthDayScreen(controller: _earthDayController),
            EarthColorScreen(controller: _earthColorController),
            EarthNightScreen(controller: _earthNightController),
            EarthCloudScreen(controller: _earthCloudController),
            SunScreen(controller: _sunController),
            MoonScreen(controller: _moonController),
          ],
        ),
        bottomSheet: BottomAppBar(
          color: Colors.black87,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 80,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: .spaceBetween,
              crossAxisAlignment: .center,
              children: [
                buildBottomSheetItems(
                  text: "Earth\nDay",
                  isSelected: _pageIndex == 0,
                  onTap: () {
                    _pageController.animateToPage(
                      0,
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastEaseInToSlowEaseOut,
                    );
                  },
                ),
                buildBottomSheetItems(
                  text: "Earth\nColor",
                  isSelected: _pageIndex == 1,
                  onTap: () {
                    _pageController.animateToPage(
                      1,
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastEaseInToSlowEaseOut,
                    );
                  },
                ),
                buildBottomSheetItems(
                  text: "Earth\nNight",
                  isSelected: _pageIndex == 2,
                  onTap: () {
                    _pageController.animateToPage(
                      2,
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastEaseInToSlowEaseOut,
                    );
                  },
                ),
                buildBottomSheetItems(
                  text: "Earth\nCloud",
                  isSelected: _pageIndex == 3,
                  onTap: () {
                    _pageController.animateToPage(
                      3,
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastEaseInToSlowEaseOut,
                    );
                  },
                ),
                buildBottomSheetItems(
                  text: "Sun",
                  isSelected: _pageIndex == 4,
                  onTap: () {
                    _pageController.animateToPage(
                      4,
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastEaseInToSlowEaseOut,
                    );
                  },
                ),
                buildBottomSheetItems(
                  text: "Moon",
                  isSelected: _pageIndex == 5,
                  onTap: () {
                    _pageController.animateToPage(
                      5,
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastEaseInToSlowEaseOut,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBottomSheetItems({
    required String text,
    required bool isSelected,
    required void Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 800),
        curve: Curves.fastEaseInToSlowEaseOut,
        height: double.infinity,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.grey.withAlpha(40) : null,
          border: Border(
            top: BorderSide(
              color: isSelected ? Colors.cyanAccent : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
