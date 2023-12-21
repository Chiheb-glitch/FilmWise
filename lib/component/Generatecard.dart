import 'package:flutter/material.dart';
import 'package:responsive_dashboard/find.dart';

import '../config/size_config.dart';

class GeneretFilmcard extends StatefulWidget {
  final String imageUrl;
  final String id;

  const GeneretFilmcard({required this.imageUrl, required this.id});

  @override
  _GeneretFilmcard createState() => _GeneretFilmcard();
}

bool _isHovered = false;

class _GeneretFilmcard extends State<GeneretFilmcard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                Find(arg: "${widget.id}"),
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
      child: MouseRegion(
        cursor: MouseCursor.uncontrolled,
        onHover: (_) {
          setState(() {
            _isHovered = true;
          });
        },
        onExit: (_) {
          setState(() {
            _isHovered = false;
          });
        },
        child: Container(
            margin: EdgeInsets.fromLTRB(5, 0, 10, 5),
            height: _isHovered
                ? (SizeConfig.screenHeight!! * 90) / 384
                : (SizeConfig.screenHeight!! * 80) / 384,
            width: _isHovered
                ? (SizeConfig.screenWidth!! * 120) / 384
                : (SizeConfig.screenWidth!! * 110) / 384,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.0),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(
                      255, 4, 34, 83), // Set the color of the box shadow
                  blurRadius: 8, // Set the blur radius
                  // Set the spread radius
                  offset: Offset(0, 2), // Set the offset
                ),
              ],
              image: DecorationImage(
                image: NetworkImage("${widget.imageUrl}"),
                fit: BoxFit.cover,
              ),
            )),
      ),
    );
  }
}
