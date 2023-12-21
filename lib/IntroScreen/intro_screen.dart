import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../dashboard.dart';
import '../login.dart';

/*  const Filmcard({
    Key? key,
  }) : super(key: key);
*/
class introscreen extends StatefulWidget {
  const introscreen({
    Key? key,
  }) : super(key: key);

  @override
  _introscreen createState() => _introscreen();
}

class _introscreen extends State<introscreen> with TickerProviderStateMixin {
  bool d = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 20, 20, 20),
        body: Center(
          child: DefaultTextStyle(
            style: TextStyle(
              color: Color.fromARGB(255, 133, 127, 127), // Set the text color
              fontFamily: 'Poppins', // Set the font family
              fontWeight: FontWeight.w100, // Set the font weight
              fontSize: 22, // Set the font size
              height: 1.2,
            ),
            child: AnimatedTextKit(
              onFinished: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        Login(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      var begin = Offset(1.0, 0);
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
              animatedTexts: [
                FlickerAnimatedText('Film Wise'),
                FlickerAnimatedText('Powred By Anomind Visuals'),
              ],
              onTap: () {
                print("Tap Event");
              },
            ),
          ),
        ));
  }
}
