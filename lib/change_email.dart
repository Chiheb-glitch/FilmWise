import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'config/size_config.dart';
import 'dashboard.dart';

class change_email extends StatefulWidget {
  const change_email({Key? key}) : super(key: key);

  @override
  State<change_email> createState() => _change_email();
}

class _change_email extends State<change_email> {
  bool _isDark = true;
  final PageController _pageController = PageController();
  bool _isPasswordVisible = false;
  int _currentPage = 0;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(83, 158, 158, 158),
                    border: Border.all(
                      width: 2.0,
                      color: Colors.black,
                    ),
                  ),
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    Dashboard(),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              var begin = Offset(-1.0,
                                  0); // Change the begin offset to start from the left
                              var end = Offset.zero;
                              var tween = Tween(begin: begin, end: end);
                              var offsetAnimation = animation.drive(tween);

                              return SlideTransition(
                                position: offsetAnimation,
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.clear,
                        color: Color.fromARGB(255, 129, 12, 168),
                      )),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30, 70, 30, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: EdgeInsets.only(
                          bottom: 4.0), // Add padding for bottom border
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              width: 2.0,
                              color: _currentPage == 0
                                  ? Color.fromARGB(255, 0, 122, 204)
                                  : Theme.of(context).colorScheme.background),
                        ),
                      ),
                      child: Text(
                        'STEP 1',
                        style: TextStyle(
                          color: Color.fromARGB(
                              255, 116, 116, 116), // Set the text color
                          fontFamily: 'Poppins', // Set the font family
                          fontWeight: FontWeight.normal, // Set the font weight
                          fontSize: 37, // Set the font size
                        ),
                      )),
                  Container(
                      padding: EdgeInsets.only(
                          bottom: 4.0), // Add padding for bottom border
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              width: 2.0,
                              color: _currentPage == 1
                                  ? Color.fromARGB(255, 0, 122, 204)
                                  : Theme.of(context).colorScheme.background),
                        ),
                      ),
                      child: Text(
                        'STEP 2',
                        style: TextStyle(
                          color: Color.fromARGB(
                              255, 116, 116, 116), // Set the text color
                          fontFamily: 'Poppins', // Set the font family
                          fontWeight: FontWeight.normal, // Set the font weight
                          fontSize: 37, // Set the font size
                        ),
                      )),
                ],
              ),
            ),
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
                    margin: EdgeInsets.fromLTRB(30, 0, 30, 25),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                              labelText: 'New email',
                              hintText: 'Enter your  new email',
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: Colors.grey,
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
                                borderSide: BorderSide(color: Colors.grey),
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
                              prefixIcon: const Icon(
                                Icons.lock_outline_rounded,
                                color: Colors.grey,
                              ),
                              border: const OutlineInputBorder(),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isPasswordVisible
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.grey,
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
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  'NEXT >',
                                  style: TextStyle(
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
                  Container(
                    margin: EdgeInsets.fromLTRB(30, 60, 30, 25),
                    child: Form(
                      key: _formKey1,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                            validator: (value) {
                              // add email validation

                              return null;
                            },
                            decoration: const InputDecoration(
                              labelText: 'CODE',
                              hintText: 'CODE',
                              prefixIcon: Icon(
                                Icons.password,
                                color: Colors.grey,
                              ),
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(color: Colors.grey),

                              // Customize the border color
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 129, 12, 168),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4)),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  'NEXT >',
                                  style: TextStyle(
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

class _FormContent extends StatefulWidget {
  const _FormContent({Key? key}) : super(key: key);

  @override
  State<_FormContent> createState() => __FormContentState();
}

class __FormContentState extends State<_FormContent> {
  bool _isPasswordVisible = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 300),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
              decoration: const InputDecoration(
                labelText: 'New email',
                hintText: 'Enter your  new email',
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(),
                labelStyle: TextStyle(color: Colors.grey),

                // Customize the border color
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
            _gap(),
            TextFormField(
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
                prefixIcon: const Icon(
                  Icons.lock_outline_rounded,
                  color: Colors.grey,
                ),
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
                labelStyle: TextStyle(color: Colors.grey),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            _gap(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 129, 12, 168),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Sign in',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    /// do something
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _gap() => const SizedBox(height: 16);
}
