
import 'package:flutter/material.dart';
import 'package:provider_mvvm_demo/utils/routes/routes_name.dart';
import 'package:provider_mvvm_demo/view/home_screen.dart';
import 'package:provider_mvvm_demo/view/login_view.dart';
import 'package:provider_mvvm_demo/view/signup_view.dart';


class Routes {

  static Route<dynamic>  generateRoute(RouteSettings settings){

    switch(settings.name){

      case RouteName.home:
        return MaterialPageRoute(builder: (BuildContext context) => const HomeScreen());

      case RouteName.login:
        return MaterialPageRoute(builder: (BuildContext context) => const LoginScreen());

      case RouteName.signUp:
        return MaterialPageRoute(builder: (BuildContext context) => const SignUpView());

      default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });

    }
  }
}