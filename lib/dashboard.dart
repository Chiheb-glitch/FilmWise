import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:responsive_dashboard/component/Generatecard.dart';
import 'package:responsive_dashboard/component/appBarActionItems.dart';
import 'package:responsive_dashboard/component/filmcard.dart';
import 'package:responsive_dashboard/component/listscard.dart';
import 'package:responsive_dashboard/component/sideMenu.dart';
import 'package:responsive_dashboard/config/size_config.dart';
import 'package:responsive_dashboard/find.dart';
import 'package:responsive_dashboard/messages_list.dart';
import 'package:responsive_dashboard/recofilm.dart';
import 'package:responsive_dashboard/style/colors.dart';
import 'package:responsive_dashboard/style/style.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:ui' as ui;
import 'package:http/http.dart' as http;
import 'dart:convert';

class Generatecard {
  final String name;
  final String imageUrl;

  Generatecard({
    required this.name,
    required this.imageUrl,
  });
}

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  late AnimationController _controller;
  late Animation<double> _animation;
  List<bool> cardgenerate = [false, false, false];
  var c = Generatecard(name: "", imageUrl: "");
  List<Generatecard> cardlist = [];
  bool generateload = true;
  fetch_generates() async {
    final apiUrl = 'http://127.0.0.1:8000/films/add_film_generate';

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Token 33f856b083f6c1c85f466dd0c382e770b9e1b5ba'
        },
      );
      print(response.statusCode);
      print(jsonDecode(response.body));
      var i = 0;
      for (var card in jsonDecode(response.body)) {
        print(card);
        Generatecard c = Generatecard(
            name: card["name"].toString(),
            imageUrl: card["imageurl"].toString());
        setState(() {
          cardlist.add(c);
        });
        print(card["imageurl"]);
        if (card["imageurl"] != 0) {
          setState(() {
            cardgenerate[i] = true;
          });
        }
        i++;
      }
      setState(() {
        generateload = false;
      });
    } catch (e) {
      setState(() {
        generateload = false;
      });
      print("errer ${e}");
    }
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
    fetch_generates();
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
      key: _drawerKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                flex: 10,
                child: Container(
                  color: Theme.of(context).colorScheme.background,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          AppBarActionItems(
                            drawerKey: _drawerKey,
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 5),
                            height: 1,
                            color: Color.fromARGB(255, 71, 71, 71),
                            width: SizeConfig.screenWidth!! - 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 2),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      child: Column(
                                        children: [
                                          Stack(
                                            children: [
                                              Container(
                                                  margin:
                                                      EdgeInsets.only(right: 0),
                                                  child: Icon(
                                                    BootstrapIcons.gift_fill,
                                                    color: Color.fromARGB(
                                                        255, 121, 121, 121),
                                                    size: 20,
                                                  )),
                                              SizedBox(
                                                  width: (SizeConfig
                                                              .screenWidth!! *
                                                          11) /
                                                      500),
                                              Positioned(
                                                top: 0,
                                                right: 0,
                                                child: Container(
                                                  width: 0,
                                                  height: 0,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors
                                                        .red, // Set the desired circle color
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      '',
                                                      style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255,
                                                            116,
                                                            116,
                                                            116), // Set the text color
                                                        fontFamily:
                                                            'Poppins', // Set the font family
                                                        fontWeight: FontWeight
                                                            .normal, // Set the font weight
                                                        fontSize:
                                                            7, // Set the font size
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            '9999 Points',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255,
                                                  116,
                                                  116,
                                                  116), // Set the text color
                                              fontFamily:
                                                  'Poppins', // Set the font family
                                              fontWeight: FontWeight
                                                  .w600, // Set the font weight
                                              fontSize:
                                                  (SizeConfig.screenWidth!! *
                                                          7) /
                                                      384, // Set the font size
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                        width: (SizeConfig.screenWidth!! * 6) /
                                            500),
                                    Column(
                                      children: [
                                        Container(
                                          height: 19,
                                          width: 3,
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 121, 121, 121),

                                            borderRadius: BorderRadius.circular(
                                                10), // Set the desired border radius value
                                            border: Border.all(
                                                width: 1,
                                                color: Colors
                                                    .black), // Border properties
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                        width: (SizeConfig.screenWidth!! * 6) /
                                            500),
                                    Container(
                                      child: Column(
                                        children: [
                                          Stack(
                                            children: [
                                              Container(
                                                  margin:
                                                      EdgeInsets.only(right: 0),
                                                  child: Icon(
                                                    BootstrapIcons.star_fill,
                                                    color: Color.fromARGB(
                                                        255, 121, 121, 121),
                                                    size: 22,
                                                  )),
                                              SizedBox(
                                                  width: (SizeConfig
                                                              .screenWidth!! *
                                                          10) /
                                                      500),
                                              Positioned(
                                                top: 0,
                                                right: 0,
                                                child: Container(
                                                  width: 0,
                                                  height: 0,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors
                                                        .red, // Set the desired circle color
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      '',
                                                      style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255,
                                                            116,
                                                            116,
                                                            116), // Set the text color
                                                        fontFamily:
                                                            'Poppins', // Set the font family
                                                        fontWeight: FontWeight
                                                            .normal, // Set the font weight
                                                        fontSize:
                                                            7, // Set the font size
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 1,
                                          ),
                                          Text(
                                            '0 Rewards',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255,
                                                  116,
                                                  116,
                                                  116), // Set the text color
                                              fontFamily:
                                                  'Poppins', // Set the font family
                                              fontWeight: FontWeight
                                                  .w600, // Set the font weight
                                              fontSize:
                                                  (SizeConfig.screenWidth!! *
                                                          7) /
                                                      384, // Set the font size
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                        width: (SizeConfig.screenWidth!! * 6) /
                                            500),
                                    Column(
                                      children: [
                                        Container(
                                          height: 19,
                                          width: 3,
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 121, 121, 121),

                                            borderRadius: BorderRadius.circular(
                                                10), // Set the desired border radius value
                                            border: Border.all(
                                                width: 1,
                                                color: Colors
                                                    .black), // Border properties
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                        width: (SizeConfig.screenWidth!! * 6) /
                                            500),
                                    Container(
                                      child: Column(
                                        children: [
                                          Stack(
                                            children: [
                                              Container(
                                                  margin:
                                                      EdgeInsets.only(right: 0),
                                                  child: Icon(
                                                    BootstrapIcons.controller,
                                                    color: Color.fromARGB(
                                                        255, 121, 121, 121),
                                                    size: 22,
                                                  )),
                                              SizedBox(
                                                  width: (SizeConfig
                                                              .screenWidth!! *
                                                          10) /
                                                      500),
                                              Positioned(
                                                top: 0,
                                                right: 0,
                                                child: Container(
                                                  width: 0,
                                                  height: 0,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors
                                                        .red, // Set the desired circle color
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      '',
                                                      style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255,
                                                            116,
                                                            116,
                                                            116), // Set the text color
                                                        fontFamily:
                                                            'Poppins', // Set the font family
                                                        fontWeight: FontWeight
                                                            .normal, // Set the font weight
                                                        fontSize:
                                                            7, // Set the font size
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 1,
                                          ),
                                          Text(
                                            'Games',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255,
                                                  116,
                                                  116,
                                                  116), // Set the text color
                                              fontFamily:
                                                  'Poppins', // Set the font family
                                              fontWeight: FontWeight
                                                  .w600, // Set the font weight
                                              fontSize:
                                                  (SizeConfig.screenWidth!! *
                                                          7) /
                                                      384, // Set the font size
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      child: Column(
                                        children: [
                                          Stack(
                                            children: [
                                              Container(
                                                  margin:
                                                      EdgeInsets.only(right: 0),
                                                  child: Icon(
                                                    BootstrapIcons
                                                        .send_plus_fill,
                                                    color: Color.fromARGB(
                                                        255, 121, 121, 121),
                                                    size: 22,
                                                  )),
                                              SizedBox(
                                                  width: (SizeConfig
                                                              .screenWidth!! *
                                                          10) /
                                                      500),
                                              Positioned(
                                                top: 0,
                                                right: 0,
                                                child: Container(
                                                  width: 0,
                                                  height: 0,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors
                                                        .red, // Set the desired circle color
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      '',
                                                      style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255,
                                                            116,
                                                            116,
                                                            116), // Set the text color
                                                        fontFamily:
                                                            'Poppins', // Set the font family
                                                        fontWeight: FontWeight
                                                            .normal, // Set the font weight
                                                        fontSize:
                                                            7, // Set the font size
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 1,
                                          ),
                                          Text(
                                            'Send a film',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255,
                                                  116,
                                                  116,
                                                  116), // Set the text color
                                              fontFamily:
                                                  'Poppins', // Set the font family
                                              fontWeight: FontWeight
                                                  .w600, // Set the font weight
                                              fontSize:
                                                  (SizeConfig.screenWidth!! *
                                                          7) /
                                                      384, // Set the font size
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                        width: (SizeConfig.screenWidth!! * 6) /
                                            500),
                                    Column(
                                      children: [
                                        Container(
                                          height: 19,
                                          width: 3,
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 121, 121, 121),

                                            borderRadius: BorderRadius.circular(
                                                10), // Set the desired border radius value
                                            border: Border.all(
                                                width: 1,
                                                color: Colors
                                                    .black), // Border properties
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                        width: (SizeConfig.screenWidth!! * 6) /
                                            500),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                            pageBuilder: (context, animation,
                                                    secondaryAnimation) =>
                                                messages_list(),
                                            transitionsBuilder: (context,
                                                animation,
                                                secondaryAnimation,
                                                child) {
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
                                      child: Container(
                                        child: Column(
                                          children: [
                                            Stack(
                                              children: [
                                                Container(
                                                    padding: EdgeInsets.only(
                                                        right: 3),
                                                    margin: EdgeInsets.only(
                                                        right: 0),
                                                    child: Icon(
                                                      BootstrapIcons
                                                          .envelope_plus_fill,
                                                      color: Color.fromARGB(
                                                          255, 121, 121, 121),
                                                      size: 22,
                                                    )),
                                                SizedBox(
                                                    width: (SizeConfig
                                                                .screenWidth!! *
                                                            10) /
                                                        500),
                                                Positioned(
                                                  top: 0,
                                                  right: 0,
                                                  child: Container(
                                                    width: 7,
                                                    height: 7,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors
                                                          .red, // Set the desired circle color
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        '',
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              116,
                                                              116,
                                                              116), // Set the text color
                                                          fontFamily:
                                                              'Poppins', // Set the font family
                                                          fontWeight: FontWeight
                                                              .normal, // Set the font weight
                                                          fontSize:
                                                              7, // Set the font size
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 1,
                                            ),
                                            Text(
                                              'Messages',
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    255,
                                                    116,
                                                    116,
                                                    116), // Set the text color
                                                fontFamily:
                                                    'Poppins', // Set the font family
                                                fontWeight: FontWeight
                                                    .w600, // Set the font weight
                                                fontSize: (SizeConfig
                                                            .screenWidth!! *
                                                        7) /
                                                    384, // Set the font size
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                        width: (SizeConfig.screenWidth! * 6) /
                                            500),
                                    Column(
                                      children: [
                                        Container(
                                          height: 19,
                                          width: 3,
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 121, 121, 121),

                                            borderRadius: BorderRadius.circular(
                                                10), // Set the desired border radius value
                                            border: Border.all(
                                                width: 1,
                                                color: Colors
                                                    .black), // Border properties
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                        width: (SizeConfig.screenWidth!! * 6) /
                                            500),
                                    Container(
                                      child: Column(
                                        children: [
                                          Stack(
                                            children: [
                                              Container(
                                                  margin:
                                                      EdgeInsets.only(right: 0),
                                                  child: Icon(
                                                    BootstrapIcons.bell_fill,
                                                    color: Color.fromARGB(
                                                        255, 121, 121, 121),
                                                    size: 22,
                                                  )),
                                              SizedBox(
                                                  width: (SizeConfig
                                                              .screenWidth!! *
                                                          10) /
                                                      500),
                                              Positioned(
                                                top: 0,
                                                right: 0,
                                                child: Container(
                                                  width: 7,
                                                  height: 7,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors
                                                        .red, // Set the desired circle color
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      '',
                                                      style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255,
                                                            116,
                                                            116,
                                                            116), // Set the text color
                                                        fontFamily:
                                                            'Poppins', // Set the font family
                                                        fontWeight: FontWeight
                                                            .normal, // Set the font weight
                                                        fontSize:
                                                            7, // Set the font size
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 1,
                                          ),
                                          Text(
                                            'Notifications',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255,
                                                  116,
                                                  116,
                                                  116), // Set the text color
                                              fontFamily:
                                                  'Poppins', // Set the font family
                                              fontWeight: FontWeight
                                                  .w600, // Set the font weight
                                              fontSize:
                                                  (SizeConfig.screenWidth!! *
                                                          7) /
                                                      384, // Set the font size
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 2),
                            height: 1,
                            color: Color.fromARGB(255, 71, 71, 71),
                            width: SizeConfig.screenWidth! - 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(5, 0, 0, 3),
                                child: Text(
                                  'MY TOP 5 FAVORITE FILMS',
                                  style: TextStyle(
                                    color: Color.fromARGB(
                                        255, 88, 99, 116), // Set the text color
                                    fontFamily:
                                        'Montserrat', // Set the font family
                                    fontWeight:
                                        FontWeight.w400, // Set the font weight
                                    fontSize: 12, // Set the font size
                                  ),
                                ),
                              ),
                              SafeArea(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    height: 134,
                                                    width: SizeConfig
                                                            .screenWidth! *
                                                        0.22,
                                                    margin: EdgeInsets.fromLTRB(
                                                        5, 0, 5, 4),
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Color.fromARGB(
                                                              255,
                                                              0,
                                                              0,
                                                              0), // Set the color of the box shadow
                                                          blurRadius:
                                                              8, // Set the blur radius
                                                          // Set the spread radius
                                                          offset: Offset(0,
                                                              2), // Set the offset
                                                        ),
                                                      ],
                                                      color: Color.fromRGBO(
                                                          30, 30, 30, 1),
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          10, 44.5, 10, 20),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .add_circle_outline_rounded,
                                                            color: Colors.blue,
                                                            size: 45,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Filmcard(
                                                    key: null,
                                                  ),
                                                  Filmcard(
                                                    key: null,
                                                  ),
                                                  Filmcard(
                                                    key: null,
                                                  ),
                                                  Filmcard(
                                                    key: null,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 5, 0, 7),
                            height: 1,
                            color: Color.fromARGB(255, 71, 71, 71),
                            width: SizeConfig.screenWidth!! - 20,
                          ),
                          SafeArea(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Column(
                                children: [
                                  Text(
                                    '${cardgenerate}CHOOSE 3 FILMS AND GET YOUR BEST RECOMMENDATION!${generateload}',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 0, 122,
                                          204), // Set the text color
                                      fontFamily:
                                          'Poppins', // Set the font family
                                      fontWeight: FontWeight
                                          .bold, // Set the font weight
                                      fontSize:
                                          (SizeConfig.screenWidth!! * 10) /
                                              384, // Set the font size
                                    ),
                                  ),
                                  if (!generateload)
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          if (cardgenerate[0])
                                            GeneretFilmcard(
                                                imageUrl: cardlist[0].imageUrl,
                                                id: "0"),
                                          if (cardgenerate[0] == false)
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  PageRouteBuilder(
                                                    pageBuilder: (context,
                                                            animation,
                                                            secondaryAnimation) =>
                                                        Find(arg: "0"),
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
                                                );
                                              },
                                              child: Container(
                                                height:
                                                    (SizeConfig.screenHeight! *
                                                            80) /
                                                        384,
                                                width:
                                                    (SizeConfig.screenWidth! *
                                                            110) /
                                                        384,
                                                margin: EdgeInsets.fromLTRB(
                                                    5, 0, 5, 4),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          40.0),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color.fromARGB(
                                                          255,
                                                          4,
                                                          34,
                                                          83), // Set the color of the box shadow
                                                      blurRadius:
                                                          8, // Set the blur radius
                                                      // Set the spread radius
                                                      offset: Offset(0,
                                                          2), // Set the offset
                                                    ),
                                                  ],
                                                  color: Color.fromRGBO(
                                                      30, 30, 30, 1),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      10,
                                                      (((SizeConfig.screenHeight! *
                                                                      80) /
                                                                  384) *
                                                              0.5) -
                                                          (((SizeConfig.screenHeight! *
                                                                      30) /
                                                                  384) *
                                                              0.5),
                                                      10,
                                                      20),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Icon(
                                                        Icons.add_circle,
                                                        color: Colors.blue,
                                                        size: (SizeConfig
                                                                    .screenHeight! *
                                                                30) /
                                                            384,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          if (cardgenerate[1])
                                            GeneretFilmcard(
                                                imageUrl: cardlist[1].imageUrl,
                                                id: "1"),
                                          if (cardgenerate[1] == false)
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  PageRouteBuilder(
                                                    pageBuilder: (context,
                                                            animation,
                                                            secondaryAnimation) =>
                                                        Find(arg: "1"),
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
                                                );
                                              },
                                              child: Container(
                                                height:
                                                    (SizeConfig.screenHeight! *
                                                            80) /
                                                        384,
                                                width:
                                                    (SizeConfig.screenWidth! *
                                                            110) /
                                                        384,
                                                margin: EdgeInsets.fromLTRB(
                                                    5, 0, 5, 4),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          40.0),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color.fromARGB(
                                                          255,
                                                          4,
                                                          34,
                                                          83), // Set the color of the box shadow
                                                      blurRadius:
                                                          8, // Set the blur radius
                                                      // Set the spread radius
                                                      offset: Offset(0,
                                                          2), // Set the offset
                                                    ),
                                                  ],
                                                  color: Color.fromRGBO(
                                                      30, 30, 30, 1),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      10,
                                                      (((SizeConfig.screenHeight! *
                                                                      80) /
                                                                  384) *
                                                              0.5) -
                                                          (((SizeConfig.screenHeight! *
                                                                      30) /
                                                                  384) *
                                                              0.5),
                                                      10,
                                                      20),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Icon(
                                                        Icons.add_circle,
                                                        color: Colors.blue,
                                                        size: (SizeConfig
                                                                    .screenHeight! *
                                                                30) /
                                                            384,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          if (cardgenerate[2])
                                            GeneretFilmcard(
                                                imageUrl: cardlist[2].imageUrl,
                                                id: "2"),
                                          if (cardgenerate[2] == false)
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  PageRouteBuilder(
                                                    pageBuilder: (context,
                                                            animation,
                                                            secondaryAnimation) =>
                                                        Find(arg: "2"),
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
                                                );
                                              },
                                              child: Container(
                                                height:
                                                    (SizeConfig.screenHeight! *
                                                            80) /
                                                        384,
                                                width:
                                                    (SizeConfig.screenWidth! *
                                                            110) /
                                                        384,
                                                margin: EdgeInsets.fromLTRB(
                                                    5, 0, 5, 4),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          40.0),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color.fromARGB(
                                                          255,
                                                          4,
                                                          34,
                                                          83), // Set the color of the box shadow
                                                      blurRadius:
                                                          8, // Set the blur radius
                                                      // Set the spread radius
                                                      offset: Offset(0,
                                                          2), // Set the offset
                                                    ),
                                                  ],
                                                  color: Color.fromRGBO(
                                                      30, 30, 30, 1),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      10,
                                                      (((SizeConfig.screenHeight! *
                                                                      80) /
                                                                  384) *
                                                              0.5) -
                                                          (((SizeConfig.screenHeight! *
                                                                      30) /
                                                                  384) *
                                                              0.5),
                                                      10,
                                                      20),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Icon(
                                                        Icons.add_circle,
                                                        color: Colors.blue,
                                                        size: (SizeConfig
                                                                    .screenHeight! *
                                                                30) /
                                                            384,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  if (generateload)
                                    Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Row(
                                      children: [
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: Color.fromARGB(
                                                  255,
                                                  6,
                                                  94,
                                                  153), // Set the background color of the button
                                              onPrimary: Colors
                                                  .white, // Set the text color of the button
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(
                                                    30), // Set the border radius of the button
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                PageRouteBuilder(
                                                  pageBuilder: (context,
                                                          animation,
                                                          secondaryAnimation) =>
                                                      recofilm(
                                                    arg: cardlist[0].name,
                                                    arg1: cardlist[1].name,
                                                    arg2: cardlist[2].name,
                                                  ),
                                                  transitionsBuilder: (context,
                                                      animation,
                                                      secondaryAnimation,
                                                      child) {
                                                    var begin = Offset(1.0, 0);
                                                    var end = Offset.zero;
                                                    var tween = Tween(
                                                        begin: begin, end: end);
                                                    var offsetAnimation =
                                                        animation.drive(tween);

                                                    return SlideTransition(
                                                      position: offsetAnimation,
                                                      child: child,
                                                    );
                                                  },
                                                ),
                                              );

                                              /*   showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return Dialog(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15.0)),
                                                      child: ScaleTransition(
                                                        scale: _animation,
                                                        child: Container(
                                                            height: (SizeConfig
                                                                    .screenHeight! -
                                                                190),
                                                            width: (SizeConfig
                                                                .screenWidth),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color.fromARGB(
                                                                  255,
                                                                  43,
                                                                  43,
                                                                  43), // Replace with your desired background color
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0), // Adjust the radius value as needed
                                                            ),
                                                            child: Column(
                                                              children: [
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            6,
                                                                            94,
                                                                            153), // Replace with your desired background color
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0), // Adjust the radius value as needed
                                                                  ),
                                                                  width: (SizeConfig
                                                                          .screenWidth *
                                                                      0.75),
                                                                  margin: EdgeInsets.only(
                                                                      top: SizeConfig
                                                                              .screenWidth *
                                                                          0.020),
                                                                  padding: EdgeInsets.fromLTRB(
                                                                      (SizeConfig
                                                                              .screenWidth *
                                                                          0.009),
                                                                      (SizeConfig
                                                                              .screenHeight *
                                                                          0.005),
                                                                      (SizeConfig
                                                                              .screenWidth *
                                                                          0.009),
                                                                      (SizeConfig
                                                                              .screenHeight *
                                                                          0.005)),
                                                                  child: Column(
                                                                    children: [
                                                                      Row(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Wrap(
                                                                            alignment:
                                                                                WrapAlignment.center,
                                                                            children: [
                                                                              Center(
                                                                                child: Text(
                                                                                  "Based on the synopses and genres of the three",
                                                                                  style: TextStyle(
                                                                                    color: Color.fromARGB(255, 217, 217, 217), // Set the text color
                                                                                    fontFamily: 'Roboto', // Set the font family
                                                                                    fontWeight: FontWeight.w400, // Set the font weight
                                                                                    fontSize: (SizeConfig.screenWidth! * 11) / 384, // Set the font size
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Wrap(
                                                                        alignment:
                                                                            WrapAlignment.center,
                                                                        children: [
                                                                          Center(
                                                                            child:
                                                                                Text(
                                                                              "films you have chosen.",
                                                                              style: TextStyle(
                                                                                color: Color.fromARGB(255, 217, 217, 217), // Set the text color
                                                                                fontFamily: 'Roboto', // Set the font family
                                                                                fontWeight: FontWeight.w400, // Set the font weight
                                                                                fontSize: (SizeConfig.screenWidth! * 11) / 384, // Set the font size
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Wrap(
                                                                        alignment:
                                                                            WrapAlignment.center,
                                                                        children: [
                                                                          Center(
                                                                            child:
                                                                                Text(
                                                                              "This recommendation is the best match!!!",
                                                                              style: TextStyle(
                                                                                color: Color.fromARGB(255, 217, 217, 217), // Set the text color
                                                                                fontFamily: 'Roboto', // Set the font family
                                                                                fontWeight: FontWeight.w400, // Set the font weight
                                                                                fontSize: (SizeConfig.screenWidth! * 11) / 384, // Set the font size
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Container(
                                                                        padding: EdgeInsets.fromLTRB(
                                                                            (SizeConfig.screenWidth! *
                                                                                0.001),
                                                                            (SizeConfig.screenHeight! *
                                                                                0.005),
                                                                            (SizeConfig.screenWidth! *
                                                                                0.001),
                                                                            (SizeConfig.screenHeight! *
                                                                                0.005)),
                                                                        margin: EdgeInsets.only(
                                                                            top:
                                                                                (SizeConfig.screenHeight! * 0.005)),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              26,
                                                                              40,
                                                                              50), // Replace with your desired background color
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.0), // Adjust the radius value as needed
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Text(
                                                                              "Pulp Fiction",
                                                                              style: TextStyle(
                                                                                decoration: TextDecoration.underline,

                                                                                color: Color.fromARGB(255, 217, 217, 217), // Set the text color
                                                                                fontFamily: 'Roboto', // Set the font family
                                                                                fontWeight: FontWeight.bold, // Set the font weight
                                                                                fontSize: (SizeConfig.screenWidth! * 18) / 384, // Set the font size
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Container(
                                                                    width: (SizeConfig
                                                                            .screenWidth *
                                                                        0.75),
                                                                    margin: EdgeInsets
                                                                        .only(
                                                                            top:
                                                                                2),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0), // Adjust the radius value as needed
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          6,
                                                                          94,
                                                                          153),
                                                                    ),
                                                                    padding: EdgeInsets
                                                                        .fromLTRB(
                                                                            55,
                                                                            5,
                                                                            55,
                                                                            5),
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          250,
                                                                      width:
                                                                          220,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        image:
                                                                            DecorationImage(
                                                                          image:
                                                                              AssetImage('assets/fight club.png'), // Replace with your image path
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(0.0), // Adjust the radius value as needed

                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                4,
                                                                                34,
                                                                                83), // Set the color of the box shadow
                                                                            blurRadius:
                                                                                8, // Set the blur radius
                                                                            // Set the spread radius
                                                                            offset:
                                                                                Offset(0, 2), // Set the offset
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    )),
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    border: Border.all(
                                                                        width:
                                                                            2,
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            0,
                                                                            224,
                                                                            255)),
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            26,
                                                                            40,
                                                                            50), // Replace with your desired background color
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0), // Adjust the radius value as needed
                                                                  ),
                                                                  width: (SizeConfig
                                                                          .screenWidth *
                                                                      0.75),
                                                                  margin: EdgeInsets.only(
                                                                      top: SizeConfig
                                                                              .screenWidth *
                                                                          0.009),
                                                                  padding: EdgeInsets.fromLTRB(
                                                                      (SizeConfig
                                                                              .screenWidth *
                                                                          0.009),
                                                                      (SizeConfig
                                                                              .screenHeight *
                                                                          0.000),
                                                                      (SizeConfig
                                                                              .screenWidth *
                                                                          0.009),
                                                                      (SizeConfig
                                                                              .screenHeight *
                                                                          0.0000)),
                                                                  child: Column(
                                                                    children: [
                                                                      Container(
                                                                        padding: EdgeInsets.fromLTRB(
                                                                            (SizeConfig.screenWidth! *
                                                                                0.02),
                                                                            (SizeConfig.screenHeight! *
                                                                                0.0000),
                                                                            (SizeConfig.screenWidth! *
                                                                                0.04),
                                                                            (SizeConfig.screenHeight! *
                                                                                0.007)),
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Column(
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                IconButton(
                                                                                  icon: Icon(
                                                                                    BootstrapIcons.eye_fill,
                                                                                    color: Color.fromARGB(255, 255, 255, 255),
                                                                                    size: 40,
                                                                                  ), // Replace with your desired icon
                                                                                  onPressed: () {
                                                                                    // Add your button press logic here
                                                                                    // This function will be called when the icon button is pressed
                                                                                  },
                                                                                ),
                                                                                SizedBox(
                                                                                  height: 4,
                                                                                ),
                                                                                Container(
                                                                                  margin: EdgeInsets.only(left: 10),
                                                                                  child: Text(
                                                                                    "Watch",
                                                                                    style: TextStyle(
                                                                                      color: Color.fromARGB(255, 217, 217, 217), // Set the text color
                                                                                      fontFamily: 'Poppins', // Set the font family
                                                                                      fontWeight: FontWeight.w400, // Set the font weight
                                                                                      fontSize: 12, // Set the font size
                                                                                    ),
                                                                                  ),
                                                                                )
                                                                              ],
                                                                            ),
                                                                            Column(
                                                                              children: [
                                                                                IconButton(
                                                                                  icon: Icon(
                                                                                    BootstrapIcons.star_half,
                                                                                    color: Color.fromARGB(255, 255, 255, 255),
                                                                                    size: 40,
                                                                                  ), // Replace with your desired icon
                                                                                  onPressed: () {
                                                                                    // Add your button press logic here
                                                                                    // This function will be called when the icon button is pressed
                                                                                  },
                                                                                ),
                                                                                SizedBox(
                                                                                  height: 4,
                                                                                ),
                                                                                Container(
                                                                                  margin: EdgeInsets.only(left: 10),
                                                                                  child: Text(
                                                                                    "Ratings",
                                                                                    style: TextStyle(
                                                                                      color: Color.fromARGB(255, 217, 217, 217), // Set the text color
                                                                                      fontFamily: 'Poppins', // Set the font family
                                                                                      fontWeight: FontWeight.w400, // Set the font weight
                                                                                      fontSize: 12, // Set the font size
                                                                                    ),
                                                                                  ),
                                                                                )
                                                                              ],
                                                                            ),
                                                                            Column(
                                                                              children: [
                                                                                IconButton(
                                                                                  icon: Icon(
                                                                                    BootstrapIcons.clock_fill,
                                                                                    color: Color.fromARGB(255, 255, 255, 255),
                                                                                    size: 40,
                                                                                  ), // Replace with your desired icon
                                                                                  onPressed: () {
                                                                                    // Add your button press logic here
                                                                                    // This function will be called when the icon button is pressed
                                                                                  },
                                                                                ),
                                                                                SizedBox(
                                                                                  height: 4,
                                                                                ),
                                                                                Container(
                                                                                  margin: EdgeInsets.only(left: 10),
                                                                                  child: Text(
                                                                                    "Watchlist",
                                                                                    style: TextStyle(
                                                                                      color: Color.fromARGB(255, 217, 217, 217), // Set the text color
                                                                                      fontFamily: 'Poppins', // Set the font family
                                                                                      fontWeight: FontWeight.w400, // Set the font weight
                                                                                      fontSize: 12, // Set the font size
                                                                                    ),
                                                                                  ),
                                                                                )
                                                                              ],
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            6,
                                                                            94,
                                                                            153), // Replace with your desired background color
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0), // Adjust the radius value as needed
                                                                  ),
                                                                  width: (SizeConfig
                                                                          .screenWidth *
                                                                      0.75),
                                                                  height: (SizeConfig
                                                                          .screenHeight *
                                                                      0.205),
                                                                  margin: EdgeInsets.only(
                                                                      top: SizeConfig
                                                                              .screenWidth *
                                                                          0.007),
                                                                  padding: EdgeInsets.fromLTRB(
                                                                      (SizeConfig
                                                                              .screenWidth *
                                                                          0.009),
                                                                      (SizeConfig
                                                                              .screenHeight *
                                                                          0.005),
                                                                      (SizeConfig
                                                                              .screenWidth *
                                                                          0.009),
                                                                      (SizeConfig
                                                                              .screenHeight *
                                                                          0.005)),
                                                                  child: Column(
                                                                    children: [
                                                                      Container(
                                                                        padding: EdgeInsets.fromLTRB(
                                                                            (SizeConfig.screenWidth! *
                                                                                0.001),
                                                                            (SizeConfig.screenHeight! *
                                                                                0.002),
                                                                            (SizeConfig.screenWidth! *
                                                                                0.0),
                                                                            (SizeConfig.screenHeight! *
                                                                                0.002)),
                                                                        margin: EdgeInsets.only(
                                                                            top:
                                                                                (SizeConfig.screenHeight! * 0.00)),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              26,
                                                                              40,
                                                                              50), // Replace with your desired background color
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.0), // Adjust the radius value as needed
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsets.fromLTRB(
                                                                              8,
                                                                              2,
                                                                              4,
                                                                              2),
                                                                          child:
                                                                              Row(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Text(
                                                                                "Where to watch ",
                                                                                style: TextStyle(
                                                                                  color: Color.fromARGB(255, 217, 217, 217), // Set the text color
                                                                                  fontFamily: 'Roboto', // Set the font family
                                                                                  fontWeight: FontWeight.w700, // Set the font weight
                                                                                  fontSize: (SizeConfig.screenWidth! * 10) / 384, // Set the font size
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                decoration: BoxDecoration(
                                                                                  color: Color.fromARGB(255, 6, 94, 153), // Replace with your desired background color
                                                                                  borderRadius: BorderRadius.circular(10.0), // Adjust the radius value as needed
                                                                                ),
                                                                                padding: EdgeInsets.fromLTRB((SizeConfig.screenWidth! * 0.02), (SizeConfig.screenHeight! * 0.000), (SizeConfig.screenWidth! * 0.001), (SizeConfig.screenHeight! * 0.000)),
                                                                                child: Row(
                                                                                  children: [
                                                                                    Container(
                                                                                      margin: EdgeInsets.only(top: 3),
                                                                                      child: Text(
                                                                                        "Trailer",
                                                                                        style: TextStyle(
                                                                                          color: Color.fromARGB(255, 217, 217, 217), // Set the text color
                                                                                          fontFamily: 'Roboto', // Set the font family
                                                                                          fontWeight: FontWeight.w700, // Set the font weight
                                                                                          fontSize: (SizeConfig.screenWidth! * 10) / 384, // Set the font size
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Icon(
                                                                                      BootstrapIcons.play_fill,
                                                                                      color: Color.fromARGB(255, 217, 217, 217),
                                                                                      size: 20,
                                                                                    )
                                                                                  ],
                                                                                ),
                                                                              )
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            )),
                                                      ));
                                                },
                                              );
                                              */
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      15, 5, 15, 5),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    "GENERATE",
                                                    style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255,
                                                          255,
                                                          255,
                                                          255), // Set the text color
                                                      fontFamily:
                                                          'Roboto', // Set the font family
                                                      fontWeight: FontWeight
                                                          .bold, // Set the font weight
                                                      fontSize:
                                                          22, // Set the font size
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            right: 4),
                                                        child: Icon(
                                                          BootstrapIcons
                                                              .gift_fill,
                                                          color: Color.fromARGB(
                                                              255,
                                                              255,
                                                              255,
                                                              255),
                                                          size: 15,
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            top: 3),
                                                        child: Text(
                                                          "100 Points",
                                                          style: TextStyle(
                                                            color: Color.fromARGB(
                                                                255,
                                                                255,
                                                                255,
                                                                255), // Set the text color
                                                            fontFamily:
                                                                'Poppins', // Set the font family
                                                            fontWeight: FontWeight
                                                                .normal, // Set the font weight
                                                            fontSize:
                                                                10, // Set the font size
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            )),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 7),
                            height: 1,
                            color: Color.fromARGB(255, 71, 71, 71),
                            width: SizeConfig.screenWidth! - 20,
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 1),
                                      child: Text(
                                        'Watched ',
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 88, 99,
                                                    116), // Set the text color
                                            fontFamily:
                                                'Poppins', // Set the font family
                                            fontWeight: FontWeight
                                                .w400, // Set the font weight
                                            fontSize: 12 // Set the font size
                                            ),
                                      ),
                                    ),
                                    Text(
                                      '99 Films',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 0, 122,
                                            204), // Set the text color
                                        fontFamily:
                                            'Roboto', // Set the font family
                                        fontWeight: FontWeight
                                            .bold, // Set the font weight
                                        fontSize: 12, // Set the font size
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'See all',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,

                                    color: Color.fromARGB(
                                        255, 88, 99, 116), // Set the text color
                                    fontFamily: 'Roboto', // Set the font family
                                    fontWeight:
                                        FontWeight.w400, // Set the font weight
                                    fontSize: 12, // Set the font size
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SafeArea(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Column(
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 134,
                                            width: 90,
                                            margin:
                                                EdgeInsets.fromLTRB(2, 0, 5, 4),
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color.fromARGB(
                                                      255,
                                                      0,
                                                      0,
                                                      0), // Set the color of the box shadow
                                                  blurRadius:
                                                      8, // Set the blur radius
                                                  // Set the spread radius
                                                  offset: Offset(
                                                      0, 2), // Set the offset
                                                ),
                                              ],
                                              color:
                                                  Color.fromRGBO(30, 30, 30, 1),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 44.5, 10, 20),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .add_circle_outline_rounded,
                                                    color: Colors.blue,
                                                    size: 45,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          listcard(
                                            key: null,
                                          ),
                                          listcard(
                                            key: null,
                                          ),
                                          listcard(
                                            key: null,
                                          ),
                                          listcard(),
                                          listcard(),
                                          listcard(),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 7),
                            height: 1,
                            color: Color.fromARGB(255, 71, 71, 71),
                            width: SizeConfig.screenWidth! - 20,
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 1),
                                      child: Text(
                                        'Watchlist ',
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 88, 99,
                                                    116), // Set the text color
                                            fontFamily:
                                                'Poppins', // Set the font family
                                            fontWeight: FontWeight
                                                .w400, // Set the font weight
                                            fontSize: 12 // Set the font size
                                            ),
                                      ),
                                    ),
                                    Text(
                                      '99 Films',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 0, 122,
                                            204), // Set the text color
                                        fontFamily:
                                            'Roboto', // Set the font family
                                        fontWeight: FontWeight
                                            .bold, // Set the font weight
                                        fontSize: 12, // Set the font size
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'See all',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,

                                    color: Color.fromARGB(
                                        255, 88, 99, 116), // Set the text color
                                    fontFamily: 'Roboto', // Set the font family
                                    fontWeight:
                                        FontWeight.w400, // Set the font weight
                                    fontSize: 12, // Set the font size
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SafeArea(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Column(
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 134,
                                            width: 90,
                                            margin:
                                                EdgeInsets.fromLTRB(2, 0, 5, 4),
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color.fromARGB(
                                                      255,
                                                      0,
                                                      0,
                                                      0), // Set the color of the box shadow
                                                  blurRadius:
                                                      8, // Set the blur radius
                                                  // Set the spread radius
                                                  offset: Offset(
                                                      0, 2), // Set the offset
                                                ),
                                              ],
                                              color:
                                                  Color.fromRGBO(30, 30, 30, 1),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 44.5, 10, 20),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .add_circle_outline_rounded,
                                                    color: Colors.blue,
                                                    size: 45,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          listcard(),
                                          listcard(),
                                          listcard(),
                                          listcard(),
                                          listcard(),
                                          listcard(),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 7),
                            height: 1,
                            color: Color.fromARGB(255, 71, 71, 71),
                            width: SizeConfig.screenWidth! - 20,
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child: Text(
                                        'Popular This Friends ',
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 88, 99,
                                                    116), // Set the text color
                                            fontFamily:
                                                'Poppins', // Set the font family
                                            fontWeight: FontWeight
                                                .w400, // Set the font weight
                                            fontSize: 12 // Set the font size
                                            ),
                                      ),
                                    ),
                                    Text(
                                      '99 Films',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 0, 122,
                                            204), // Set the text color
                                        fontFamily:
                                            'Roboto', // Set the font family
                                        fontWeight: FontWeight
                                            .bold, // Set the font weight
                                        fontSize: 12, // Set the font size
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'See all',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,

                                    color: Color.fromARGB(
                                        255, 88, 99, 116), // Set the text color
                                    fontFamily: 'Roboto', // Set the font family
                                    fontWeight:
                                        FontWeight.w400, // Set the font weight
                                    fontSize: 12, // Set the font size
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SafeArea(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Column(
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          listcard(),
                                          listcard(),
                                          listcard(),
                                          listcard(),
                                          listcard(),
                                          listcard(),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 7),
                            height: 1,
                            color: Color.fromARGB(255, 71, 71, 71),
                            width: SizeConfig.screenWidth! - 20,
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child: Text(
                                        'Popular With Week ',
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 88, 99,
                                                    116), // Set the text color
                                            fontFamily:
                                                'Poppins', // Set the font family
                                            fontWeight: FontWeight
                                                .w400, // Set the font weight
                                            fontSize: 12 // Set the font size
                                            ),
                                      ),
                                    ),
                                    Text(
                                      '99 Films',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 0, 122,
                                            204), // Set the text color
                                        fontFamily:
                                            'Roboto', // Set the font family
                                        fontWeight: FontWeight
                                            .bold, // Set the font weight
                                        fontSize: 12, // Set the font size
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'See all',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,

                                    color: Color.fromARGB(
                                        255, 88, 99, 116), // Set the text color
                                    fontFamily: 'Roboto', // Set the font family
                                    fontWeight:
                                        FontWeight.w400, // Set the font weight
                                    fontSize: 12, // Set the font size
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SafeArea(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Column(
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          listcard(),
                                          listcard(),
                                          listcard(),
                                          listcard(),
                                          listcard(),
                                          listcard(),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 7),
                            height: 1,
                            color: Color.fromARGB(255, 71, 71, 71),
                            width: SizeConfig.screenWidth! - 20,
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child: Text(
                                        'Currently In Theaters ',
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 88, 99,
                                                    116), // Set the text color
                                            fontFamily:
                                                'Poppins', // Set the font family
                                            fontWeight: FontWeight
                                                .w400, // Set the font weight
                                            fontSize: 12 // Set the font size
                                            ),
                                      ),
                                    ),
                                    Text(
                                      '99 Films',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 0, 122,
                                            204), // Set the text color
                                        fontFamily:
                                            'Roboto', // Set the font family
                                        fontWeight: FontWeight
                                            .bold, // Set the font weight
                                        fontSize: 12, // Set the font size
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'See all',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,

                                    color: Color.fromARGB(
                                        255, 88, 99, 116), // Set the text color
                                    fontFamily: 'Roboto', // Set the font family
                                    fontWeight:
                                        FontWeight.w400, // Set the font weight
                                    fontSize: 12, // Set the font size
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SafeArea(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Column(
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          listcard(),
                                          listcard(),
                                          listcard(),
                                          listcard(),
                                          listcard(),
                                          listcard(),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 7),
                            height: 1,
                            color: Color.fromARGB(255, 71, 71, 71),
                            width: SizeConfig.screenWidth! - 20,
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child: Text(
                                        'Upcoming Films ',
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 88, 99,
                                                    116), // Set the text color
                                            fontFamily:
                                                'Poppins', // Set the font family
                                            fontWeight: FontWeight
                                                .w400, // Set the font weight
                                            fontSize: 12 // Set the font size
                                            ),
                                      ),
                                    ),
                                    Text(
                                      '99 Films',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 0, 122,
                                            204), // Set the text color
                                        fontFamily:
                                            'Roboto', // Set the font family
                                        fontWeight: FontWeight
                                            .bold, // Set the font weight
                                        fontSize: 12, // Set the font size
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'See all',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,

                                    color: Color.fromARGB(
                                        255, 88, 99, 116), // Set the text color
                                    fontFamily: 'Roboto', // Set the font family
                                    fontWeight:
                                        FontWeight.w400, // Set the font weight
                                    fontSize: 12, // Set the font size
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SafeArea(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Column(
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          listcard(),
                                          listcard(),
                                          listcard(),
                                          listcard(),
                                          listcard(),
                                          listcard(),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 7),
                            height: 1,
                            color: Color.fromARGB(255, 71, 71, 71),
                            width: SizeConfig.screenWidth! - 20,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      child: Text(
                                        'Articles :',
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 88, 99,
                                                    116), // Set the text color
                                            fontFamily:
                                                'Roboto', // Set the font family
                                            fontWeight: FontWeight
                                                .w400, // Set the font weight
                                            fontSize: 12 // Set the font size
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(5, 2, 0, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Netflix: Pulp Fiction will leave the platform',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255,
                                          255), // Set the text color
                                      fontFamily:
                                          'Poppins', // Set the font family
                                      fontWeight: FontWeight
                                          .w400, // Set the font weight
                                      fontSize: (SizeConfig.screenWidth! * 12) /
                                          384 // Set the font size
                                      ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/article.png'), // Replace with your background image path
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  height: 200,
                                  width: SizeConfig.screenWidth! - 10,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
