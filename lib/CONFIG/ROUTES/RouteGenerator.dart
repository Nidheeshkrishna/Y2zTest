import 'package:flutter/material.dart';
import 'package:y2ztest/Pages/Adduser/adduserForm.dart';
import 'package:y2ztest/Pages/ListOfuser.dart';
import 'package:y2ztest/Pages/LoginPage.dart';
import 'package:y2ztest/Pages/OnBoardingPage.dart';
import 'package:y2ztest/Pages/WeatherPage.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const OnBoardingPage());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case '/userlist':
        return MaterialPageRoute(builder: (_) => const SwipeActionPage());

      case '/adduser':
        return MaterialPageRoute(builder: (_) => const AddUser());
      case '/weather':
        return MaterialPageRoute(builder: (_) => const Weatherpage());

      // //CallInheritedWidgetAddUser
      // // FreezedHomePage(
      // //             title: 'Freezed',
      // //           )
      // case '/page3':
      //   return MaterialPageRoute(builder: (_) => const Page3());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
