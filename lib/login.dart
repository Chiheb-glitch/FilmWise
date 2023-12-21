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
import 'package:responsive_dashboard/singin.dart';
import 'package:responsive_dashboard/style/colors.dart';
import 'package:responsive_dashboard/style/style.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:ui' as ui;

import 'component/findcard.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> with TickerProviderStateMixin {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  late AnimationController _controller;
  late Animation<double> _animation;
  List<bool> d = [false, false, false];
  List<bool> g = [false, false, false, false, false, false];
  bool next = false;
  bool show = false;
  bool loginload = true;
  String value = 'Initial Value';

  int _currentPage = 0;

  final PageController _pageController = PageController();
  bool _isPasswordVisible = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();

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
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(25, 0, 25, 25),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.4,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.4,
                                      width: MediaQuery.of(context).size.width,
                                    ),
                                    Positioned(
                                      top: MediaQuery.of(context).size.height *
                                          0.083,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 6, 94, 153),
                                          borderRadius:
                                              BorderRadius.circular(40.0),
                                        ),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.3,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.88,
                                      ),
                                    ),
                                    Positioned(
                                      top: MediaQuery.of(context).size.height *
                                          0.012,
                                      left: MediaQuery.of(context).size.width *
                                          0.148,
                                      child: Image.network(
                                        "https://i.ibb.co/vhqL7Hw/ules-1.png",
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.484,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.273,
                                      ),
                                    ),
                                    Positioned(
                                      top: MediaQuery.of(context).size.height *
                                          0.225,
                                      left: MediaQuery.of(context).size.width *
                                          0.09,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(left: 0),
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  255, 26, 40, 50),
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                            padding: EdgeInsets.all(10),
                                            child: Text(
                                              "ROOKIE CINEPHILE QUIZ",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.032,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "WHAT DOES MARSELLUS WALLACE LOOK LIKE????",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w100,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.026,
                                            ),
                                          ),
                                          SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.014),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    elevation: 10,
                                                    backgroundColor:
                                                        Color.fromARGB(
                                                            255, 0, 122, 204),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsets.all(
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.025,
                                                    ),
                                                    child: Text(
                                                      'Witch',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.025,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  onPressed: () {},
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.042,
                                                ),
                                                ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    elevation: 10,
                                                    backgroundColor:
                                                        Color.fromARGB(
                                                            255, 0, 122, 204),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsets.all(
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.025,
                                                    ),
                                                    child: Text(
                                                      'SNITCH',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.025,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  onPressed: () {},
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.042,
                                                ),
                                                ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    elevation: 10,
                                                    backgroundColor:
                                                        Color.fromARGB(
                                                            255, 0, 122, 204),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsets.all(
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.025,
                                                    ),
                                                    child: Text(
                                                      'BITCH',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.025,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  onPressed: () {},
                                                ),
                                              ],
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
                          Container(
                            color: Color.fromARGB(113, 117, 117, 117),
                            height: 1,
                            width: MediaQuery.of(context).size.width * 0.9,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "SIGN IN AND ",
                            style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary, // Set the text color
                              fontFamily: 'Poppins', // Set the font family
                              fontWeight:
                                  FontWeight.w200, // Set the font weight
                              fontSize: 17,
                              // Set the font size
                            ),
                          ),
                          Text(
                            "UNLOCK YOUR INNER FILM BUFF",
                            style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary, // Set the text color
                              fontFamily: 'Poppins', // Set the font family
                              fontWeight:
                                  FontWeight.w200, // Set the font weight
                              fontSize: 17,
                              // Set the font size
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                            color: Color.fromARGB(113, 117, 117, 117),
                            height: 1,
                            width: MediaQuery.of(context).size.width * 0.9,
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          TextFormField(
                            validator: (value) {
                              // add email validation
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }

                              bool emailValid = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value);
                              if (!emailValid) {
                                return 'Please enter a valid email';
                              }

                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Email',
                              hintText: 'Enter youremail',
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(
                                  color: Theme.of(context).colorScheme.primary),

                              // Customize the border color
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                            ),
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary),
                          ),
                          SizedBox(height: 16),
                          TextFormField(
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }

                              if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                            obscureText: !_isPasswordVisible,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              hintText: 'Enter your password',
                              prefixIcon: Icon(
                                Icons.lock_outline_rounded,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              border: const OutlineInputBorder(),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isPasswordVisible
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isPasswordVisible = !_isPasswordVisible;
                                  });
                                },
                              ),
                              labelStyle: TextStyle(
                                  color: Theme.of(context).colorScheme.primary),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Forget Password?",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 2.0,
                                  color: Color.fromARGB(
                                      255, 0, 122, 204), // Set the text color
                                  fontFamily: 'Poppins', // Set the font family
                                  fontWeight:
                                      FontWeight.w500, // Set the font weight
                                  fontSize: 17,

                                  // Set the font size
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 0, 122, 204),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4)),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  'LOGIN',
                                  style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              onPressed: () {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  /// do something
                                  if (_currentPage < 1) {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (context, animation,
                                                secondaryAnimation) =>
                                            Dashboard(),
                                        transitionsBuilder: (context, animation,
                                            secondaryAnimation, child) {
                                          var begin = Offset(-1.0,
                                              0); // Change the begin offset to start from the left
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
                                    );
                                  }
                                }
                              },
                            ),
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don’t have an account?",
                                style: TextStyle(
                                  decorationThickness: 2.0,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primary, // Set the text color
                                  fontFamily: 'Poppins', // Set the font family
                                  fontWeight:
                                      FontWeight.w500, // Set the font weight
                                  fontSize: 17,

                                  // Set the font size
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (_currentPage < 1) {
                                    _pageController.nextPage(
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.easeInOut,
                                    );
                                  }
                                },
                                child: Text(
                                  "Signup",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    decorationThickness: 2.0,
                                    color: Color.fromARGB(
                                        255, 0, 122, 204), // Set the text color
                                    fontFamily:
                                        'Poppins', // Set the font family
                                    fontWeight:
                                        FontWeight.w500, // Set the font weight
                                    fontSize: 17,

                                    // Set the font size
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(25, 60, 25, 25),
                    child: Form(
                      key: _formKey1,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.38,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.38,
                                      width: MediaQuery.of(context).size.width,
                                    ),
                                    Positioned(
                                      top: MediaQuery.of(context).size.height *
                                          0.083,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 6, 94, 153),
                                          borderRadius:
                                              BorderRadius.circular(40.0),
                                        ),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.28,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.88,
                                      ),
                                    ),
                                    Positioned(
                                      top: (MediaQuery.of(context).size.height *
                                              70) /
                                          844,
                                      left: (MediaQuery.of(context).size.width *
                                              130) /
                                          390,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(left: 0),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                            padding: EdgeInsets.all(0),
                                            child: Text(
                                              "JUST CALL IT, ",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w300,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.040,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 0),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                            padding: EdgeInsets.all(0),
                                            child: Text(
                                              "FRIENDO!",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w300,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.040,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      top: (MediaQuery.of(context).size.height *
                                              17.1) /
                                          844,
                                      left: 0,
                                      child: Image.network(
                                        "https://i.ibb.co/mhFQM9h/nocon-1.png",
                                        width:
                                            (MediaQuery.of(context).size.width *
                                                    340) /
                                                390,
                                        height: (MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                335) /
                                            844,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 16),
                          Container(
                            color: Color.fromARGB(113, 117, 117, 117),
                            height: 1,
                            width: MediaQuery.of(context).size.width * 0.9,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "SIGN IN AND ",
                            style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary, // Set the text color
                              fontFamily: 'Poppins', // Set the font family
                              fontWeight:
                                  FontWeight.w200, // Set the font weight
                              fontSize: 17,
                              // Set the font size
                            ),
                          ),
                          Text(
                            "UNLOCK YOUR INNER FILM BUFF",
                            style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary, // Set the text color
                              fontFamily: 'Poppins', // Set the font family
                              fontWeight:
                                  FontWeight.w200, // Set the font weight
                              fontSize: 17,
                              // Set the font size
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                            color: Color.fromARGB(113, 117, 117, 117),
                            height: 1,
                            width: MediaQuery.of(context).size.width * 0.9,
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          TextFormField(
                            validator: (value) {
                              // add email validation

                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Username',
                              hintText: 'Enter your username',
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(
                                  color: Theme.of(context).colorScheme.primary),

                              // Customize the border color
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                            ),
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary),
                          ),
                          SizedBox(height: 16),
                          TextFormField(
                            validator: (value) {
                              // add email validation
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }

                              bool emailValid = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value);
                              if (!emailValid) {
                                return 'Please enter a valid email';
                              }

                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Email',
                              hintText: 'Enter your email',
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(
                                  color: Theme.of(context).colorScheme.primary),

                              // Customize the border color
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                            ),
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary),
                          ),
                          SizedBox(height: 16),
                          TextFormField(
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }

                              if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                            obscureText: !_isPasswordVisible,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              hintText: 'Enter your password',
                              prefixIcon: Icon(
                                Icons.lock_outline_rounded,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              border: const OutlineInputBorder(),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isPasswordVisible
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isPasswordVisible = !_isPasswordVisible;
                                  });
                                },
                              ),
                              labelStyle: TextStyle(
                                  color: Theme.of(context).colorScheme.primary),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          TextFormField(
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }

                              if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                            obscureText: !_isPasswordVisible,
                            decoration: InputDecoration(
                              labelText: ' Repeat Password',
                              hintText: 'Enter your  repeat password',
                              prefixIcon: Icon(
                                Icons.lock_outline_rounded,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              border: const OutlineInputBorder(),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isPasswordVisible
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isPasswordVisible = !_isPasswordVisible;
                                  });
                                },
                              ),
                              labelStyle: TextStyle(
                                  color: Theme.of(context).colorScheme.primary),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 0, 122, 204),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4)),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  'CREATE',
                                  style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              onPressed: () {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  /// do something
                                  if (_currentPage < 1) {
                                    _pageController.nextPage(
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.easeInOut,
                                    );
                                  }
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

class _Logo extends StatelessWidget {
  const _Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FlutterLogo(size: isSmallScreen ? 100 : 200),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Welcome to Flutter!",
            textAlign: TextAlign.center,
            style: isSmallScreen
                ? Theme.of(context).textTheme.headline5
                : Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(color: Colors.black),
          ),
        )
      ],
    );
  }
}
