import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:y2ztest/Blocks/FormvalidtionBloc/formvalidtion_bloc_bloc.dart';
import 'package:y2ztest/Blocks/WeatherBloc/bloc/weather_bloc_bloc.dart';
import 'package:y2ztest/CONFIG/ROUTES/RouteGenerator.dart';
import 'package:y2ztest/CONST/AppThemes.dart';
import 'package:y2ztest/Models/UserData.dart';
import 'package:y2ztest/UTILITY/Sizeconfig.dart';

Future<void> main() async {
  runApp(const MyApp());
  const String dataBoxName = "user data";
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(UserDataAdapter());

  await Hive.openBox<UserData>(dataBoxName);
  await Hive.initFlutter();
  // await Hive.initFlutter();
  //WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var initialRoute = '/';
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => MyFormBloc()),
        // BlocProvider<NetworkBloc>(
        //   create: (context) => NetworkBloc()..add(ListenConnection()),
        // ),

        BlocProvider(create: (context) => WeatherBlocBloc()),
      ],
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return OrientationBuilder(builder: (context, orientation) {
          SizeConfig().init(constraints, orientation);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: RouteGenerator.generateRoute,
            initialRoute: '/',
            title: 'Y2Z Machine Test',
            themeMode: ThemeMode.system,
            darkTheme: AppTheme().getAppThemeDark(),
            theme: AppTheme().getAppThemeLight(),
            //home: const Homepage(),
          );
        });
      }),
    );
  }
}
