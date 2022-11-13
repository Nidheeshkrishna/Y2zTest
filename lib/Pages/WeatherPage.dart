import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:y2ztest/Blocks/WeatherBloc/bloc/weather_bloc_bloc.dart';
import 'package:y2ztest/CONST/AppColors.dart';

class Weatherpage extends StatefulWidget {
  const Weatherpage({super.key});

  @override
  State<Weatherpage> createState() => _WeatherpageState();
}

class _WeatherpageState extends State<Weatherpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<WeatherBlocBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is WeatherloadedState) {
          return Container(
            color: AppColors.lightGreyWhite,
            child: Text(state.weatherModel!.current!.pressure.toString()),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    ));
  }
}
