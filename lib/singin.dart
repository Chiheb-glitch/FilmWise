import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:responsive_dashboard/component/Generatecard.dart';
import 'package:responsive_dashboard/component/appBarActionItems.dart';
import 'package:responsive_dashboard/component/cardcategories.dart';
import 'package:responsive_dashboard/component/filmcard.dart';
import 'package:responsive_dashboard/component/listscard.dart';
import 'package:responsive_dashboard/component/sideMenu.dart';
import 'package:responsive_dashboard/config/size_config.dart';
import 'package:responsive_dashboard/dashboard.dart';
import 'package:responsive_dashboard/login.dart';
import 'package:responsive_dashboard/style/colors.dart';
import 'package:responsive_dashboard/style/style.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:ui' as ui;

import 'component/findcard.dart';

class Signin extends StatefulWidget {
  @override
  _Signin createState() => _Signin();
}

class _Signin extends State<Signin> with TickerProviderStateMixin {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  AnimationController? _controller;
  Animation<double>? _animation;
  List<bool> d = [false, false, false];
  List<bool> g = [false, false, false, false, false, false];

  bool show = false;
  String value = 'Initial Value';

  void handleValueChanged(String newValue) {
    setState(() {
      value = newValue;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller!,
      curve: Curves.easeInOut,
    );
    _controller!.forward();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: _drawerKey,
      drawer: SideMenu(),

      resizeToAvoidBottomInset: false, // set it to false

      body: SingleChildScrollView(
        child: Expanded(
            flex: 10,
            child: Container(
              height: 900,
              color: Color.fromARGB(255, 20, 20, 20),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SafeArea(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 100),
                                    width: SizeConfig.screenWidth! - 40,
                                    height: 226,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 6, 94, 153),
                                      borderRadius: BorderRadius.circular(57),
                                    ),
                                    child: Stack(
                                      children: [
                                        Center(
                                          child: Container(
                                            padding: EdgeInsets.all(2),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                            child: Column(
                                              children: [
                                                Container(
                                                  child: Text(
                                                    "JUST CALL IT, ",
                                                    style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 217, 217, 217),
                                                      fontFamily:
                                                          'Poppins  ', // Set the font family
                                                      fontWeight: FontWeight
                                                          .w400, // Set the font weight
                                                      fontSize: 25,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      bottom: 20),
                                                  child: Text(
                                                    "FRIENDO!",
                                                    style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 217, 217, 217),
                                                      fontFamily:
                                                          'Poppins  ', // Set the font family
                                                      fontWeight: FontWeight
                                                          .w400, // Set the font weight
                                                      fontSize: 25,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          child: Center(
                                            child: Expanded(
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 40),
                                                    child: Image.asset(
                                                      "assets/nocon 2.png",
                                                      height: 180,
                                                      width: 320,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 13, 0, 7),
                                    height: 1,
                                    color: Color.fromARGB(255, 71, 71, 71),
                                    width: SizeConfig.screenWidth! - 20,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 2),
                                    width: SizeConfig.screenWidth! - 80,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Center(
                                          child: Expanded(
                                            child: Column(
                                              children: [
                                                Text(
                                                  "SIGN UP AND  ",
                                                  style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 217, 217, 217),
                                                    fontFamily:
                                                        'Poppins  ', // Set the font family
                                                    fontWeight: FontWeight
                                                        .w400, // Set the font weight
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                Text(
                                                  "UNLOCK YOUR INNER FILM BUFF",
                                                  style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 217, 217, 217),
                                                    fontFamily:
                                                        'Poppins  ', // Set the font family
                                                    fontWeight: FontWeight
                                                        .w400, // Set the font weight
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 5),
                                    height: 1,
                                    color: Color.fromARGB(255, 71, 71, 71),
                                    width: SizeConfig.screenWidth! - 20,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 8),
                                    width: SizeConfig.screenWidth! - 70,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 217, 217, 217),
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 4,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Email address',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 8),
                                    width: SizeConfig.screenWidth! - 70,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 217, 217, 217),
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 4,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Username',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 8),
                                    width: SizeConfig.screenWidth! - 70,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 217, 217, 217),
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 4,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Password',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => {
                                      Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                          pageBuilder: (context, animation,
                                                  secondaryAnimation) =>
                                              Dashboard(),
                                          transitionsBuilder: (context,
                                              animation,
                                              secondaryAnimation,
                                              child) {
                                            var begin = Offset(1.0, 0);
                                            var end = Offset.zero;
                                            var tween =
                                                Tween(begin: begin, end: end);
                                            var offsetAnimation =
                                                animation.drive(tween);

                                            return SlideTransition(
                                              position: offsetAnimation,
                                              child: child,
                                            );
                                          },
                                        ),
                                      )
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(top: 25),
                                      width: SizeConfig.screenWidth! - 170,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 6, 94, 153),
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Center(
                                            child: Expanded(
                                              child: Text(
                                                "Sign in",
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 217, 217, 217),
                                                  fontFamily:
                                                      'Poppins  ', // Set the font family
                                                  fontWeight: FontWeight
                                                      .w300, // Set the font weight
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 0),
                                    width: SizeConfig.screenWidth! - 100,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Center(
                                          child: Expanded(
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Already have an account?",
                                                  style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 217, 217, 217),
                                                    fontFamily:
                                                        'Poppins  ', // Set the font family
                                                    fontWeight: FontWeight
                                                        .w200, // Set the font weight
                                                    fontSize: 15,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                GestureDetector(
                                                  onTap: () => {
                                                    Navigator.push(
                                                      context,
                                                      PageRouteBuilder(
                                                        pageBuilder: (context,
                                                                animation,
                                                                secondaryAnimation) =>
                                                            Login(),
                                                        transitionsBuilder:
                                                            (context,
                                                                animation,
                                                                secondaryAnimation,
                                                                child) {
                                                          var begin =
                                                              Offset(1.0, 0);
                                                          var end = Offset.zero;
                                                          var tween = Tween(
                                                              begin: begin,
                                                              end: end);
                                                          var offsetAnimation =
                                                              animation
                                                                  .drive(tween);

                                                          return SlideTransition(
                                                            position:
                                                                offsetAnimation,
                                                            child: child,
                                                          );
                                                        },
                                                      ),
                                                    )
                                                  },
                                                  child: Text(
                                                    "Log in",
                                                    style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 26, 127, 193),
                                                      fontFamily:
                                                          'Poppins  ', // Set the font family
                                                      fontWeight: FontWeight
                                                          .w200, // Set the font weight
                                                      fontSize: 15,
                                                      decoration: TextDecoration
                                                          .underline,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 0),
                                    width: SizeConfig.screenWidth! - 100,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Center(
                                          child: Expanded(
                                            child: Row(
                                              children: [
                                                Icon(
                                                  BootstrapIcons.instagram,
                                                  color: Color.fromARGB(
                                                      255, 217, 217, 217),
                                                  size: 30,
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Icon(
                                                  BootstrapIcons.facebook,
                                                  color: Color.fromARGB(
                                                      255, 217, 217, 217),
                                                  size: 30,
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Icon(
                                                  BootstrapIcons.google,
                                                  color: Color.fromARGB(
                                                      255, 217, 217, 217),
                                                  size: 30,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
