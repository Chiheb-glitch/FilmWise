import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:floating_frosted_bottom_bar/app/frosted_bottom_bar.dart';
import 'package:responsive_dashboard/dashboard.dart';

import 'chatpage.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int currentPage = 0;
  ScrollController _scrollController = ScrollController();

  bool show_navbar = false;
  void _scrollListener() {
    if (_scrollController.offset > 50) if (show_navbar == false)
      setState(() {
        show_navbar = !show_navbar;
      });

    if (_scrollController.offset < 50) if (show_navbar == true)
      setState(() {
        show_navbar = !show_navbar;
      });
    // Handle scroll events here
    print('Scrolling: ${_scrollController.offset}');
  }

  @override
  void initState() {
    super.initState();
    currentPage = 0;
    _scrollController.addListener(_scrollListener);

    tabController = TabController(length: 5, vsync: this);
    tabController.animation!.addListener(
      () {
        final value = tabController.animation!.value.round();
        if (value != currentPage && mounted) {
          changePage(value);
        }
      },
    );
  }

  void changePage(int newPage) {
    setState(() {
      currentPage = newPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: FrostedBottomBar(
              width: MediaQuery.of(context).size.width * 0.95,
              borderRadius: BorderRadius.all(Radius.circular(50)),
              bottomBarColor: const Color.fromARGB(255, 0, 122, 204),
              child: TabBar(
                labelColor: Colors.amber,
                indicatorPadding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
                controller: tabController,
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(
                      color: Color.fromARGB(0, 33, 149, 243), width: 4),
                  insets: EdgeInsets.fromLTRB(16, 0, 16, 8),
                ),
                tabs: [
                  TabsIcon(
                      icons: BootstrapIcons.chat_right,
                      text: "Dites Bonjour",
                      color: Colors.white),
                  TabsIcon(
                      icons: BootstrapIcons.plus_circle,
                      text: "S'abonner",
                      color: Colors.white),
                  TabsIcon(
                      icons: BootstrapIcons.three_dots_vertical,
                      text: "Other",
                      color: Colors.white),
                ],
              ),
              opacity: show_navbar ? 1 : 0,
              sigmaX: 0,
              sigmaY: 0,
              body: (context, controller) => ListView(
                controller: _scrollController, // Add this line

                children: [
                  Column(
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
                            ),

                            Positioned(
                              top: 0,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                color: Color.fromARGB(148, 37, 36, 37),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:
                                            Color.fromARGB(83, 158, 158, 158),
                                      ),
                                      child: IconButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              PageRouteBuilder(
                                                pageBuilder: (context,
                                                        animation,
                                                        secondaryAnimation) =>
                                                    Dashboard(),
                                                transitionsBuilder: (context,
                                                    animation,
                                                    secondaryAnimation,
                                                    child) {
                                                  var begin = Offset(-1.0,
                                                      0); // Change the begin offset to start from the left
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
                                          },
                                          icon: Icon(
                                            Icons.clear,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          )),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            BootstrapIcons.three_dots_vertical,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Profile Statistics
                            Positioned(
                              top: 107.0,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.amber,
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
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .background,
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      height: 500,
                                      margin: EdgeInsets.only(top: 60),
                                      padding: EdgeInsets.all(40),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Salim Jbeli',
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary, // Set the text color
                                              fontFamily:
                                                  'Poppins', // Set the font family
                                              fontWeight: FontWeight
                                                  .normal, // Set the font weight
                                              fontSize: 17, // Set the font size
                                            ),
                                          ),
                                          Text(
                                            '#1547895',
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
                                              fontSize: 15, // Set the font size
                                            ),
                                          ),
                                          SizedBox(height: 16.0),
                                          !show_navbar
                                              ? Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            Color.fromARGB(255,
                                                                26, 40, 50),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                                side:
                                                                    BorderSide(
                                                                  // Add this to set border color and width
                                                                  color: Theme.of(
                                                                          context)
                                                                      .colorScheme
                                                                      .primary, // Replace with your desired border color
                                                                  width:
                                                                      1.0, // Replace with your desired border width
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20)),
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                            (MediaQuery.of(context)
                                                                        .size
                                                                        .width *
                                                                    10.0) /
                                                                700),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Icon(
                                                              BootstrapIcons
                                                                  .envelope_fill,
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .primary,
                                                            ),
                                                            SizedBox(
                                                              width: (MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      8) /
                                                                  500,
                                                            ),
                                                            Text(
                                                              'Chat',
                                                              style: TextStyle(
                                                                  color: Theme.of(
                                                                          context)
                                                                      .colorScheme
                                                                      .primary,
                                                                  fontSize: (MediaQuery.of(context)
                                                                              .size
                                                                              .width *
                                                                          16) /
                                                                      500,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w200),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      onPressed: () {},
                                                    ),
                                                    ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            Color.fromARGB(255,
                                                                26, 40, 50),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                                side:
                                                                    BorderSide(
                                                                  // Add this to set border color and width
                                                                  color: Theme.of(
                                                                          context)
                                                                      .colorScheme
                                                                      .primary, // Replace with your desired border color
                                                                  width:
                                                                      1.0, // Replace with your desired border width
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20)),
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                            (MediaQuery.of(context)
                                                                        .size
                                                                        .width *
                                                                    10.0) /
                                                                700),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Icon(
                                                              BootstrapIcons
                                                                  .person_fill_add,
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .primary,
                                                            ),
                                                            SizedBox(
                                                              width: 8,
                                                            ),
                                                            Text(
                                                              'Follow',
                                                              style: TextStyle(
                                                                  color: Theme.of(
                                                                          context)
                                                                      .colorScheme
                                                                      .primary,
                                                                  fontSize: (MediaQuery.of(context)
                                                                              .size
                                                                              .width *
                                                                          16) /
                                                                      500,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w200),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      onPressed: () {},
                                                    ),
                                                    ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            Color.fromARGB(255,
                                                                26, 40, 50),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                                side:
                                                                    BorderSide(
                                                                  // Add this to set border color and width
                                                                  color: Theme.of(
                                                                          context)
                                                                      .colorScheme
                                                                      .primary, // Replace with your desired border color
                                                                  width:
                                                                      1.0, // Replace with your desired border width
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20)),
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                            (MediaQuery.of(context)
                                                                        .size
                                                                        .width *
                                                                    10.0) /
                                                                700),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Icon(
                                                              BootstrapIcons
                                                                  .send_plus,
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .primary,
                                                            ),
                                                            SizedBox(
                                                              width: 8,
                                                            ),
                                                            Text(
                                                              'Send',
                                                              style: TextStyle(
                                                                  color: Theme.of(
                                                                          context)
                                                                      .colorScheme
                                                                      .primary,
                                                                  fontSize: (MediaQuery.of(context)
                                                                              .size
                                                                              .width *
                                                                          16) /
                                                                      500,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w200),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      onPressed: () {},
                                                    ),
                                                  ],
                                                )
                                              : SizedBox(),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            color: Color.fromARGB(
                                                250, 93, 150, 122),
                                            height: 1,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.9,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            width: 90,
                                            decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 26, 31, 41),
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                  spreadRadius: 2,
                                                  blurRadius: 5,
                                                  offset: Offset(0, 2),
                                                ),
                                              ],
                                            ),
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Followers',
                                                  style: TextStyle(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primary, // Set the text color
                                                    fontFamily:
                                                        'Poppins', // Set the font family
                                                    fontWeight: FontWeight
                                                        .normal, // Set the font weight
                                                    fontSize:
                                                        15, // Set the font size
                                                  ),
                                                ),
                                                Text(
                                                  '50',
                                                  style: TextStyle(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primary, // Set the text color
                                                    fontFamily:
                                                        'Poppins', // Set the font family
                                                    fontWeight: FontWeight
                                                        .normal, // Set the font weight
                                                    fontSize:
                                                        15, // Set the font size
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
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
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            width: 90,
                                            decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 26, 31, 41),
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                  spreadRadius: 2,
                                                  blurRadius: 5,
                                                  offset: Offset(0, 2),
                                                ),
                                              ],
                                            ),
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Following',
                                                  style: TextStyle(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primary, // Set the text color
                                                    fontFamily:
                                                        'Poppins', // Set the font family
                                                    fontWeight: FontWeight
                                                        .normal, // Set the font weight
                                                    fontSize:
                                                        15, // Set the font size
                                                  ),
                                                ),
                                                Text(
                                                  '50',
                                                  style: TextStyle(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primary, // Set the text color
                                                    fontFamily:
                                                        'Poppins', // Set the font family
                                                    fontWeight: FontWeight
                                                        .normal, // Set the font weight
                                                    fontSize:
                                                        15, // Set the font size
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
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
                        width: MediaQuery.of(context).size.width * 0.9,
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
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
                                  fontWeight:
                                      FontWeight.normal, // Set the font weight
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
                              Image.asset(
                                'assets/ROOKIE CINEPHILE.png',
                                height: 50,
                                width: 50,
                              ),
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
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary, // Set the text color
                                      fontFamily:
                                          'Poppins', // Set the font family
                                      fontWeight: FontWeight
                                          .w800, // Set the font weight
                                      fontSize: 18, // Set the font size
                                    ),
                                  ),
                                  Text(
                                    'Watched More Than 250 Films',
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary, // Set the text color
                                      fontFamily:
                                          'Poppins', // Set the font family
                                      fontWeight: FontWeight
                                          .w400, // Set the font weight
                                      fontSize: 15, // Set the font size
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
                        width: MediaQuery.of(context).size.width * 0.9,
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
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
                                  fontWeight:
                                      FontWeight.normal, // Set the font weight
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
                                  fontWeight:
                                      FontWeight.w400, // Set the font weight
                                  fontSize: 15, // Set the font size
                                ),
                              ),
                              Text(
                                '50',
                                style: TextStyle(
                                  color: Color.fromARGB(
                                      255, 193, 192, 192), // Set the text color
                                  fontFamily: 'Poppins', // Set the font family
                                  fontWeight:
                                      FontWeight.normal, // Set the font weight
                                  fontSize: 15, // Set the font size
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Watchlist',
                                style: TextStyle(
                                  color: Color.fromARGB(
                                      255, 193, 192, 192), // Set the text color
                                  fontFamily: 'Poppins', // Set the font family
                                  fontWeight:
                                      FontWeight.w400, // Set the font weight
                                  fontSize: 15, // Set the font size
                                ),
                              ),
                              Text(
                                '50',
                                style: TextStyle(
                                  color: Color.fromARGB(
                                      255, 193, 192, 192), // Set the text color
                                  fontFamily: 'Poppins', // Set the font family
                                  fontWeight:
                                      FontWeight.normal, // Set the font weight
                                  fontSize: 15, // Set the font size
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Rewards',
                                style: TextStyle(
                                  color: Color.fromARGB(
                                      255, 193, 192, 192), // Set the text color
                                  fontFamily: 'Poppins', // Set the font family
                                  fontWeight:
                                      FontWeight.w400, // Set the font weight
                                  fontSize: 15, // Set the font size
                                ),
                              ),
                              Text(
                                '50',
                                style: TextStyle(
                                  color: Color.fromARGB(
                                      255, 193, 192, 192), // Set the text color
                                  fontFamily: 'Poppins', // Set the font family
                                  fontWeight:
                                      FontWeight.normal, // Set the font weight
                                  fontSize: 15, // Set the font size
                                ),
                              ),
                            ],
                          )
                        ]),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TabsIcon extends StatelessWidget {
  final Color color;
  final double height;
  final double width;
  final IconData icons;
  final String text;

  const TabsIcon({
    Key? key,
    this.color = Colors.white,
    this.height = 60,
    this.width = 50,
    required this.icons,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatPage()),
        );
      },
      child: Container(
        padding: EdgeInsets.all(10),
        child: SizedBox(
          child: Center(
            child: Column(
              children: [
                Icon(
                  icons,
                  color: color,
                  size: 30,
                ),
                Text(
                  text,
                  style: TextStyle(
                    color: color, // Set the text color
                    fontFamily: 'Poppins', // Set the font family
                    fontWeight: FontWeight.normal, // Set the font weight
                    fontSize: 12, // Set the font size
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
