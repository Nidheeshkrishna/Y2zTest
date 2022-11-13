part of 'weather_bloc_bloc.dart';

@immutable
abstract class WeatherBlocEvent {}

class WeatherFetchEvent extends WeatherBlocEvent {
  WeatherFetchEvent();
}
