import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final double targetLatitude = 11.538430;
  final double targetLongitude = 104.911188;
  final double unlockRadiusInMeters = 50;
  LocationBloc() : super(LocationInitial()) {
    on<RequestLocationPermission>(_onRequestLocationPermission);
    on<CheckUnlockLocation>(_onCheckUnlockLocation);
  }

  void _onRequestLocationPermission(
      RequestLocationPermission event, Emitter<LocationState> emit) async {
    try {
      // Check the current permission status
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.deniedForever) {
        emit(const LocationPermissionDenied(
            "Location permission is permanently denied. Please enable it from settings."));
        return;
      }
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
        emit(const LocationPermissionGranted("Location permission granted."));
        add(CheckUnlockLocation());
      } else {
        emit(const LocationPermissionDenied("Location permission denied."));
      }
    } catch (e) {
      emit(LocationError("Error requesting location permission: $e"));
    }
  }

  void _onCheckUnlockLocation(
      CheckUnlockLocation event, Emitter<LocationState> emit) async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      print('Current position: (${position.latitude}, ${position.longitude})');
      double distanceInMeters = Geolocator.distanceBetween(
        position.latitude,
        position.longitude,
        targetLatitude,
        targetLongitude,
      );

      print('Distance to target: $distanceInMeters meters');
      if (distanceInMeters <= unlockRadiusInMeters) {
        emit(const LocationWithinRadius(
            "Feature unlocked! You are at the correct location."));
      } else {
        emit(LocationOutsideRadius(
            "You are ${distanceInMeters.toStringAsFixed(2)} meters away. Move closer to unlock.",
            distanceInMeters));
      }
    } catch (e) {
      emit(LocationError("Error getting location: $e"));
    }
  }
}
