import 'dart:ui';

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
              bottomBarColor: const Color.fromARGB(255, 26, 40, 50),
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
                                color: Color.fromARGB(90, 37, 36, 37),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(bottom: 7),
                                      child: IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            PageRouteBuilder(
                                              pageBuilder: (context, animation,
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
                                        icon: Icon(Icons.arrow_back_ios,
                                            size: 35,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary),
                                      ),
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
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .background,
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                        border: Border.all(
                                          color: const Color.fromARGB(
                                              255,
                                              74,
                                              83,
                                              95), // Set the border color here
                                          width:
                                              1.0, // Set the border width here
                                        ),
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
                                      margin: EdgeInsets.only(top: 50),
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
                                                    porfile_icon(
                                                        icons: BootstrapIcons
                                                            .envelope_fill,
                                                        text: "chat"),
                                                    porfile_icon(
                                                        icons: BootstrapIcons
                                                            .person_fill_add,
                                                        text: "Follow"),
                                                    porfile_icon(
                                                        icons: BootstrapIcons
                                                            .send_plus,
                                                        text: "Send"),
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
                                          profile_ff(
                                            text: "Followrs",
                                            price: "40",
                                          ),
                                          Container(
                                            width: 95.0,
                                            height: 95.0,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                width: 1.0,
                                                color: Color.fromARGB(
                                                    255, 74, 83, 95),
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.1),
                                                  spreadRadius: 2,
                                                  blurRadius: 5,
                                                  offset: Offset(0, 2),
                                                ),
                                              ],
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0aEjACt2jj8i3I0n3u2rHnWrk9igVej4LTA&usqp=CAU',
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          profile_ff(
                                            text: "Following",
                                            price: "40",
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
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 26, 40, 50),

                          borderRadius: BorderRadius.circular(
                              20.0), // Set the radius here
                          border: Border.all(
                            color: Theme.of(context)
                                .colorScheme
                                .primary, // Set the border color here
                            width: 1.0, // Set the border width here
                          ),
                        ),
                        margin: EdgeInsets.fromLTRB(
                            (MediaQuery.of(context).size.width * 170.0) / 700,
                            (MediaQuery.of(context).size.width * 10.0) / 700,
                            (MediaQuery.of(context).size.width * 170.0) / 700,
                            (MediaQuery.of(context).size.width * 20.0) / 700),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.wine_bar,
                              color: Color.fromARGB(255, 238, 255, 4),
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
                                fontSize: 20, // Set the font size
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: SizedBox(
                          height: 70,
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(0, 8, 78,
                                      128), // Required for the blur effect
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: Column(children: [
                                  Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255,
                                              8,
                                              79,
                                              128), // Required for the blur effect
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        margin: EdgeInsets.all(8),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 60,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
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
                                                    fontSize:
                                                        18, // Set the font size
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
                                                    fontSize:
                                                        15, // Set the font size
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        left: 9,
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                'assets/joker_without.png',
                                              ),
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ]),
                              ),
                              Container(
                                child: ClipRRect(
                                  // Clip it cleanly.
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 1.5, sigmaY: 1),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        // Required for the blur effect
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        color: Colors.grey.withOpacity(0.1),
                                      ),
                                      padding: EdgeInsets.all(16.0),
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 14,
                                child: Container(
                                  height: 65,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              Color.fromARGB(255, 26, 40, 50),
                                          shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                // Add this to set border color and width
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary, // Replace with your desired border color
                                                width:
                                                    1.0, // Replace with your desired border width
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(5.0),
                                          child: Text(
                                            'Claim',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        onPressed: () {},
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class porfile_icon extends StatelessWidget {
  final Color color;
  final IconData icons;
  final String text;

  const porfile_icon({
    Key? key,
    this.color = Colors.white,
    required this.icons,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 26, 40, 50),
        shape: RoundedRectangleBorder(
            side: BorderSide(
              // Add this to set border color and width
              color: Theme.of(context)
                  .colorScheme
                  .primary, // Replace with your desired border color
              width: 1.0, // Replace with your desired border width
            ),
            borderRadius: BorderRadius.circular(20)),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            (MediaQuery.of(context).size.width * 1.0) / 700,
            (MediaQuery.of(context).size.width * 10.0) / 700,
            (MediaQuery.of(context).size.width * 1.0) / 700,
            (MediaQuery.of(context).size.width * 10.0) / 700),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              icons,
              color: Theme.of(context).colorScheme.primary,
              size: 20,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              text,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: (MediaQuery.of(context).size.width * 12) / 500,
                  fontWeight: FontWeight.w200),
            ),
          ],
        ),
      ),
      onPressed: () {},
    );
  }
}

class profile_ff extends StatelessWidget {
  final Color color;

  final String text;
  final String price;

  const profile_ff({
    Key? key,
    this.color = Colors.white,
    required this.text,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 26, 40, 50),
        shape: RoundedRectangleBorder(
            side: BorderSide(
              // Add this to set border color and width
              color: const Color.fromARGB(
                  255, 74, 83, 95), // Replace with your desired border color
              width: 1.0, // Replace with your desired border width
            ),
            borderRadius: BorderRadius.circular(15)),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            (MediaQuery.of(context).size.width * 0) / 700,
            (MediaQuery.of(context).size.width * 5.0) / 700,
            (MediaQuery.of(context).size.width * 0) / 700,
            (MediaQuery.of(context).size.width * 5.0) / 700),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Followers',
              style: TextStyle(
                color: Color.fromARGB(199, 217, 217, 217), // Set the text color
                fontFamily: 'Poppins', // Set the font family
                fontWeight: FontWeight.normal, // Set the font weight
                fontSize: 12, // Set the font size
              ),
            ),
            Text(
              '50',
              style: TextStyle(
                color:
                    Theme.of(context).colorScheme.primary, // Set the text color
                fontFamily: 'Poppins', // Set the font family
                fontWeight: FontWeight.w500, // Set the font weight
                fontSize: 10, // Set the font size
              ),
            ),
          ],
        ),
      ),
    );
  }
}
