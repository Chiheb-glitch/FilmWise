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

  bool isImage1 = true;

  void _toggleImage() {
    setState(() {
      isImage1 = !isImage1;
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
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Stack(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            AnimatedContainer(
                              padding: EdgeInsets.only(
                                  bottom: (MediaQuery.of(context).size.height *
                                          100) /
                                      792),
                              duration: Duration(microseconds: 1),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: isImage1
                                      ? AssetImage("assets/loginbg.png")
                                      : AssetImage("assets/createbg.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              height:
                                  (MediaQuery.of(context).size.height * 350) /
                                      792,
                            ),
                            Stack(
                              children: [
                                Container(
                                  color: Color.fromARGB(250, 30, 30, 30),
                                  height: (MediaQuery.of(context).size.height *
                                          200) /
                                      792,
                                ),
                                Positioned(
                                  top: 0,
                                  width: MediaQuery.of(context).size.width,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(250, 30, 30, 30),
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                              Color.fromARGB(255, 28, 20, 77),

                                          // Shadow color
                                          spreadRadius: 12, // Spread radius
                                          blurRadius: 8, // Blur radius
                                          offset: Offset(0,
                                              -4), // Offset to the top (negative y value)
                                        ),
                                      ],
                                    ),
                                    height: 0,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        bottom:
                            (MediaQuery.of(context).size.height * 200) / 792,
                        child: Container(
                          height:
                              (MediaQuery.of(context).size.height * 600) / 792,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color.fromARGB(10, 24, 20, 136),
                                Color.fromARGB(20, 24, 20, 136),
                                Color.fromARGB(30, 24, 20, 136),
                                Color.fromARGB(70, 24, 20, 136),
                                Color.fromARGB(110, 24, 20, 136),
                                Color.fromARGB(130, 24, 20, 136),
                                Color.fromARGB(130, 24, 20, 136),
                                Color.fromARGB(70, 24, 20, 136),
                                Color.fromARGB(10, 24, 20, 136),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: PageView(
                      allowImplicitScrolling: false,
                      scrollDirection: Axis.horizontal,
                      controller: _pageController,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      children: [
                        ListView(
                          children: [
                            SizedBox(
                              height:
                                  (MediaQuery.of(context).size.height * 240) /
                                      792,
                            ),
                            Center(
                              child: Container(
                                margin: EdgeInsets.fromLTRB(25, 0, 25, 25),
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        "SIGN IN AND ",
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary, // Set the text color
                                          fontFamily:
                                              'Poppins', // Set the font family
                                          fontWeight: FontWeight
                                              .w200, // Set the font weight
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
                                          fontFamily:
                                              'Poppins', // Set the font family
                                          fontWeight: FontWeight
                                              .w200, // Set the font weight
                                          fontSize: 17,
                                          // Set the font size
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                        color: Color.fromARGB(250, 30, 30, 30),
                                        height: 1,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.9,
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
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                          border: OutlineInputBorder(),
                                          labelStyle: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary),

                                          // Customize the border color
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary),
                                          ),
                                        ),
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary),
                                      ),
                                      SizedBox(height: 16),
                                      TextFormField(
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary),
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
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                          border: const OutlineInputBorder(),
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                              _isPasswordVisible
                                                  ? Icons.visibility_off
                                                  : Icons.visibility,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                _isPasswordVisible =
                                                    !_isPasswordVisible;
                                              });
                                            },
                                          ),
                                          labelStyle: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 16),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            "Forget Password?",
                                            style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                              decorationThickness: 2.0,
                                              color: Color.fromARGB(255, 0, 122,
                                                  204), // Set the text color
                                              fontFamily:
                                                  'Poppins', // Set the font family
                                              fontWeight: FontWeight
                                                  .w500, // Set the font weight
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
                                            backgroundColor: Color.fromARGB(
                                                255, 12, 85, 155),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Text(
                                              'LOGIN',
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          onPressed: () {
                                            if (_formKey.currentState
                                                    ?.validate() ??
                                                false) {
                                              /// do something
                                              if (_currentPage < 1) {
                                                Navigator.push(
                                                  context,
                                                  PageRouteBuilder(
                                                    pageBuilder: (context,
                                                            animation,
                                                            secondaryAnimation) =>
                                                        Dashboard(),
                                                    transitionsBuilder:
                                                        (context,
                                                            animation,
                                                            secondaryAnimation,
                                                            child) {
                                                      var begin = Offset(-1.0,
                                                          0); // Change the begin offset to start from the left
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
                                                );
                                              }
                                            }
                                          },
                                        ),
                                      ),
                                      SizedBox(height: 16),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Don’t have an account?",
                                            style: TextStyle(
                                              decorationThickness: 2.0,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary, // Set the text color
                                              fontFamily:
                                                  'Poppins', // Set the font family
                                              fontWeight: FontWeight
                                                  .w500, // Set the font weight
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
                                                _toggleImage();
                                                _pageController.nextPage(
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  curve: Curves.easeInOut,
                                                );
                                              }
                                            },
                                            child: Text(
                                              "Signup",
                                              style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                                decorationThickness: 2.0,
                                                color: Color.fromARGB(
                                                    255,
                                                    0,
                                                    122,
                                                    204), // Set the text color
                                                fontFamily:
                                                    'Poppins', // Set the font family
                                                fontWeight: FontWeight
                                                    .w500, // Set the font weight
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
                            ),
                          ],
                        ),
                        ListView(
                          children: [
                            SizedBox(
                              height:
                                  (MediaQuery.of(context).size.height * 240) /
                                      792,
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
                              child: Form(
                                key: _formKey1,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 16),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      "SIGN IN AND ",
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w200,
                                        fontSize: 17,
                                      ),
                                    ),
                                    Text(
                                      "UNLOCK YOUR INNER FILM BUFF",
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w200,
                                        fontSize: 17,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                      color: Color.fromARGB(113, 117, 117, 117),
                                      height: 1,
                                      width: double.infinity,
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
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                        border: OutlineInputBorder(),
                                        labelStyle: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary),

                                        // Customize the border color
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary),
                                        ),
                                      ),
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
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
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                        border: OutlineInputBorder(),
                                        labelStyle: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary),

                                        // Customize the border color
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary),
                                        ),
                                      ),
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
                                    ),
                                    SizedBox(height: 16),
                                    TextFormField(
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
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
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                        border: const OutlineInputBorder(),
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            _isPasswordVisible
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _isPasswordVisible =
                                                  !_isPasswordVisible;
                                            });
                                          },
                                        ),
                                        labelStyle: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                    TextFormField(
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
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
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                        border: const OutlineInputBorder(),
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            _isPasswordVisible
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _isPasswordVisible =
                                                  !_isPasswordVisible;
                                            });
                                          },
                                        ),
                                        labelStyle: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary),
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
                                              borderRadius:
                                                  BorderRadius.circular(4)),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Text(
                                            'CREATE',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        onPressed: () {
                                          if (_formKey.currentState
                                                  ?.validate() ??
                                              false) {
                                            /// do something
                                            if (_currentPage < 1) {
                                              _pageController.nextPage(
                                                duration:
                                                    Duration(milliseconds: 500),
                                                curve: Curves.easeInOut,
                                              );
                                            }
                                          }
                                        },
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "You have an account?",
                                          style: TextStyle(
                                            decorationThickness: 2.0,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary, // Set the text color
                                            fontFamily:
                                                'Poppins', // Set the font family
                                            fontWeight: FontWeight
                                                .w500, // Set the font weight
                                            fontSize: 17,

                                            // Set the font size
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            _toggleImage();

                                            if (_currentPage >= 1) {
                                              _pageController.previousPage(
                                                duration:
                                                    Duration(milliseconds: 500),
                                                curve: Curves.easeInOut,
                                              );
                                            }
                                          },
                                          child: Text(
                                            "Login",
                                            style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                              decorationThickness: 2.0,
                                              color: Color.fromARGB(255, 0, 122,
                                                  204), // Set the text color
                                              fontFamily:
                                                  'Poppins', // Set the font family
                                              fontWeight: FontWeight
                                                  .w500, // Set the font weight
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
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
