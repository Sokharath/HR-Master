part of 'location_bloc.dart';

@immutable
abstract class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object?> get props => [];
}

class RequestLocationPermission extends LocationEvent {}

class CheckUnlockLocation extends LocationEvent {}
