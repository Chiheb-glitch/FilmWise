import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_dashboard/find.dart';
import '../config/size_config.dart';

class AppBarActionItems extends StatelessWidget {
  GlobalKey<ScaffoldState> drawerKey;

  AppBarActionItems({
    required this.drawerKey,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 7),
          child: IconButton(
              onPressed: () {
                drawerKey.currentState?.openDrawer();
              },
              icon: Icon(Icons.menu,
                  size: 35, color: Color.fromARGB(255, 93, 90, 90))),
        ),

        //SizedBox(width: (SizeConfig.screenWidth!! * 50)/384),
        Container(
          margin: EdgeInsets.only(top: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              /*   IconButton(
                  onPressed: () {
                    drawerKey!.currentState!.openDrawer();
                  },
                  icon: Icon(Icons.menu,
                      size: 40, color: Color.fromARGB(255, 93, 105, 122))),
       */

              Text(
                'Cinephilapp',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 122, 204), // Set the text color
                  fontFamily: 'Poppins  ', // Set the font family
                  fontWeight: FontWeight.w500, // Set the font weight
                  fontSize: 26, // Set the font size
                ),
              ),
              Text(
                'Unlock Your Inner Film Buff',
                style: TextStyle(
                  color:
                      Color.fromARGB(255, 93, 121, 173), // Set the text color
                  fontFamily: 'Poppins', // Set the font family
                  fontWeight: FontWeight.w300, // Set the font weight
                  fontSize: 8, // Set the font size
                ),
              ),
            ],
          ),
        ),
        //  SizedBox(width: (SizeConfig.screenWidth!! * 115) / 500),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => Find(
                  arg: "4",
                ),
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
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
              width: (SizeConfig.screenWidth!! * 60) / 500,
              child: Icon(
                Icons.search,
                color: Color.fromARGB(255, 93, 90, 90),
                size: 35,
              )),
        )
      ],
    );
  }
}
