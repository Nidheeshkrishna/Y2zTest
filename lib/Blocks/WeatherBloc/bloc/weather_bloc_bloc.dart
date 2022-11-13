import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:y2ztest/Models/Weathermodel.dart';
import 'package:y2ztest/Repository/weatherRest.dart';

part 'weather_bloc_event.dart';
part 'weather_bloc_state.dart';

class WeatherBlocBloc extends Bloc<WeatherBlocEvent, WeatherState> {
  WeatherBlocBloc() : super(WeatherInitial()) {
    Weathermodel? weatherModel;
    on<WeatherBlocEvent>((event, emit) async {
      if (event is WeatherFetchEvent) {
        emit(WeatherLoadingState());
        try {
          weatherModel = await Weatherdatafetch().getLocationWeather();

          emit(WeatherloadedState(weatherModel: weatherModel));
        } catch (e) {
          emit(WeatherErrorState(message: e.toString()));
        }
      }
    });
  }
}
