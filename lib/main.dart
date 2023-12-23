import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_dashboard/dashboard.dart';
import 'package:responsive_dashboard/find.dart';
import 'package:responsive_dashboard/login.dart';
import 'package:responsive_dashboard/profile.dart';
import 'package:responsive_dashboard/recofilm.dart';
import 'package:responsive_dashboard/singin.dart';
import 'package:responsive_dashboard/style/colors.dart';
import 'package:responsive_dashboard/theme/theme.dart';
import 'package:responsive_dashboard/theme/theme_provider.dart';

import 'IntroScreen/intro_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: Dashboard(),
    );
  }
}
