import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_dashboard/dashboard.dart';

void main() {
  runApp(ProfilePage());
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Container(
              height: 350,
              child: Stack(
                children: [
                  // Background Banner
                  Container(
                    height: 200.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0aEjACt2jj8i3I0n3u2rHnWrk9igVej4LTA&usqp=CAU',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Center(
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 2.0,
                            color: Colors.white,
                          ),
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0aEjACt2jj8i3I0n3u2rHnWrk9igVej4LTA&usqp=CAU',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 0,
                    child: Container(
                      width: 500,
                      color: Color.fromARGB(149, 2, 0, 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(83, 158, 158, 158),
                            ),
                            child: IconButton(
                                onPressed: () {
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
                                },
                                icon: Icon(
                                  Icons.clear,
                                  color: Color.fromARGB(255, 129, 12, 168),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Profile Statistics
                  Positioned(
                    top: 157.0,
                    left: 16.0,
                    right: 16.0,
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        borderRadius: BorderRadius.circular(30.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Salim Jbeli',
                            style: TextStyle(
                              color: Color.fromARGB(
                                  255, 193, 192, 192), // Set the text color
                              fontFamily: 'Poppins', // Set the font family
                              fontWeight:
                                  FontWeight.normal, // Set the font weight
                              fontSize: 27, // Set the font size
                            ),
                          ),
                          SizedBox(height: 2.0),
                          Text(
                            '#1547895',
                            style: TextStyle(
                              color: Color.fromARGB(
                                  255, 116, 116, 116), // Set the text color
                              fontFamily: 'Poppins', // Set the font family
                              fontWeight:
                                  FontWeight.normal, // Set the font weight
                              fontSize: 15, // Set the font size
                            ),
                          ),
                          SizedBox(height: 16.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Reviewd',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 193, 192,
                                          192), // Set the text color
                                      fontFamily:
                                          'Poppins', // Set the font family
                                      fontWeight: FontWeight
                                          .normal, // Set the font weight
                                      fontSize: 18, // Set the font size
                                    ),
                                  ),
                                  Text(
                                    '50',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 193, 192,
                                          192), // Set the text color
                                      fontFamily:
                                          'Poppins', // Set the font family
                                      fontWeight: FontWeight
                                          .normal, // Set the font weight
                                      fontSize: 15, // Set the font size
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Followers',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 193, 192,
                                          192), // Set the text color
                                      fontFamily:
                                          'Poppins', // Set the font family
                                      fontWeight: FontWeight
                                          .normal, // Set the font weight
                                      fontSize: 18, // Set the font size
                                    ),
                                  ),
                                  Text(
                                    '50',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 193, 192,
                                          192), // Set the text color
                                      fontFamily:
                                          'Poppins', // Set the font family
                                      fontWeight: FontWeight
                                          .normal, // Set the font weight
                                      fontSize: 15, // Set the font size
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Followning',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 193, 192,
                                          192), // Set the text color
                                      fontFamily:
                                          'Poppins', // Set the font family
                                      fontWeight: FontWeight
                                          .normal, // Set the font weight
                                      fontSize: 18, // Set the font size
                                    ),
                                  ),
                                  Text(
                                    '50',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 193, 192,
                                          192), // Set the text color
                                      fontFamily:
                                          'Poppins', // Set the font family
                                      fontWeight: FontWeight
                                          .normal, // Set the font weight
                                      fontSize: 15, // Set the font size
                                    ),
                                  ),
                                ],
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
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 0, 0, 0),
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              width: 450,
              child: Column(children: [
                Row(
                  children: [
                    Icon(
                      Icons.wine_bar,
                      color: Color.fromARGB(255, 129, 12, 168),
                      size: 40,
                    ),
                    Text(
                      'Achievements',
                      style: TextStyle(
                        color: Color.fromARGB(
                            255, 193, 192, 192), // Set the text color
                        fontFamily: 'Poppins', // Set the font family
                        fontWeight: FontWeight.normal, // Set the font weight
                        fontSize: 25, // Set the font size
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset('assets/ROOKIE CINEPHILE.png'),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'ROOKIE CINEPHILE',
                          style: TextStyle(
                            color: Color.fromARGB(
                                255, 193, 192, 192), // Set the text color
                            fontFamily: 'Poppins', // Set the font family
                            fontWeight: FontWeight.w800, // Set the font weight
                            fontSize: 18, // Set the font size
                          ),
                        ),
                        Text(
                          'Watched More Than 250 Films',
                          style: TextStyle(
                            color: Color.fromARGB(
                                255, 193, 192, 192), // Set the text color
                            fontFamily: 'Poppins', // Set the font family
                            fontWeight: FontWeight.w400, // Set the font weight
                            fontSize: 18, // Set the font size
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ]),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 0, 0, 0),
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              width: 450,
              child: Column(children: [
                Row(
                  children: [
                    Icon(
                      Icons.bar_chart,
                      color: Color.fromARGB(255, 129, 12, 168),
                      size: 40,
                    ),
                    Text(
                      'Statistics',
                      style: TextStyle(
                        color: Color.fromARGB(
                            255, 193, 192, 192), // Set the text color
                        fontFamily: 'Poppins', // Set the font family
                        fontWeight: FontWeight.normal, // Set the font weight
                        fontSize: 25, // Set the font size
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Watched',
                      style: TextStyle(
                        color: Color.fromARGB(
                            255, 193, 192, 192), // Set the text color
                        fontFamily: 'Poppins', // Set the font family
                        fontWeight: FontWeight.normal, // Set the font weight
                        fontSize: 25, // Set the font size
                      ),
                    ),
                    Text(
                      '50',
                      style: TextStyle(
                        color: Color.fromARGB(
                            255, 193, 192, 192), // Set the text color
                        fontFamily: 'Poppins', // Set the font family
                        fontWeight: FontWeight.normal, // Set the font weight
                        fontSize: 25, // Set the font size
                      ),
                    ),
                  ],
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
