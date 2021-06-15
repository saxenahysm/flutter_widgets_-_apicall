import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/Utils/constants.dart';
import 'package:flutter_widgets/screens/home.dart';
import 'package:flutter_widgets/screens/search_filter_screen.dart';
import 'package:flutter_widgets/screens/search_filter_with_list_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/login.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Constants.prefs = await SharedPreferences.getInstance();
  runApp(MaterialApp(
    title: "StateFull Widgets",
    theme: ThemeData(primaryColor: Colors.blueGrey),
    home: Constants.prefs.getBool("LoggedIn") == true
        ? SearchFilterScreenDemo()
        : SearchFilterScreenDemo(),
    routes: {
      "/login": (context) => LoginScreen(),
      "/home": (context) => HomeScreen()
    },
  ));
}
