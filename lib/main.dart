import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/Utils/constants.dart';
import 'package:flutter_widgets/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Constants.prefs = await SharedPreferences.getInstance();
  runApp(MaterialApp(
    title: "StateFull Widgets",
    theme: ThemeData(primaryColor: Colors.blueGrey),
    home: Constants.prefs.getBool("LoggedIn") == true
        ? HomeScreen()
        : LoginScreen(),
    routes: {
      "/login": (context) => LoginScreen(),
      "/home": (context) => HomeScreen()
    },
  ));
}
