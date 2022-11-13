import 'package:flutter/material.dart';
import 'package:y2ztest/UTILITY/Sizeconfig.dart';

// Color kTitleBaseColor = kTextBaseColor;
// const Color kBackgroundBaseColor = Colors.white;
// const Color kAppBarBackgroundColor = Colors.white;

// const double kBaseScreenHeight = 896.0;
// const double kBaseScreenWidth = 414.0;

// const double kButtonHeight = 60.0;
// const double kButtonMinWidth = 200.0;

const BorderRadius kBorderRadius = BorderRadius.all(Radius.circular(4.0));

class AppTheme {
  ThemeData getAppThemeLight() {
    return ThemeData(
        primaryColor: Colors.white,
        //fontFamily: 'Lobster',
        //brightness: Brightness.light,
        backgroundColor: const Color.fromARGB(255, 224, 11, 11),
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.greenAccent,
            // This will be applied to the "back" icon
            iconTheme: IconThemeData(color: Colors.red),
            // This will be applied to the action icon buttons that locates on the right side
            actionsIconTheme: IconThemeData(color: Colors.amber),
            centerTitle: false,
            elevation: 15,
            titleTextStyle: TextStyle(color: Colors.lightBlueAccent)),
        dividerColor: Colors.white54,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
            .copyWith(secondary: Colors.black));
  }

  ThemeData getAppThemeDark() {
    return ThemeData(
        primaryColor: Colors.black,
        //fontFamily: 'Lobster',
        // brightness: Brightness.dark,
        backgroundColor: const Color(0xFF212121),
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.deepPurple,
            // This will be applied to the "back" icon
            iconTheme: IconThemeData(color: Colors.red),
            // This will be applied to the action icon buttons that locates on the right side
            actionsIconTheme: IconThemeData(color: Colors.amber),
            centerTitle: false,
            elevation: 15,
            titleTextStyle: TextStyle(color: Colors.lightBlueAccent)),
        dividerColor: Colors.black12,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
            .copyWith(secondary: Colors.white),
        buttonTheme: ButtonThemeData(
          // 4
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: Colors.purpleAccent,
        ),
        // cardTheme: const CardTheme(
        //   color: Colors.pinkAccent,
        //   elevation: 5,
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.all(
        //       Radius.circular(8.0),
        //     ),
        //   ),
        // ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.greenAccent;
                }
                return Colors.purple;
              },
            ),
          ),
        ));
  }
}

class AppTextStyle extends TextStyle {
  static const FontWeight light = FontWeight.w200;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w600;
  static const FontWeight semibold = FontWeight.w700;
  static const FontWeight bold = FontWeight.w900;

  AppTextStyle.appFont({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) : super(
          inherit: false,
          color: Colors.white,
          fontSize: SizeConfig.textMultiplier * 3.5,
          fontWeight: fontWeight,
          // wordSpacing: -2.5,
          // letterSpacing: -0.5,
          textBaseline: TextBaseline.alphabetic,
        );
  TextStyle appFontSemi(double fontSize, [Color? color]) =>
      AppTextStyle.appFont(
        fontSize: fontSize,
        fontWeight: AppTextStyle.semibold,
        color: Colors.blueGrey,
      );
}
