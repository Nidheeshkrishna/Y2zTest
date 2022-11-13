part of 'weather_bloc_bloc.dart';

class WeatherErrorState extends WeatherState {
  final String message;

  WeatherErrorState({required this.message});
}

class WeatherInitial extends WeatherState {}

class WeatherloadedState extends WeatherState {
  late final Weathermodel? weatherModel;
  WeatherloadedState({
    required this.weatherModel,
  });
}

class WeatherLoadingState extends WeatherState {}

@immutable
abstract class WeatherState {}
