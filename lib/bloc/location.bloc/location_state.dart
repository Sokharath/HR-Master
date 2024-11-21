part of 'location_bloc.dart';

@immutable
abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

class LocationInitial extends LocationState {}

class LocationPermissionGranted extends LocationState {
  final String statusMessage;

  const LocationPermissionGranted(this.statusMessage);

  @override
  List<Object> get props => [statusMessage];
}

class LocationPermissionDenied extends LocationState {
  final String statusMessage;

  const LocationPermissionDenied(this.statusMessage);

  @override
  List<Object> get props => [statusMessage];
}

class LocationWithinRadius extends LocationState {
  final String statusMessage;

  const LocationWithinRadius(this.statusMessage);

  @override
  List<Object> get props => [statusMessage];
}

class LocationOutsideRadius extends LocationState {
  final String statusMessage;
  final double distanceInMeters;

  const LocationOutsideRadius(this.statusMessage, this.distanceInMeters);

  @override
  List<Object> get props => [statusMessage, distanceInMeters];
}

class LocationError extends LocationState {
  final String errorMessage;

  const LocationError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

