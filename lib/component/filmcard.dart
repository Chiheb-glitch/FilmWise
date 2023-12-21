import 'package:flutter/material.dart';

import '../config/size_config.dart';

class Filmcard extends StatelessWidget {
  const Filmcard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 0, 5, 4),
      height: 134,
      width: SizeConfig.screenWidth!! * 0.22,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color:
                Color.fromARGB(255, 0, 0, 0), // Set the color of the box shadow
            blurRadius: 8, // Set the blur radius
            // Set the spread radius
            offset: Offset(0, 2), // Set the offset
          ),
        ],
        image: DecorationImage(
          image: AssetImage(
              'assets/fight club.png'), // Replace with your image path
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
