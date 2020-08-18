import 'package:bloc_login_demo/blocs/form_provider.dart';
import 'package:flutter/material.dart';

import 'ForgotPassword.dart';
import 'Home.dart';
import 'Login.dart';
import 'SignUp.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FromProvider(
      child: MaterialApp(
        title: 'Login_bloc_screen',
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.dark,
        initialRoute: '/login',
        onGenerateRoute: onGeneratedRoute,
      ),
    );
  }

  Route onGeneratedRoute(RouteSettings settings) {
    if (settings.name == '/login') {
      return MaterialPageRoute(builder: (_) => Login());
    }
    if (settings.name == '/forgot-password') {
      return MaterialPageRoute(builder: (_) => ForgotPassword());
    }
    if (settings.name == '/sign-up') {
      return MaterialPageRoute(builder: (_) => SignUp());
    }
    return MaterialPageRoute(builder: (_) => Home());
  }
}
