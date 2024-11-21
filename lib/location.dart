import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationUnlockApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Location Unlock Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LocationUnlockScreen(),
    );
  }
}

class LocationUnlockScreen extends StatefulWidget {
  @override
  _LocationUnlockScreenState createState() => _LocationUnlockScreenState();
}

class _LocationUnlockScreenState extends State<LocationUnlockScreen> {
  bool _isUnlocked = false;
  String _statusMessage = "Press the button to unlock at the correct location";

  final double targetLatitude = 37.785834;
  final double targetLongitude = -122.406417;
  final double unlockRadiusInMeters = 50;

  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
  }

  Future<void> _requestLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      setState(() {
        _statusMessage =
            "Location permission granted. Tap the button to unlock.";
      });
    } else {
      setState(() {
        _statusMessage = "Location permission denied.";
      });
    }
  }

  Future<Position> _getCurrentLocation() async {
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  Future<void> _checkUnlockLocation() async {
    try {
      Position position = await _getCurrentLocation();
      double distanceInMeters = Geolocator.distanceBetween(
        position.latitude,
        position.longitude,
        targetLatitude,
        targetLongitude,
      );

      // Check if the user is within the unlock radius
      if (distanceInMeters <= unlockRadiusInMeters) {
        _unlockFeature();
      } else {
        setState(() {
          _statusMessage =
              "You are ${distanceInMeters.toStringAsFixed(2)} meters away. Move closer to unlock.";
        });
      }
    } catch (e) {
      setState(() {
        _statusMessage = "Error getting location: $e";
      });
    }
  }

  void _unlockFeature() {
    setState(() {
      _isUnlocked = true;
      _statusMessage = "Feature unlocked! You are at the correct location.";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location Unlock Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _isUnlocked ? 'Unlocked' : 'Locked',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkUnlockLocation,
              child: Text(_isUnlocked ? 'Unlocked' : 'Unlock'),
            ),
            SizedBox(height: 20),
            Text(
              _statusMessage,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
