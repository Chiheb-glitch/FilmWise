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
import 'package:responsive_dashboard/style/colors.dart';
import 'package:responsive_dashboard/style/style.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:ui' as ui;
import 'package:http/http.dart' as http;
import 'dart:convert';
/*
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';*/

import 'component/findcard.dart';

class Filmrec {
  final String name;
  final String year;
  final String imageUrl;
  final String director;

  Filmrec({
    required this.name,
    required this.year,
    required this.imageUrl,
    required this.director,
  });
}

class recofilm extends StatefulWidget {
  final String arg; // Assuming the argument is of type String
  final String arg1;
  final String arg2;
  recofilm({required this.arg, required this.arg1, required this.arg2});
  @override
  _recofilm createState() => _recofilm();
}

class _recofilm extends State<recofilm> with TickerProviderStateMixin {
  TextEditingController _textEditingController = TextEditingController();
  bool load = false;
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  AnimationController? _controller;
  Animation<double>? _animation;
  Filmrec? film;
  List<dynamic>? res;
  String resload = "0";
  String where_to_watch_list =
      ' [ {"netflix":{"v":"0" , "url": "0" }}   , {"Amazon":{"v":"0" , "url": "0" } } , {"Disney+":{"v":"0" , "url": "0" }}  ,{"Paramount+":{"v":"0" , "url": "0" } } , {"Apple TV":{"v":"0" , "url": "0" } }, {"OCS":{"v":"0" , "url": "0" }}, {"mycanal":{"v":"0" , "url": "0" } },{"HBO GO":{"v":"0" , "url": "0" }}]';

  final List<String> whereicon = [
    "netflix.png",
    "prime.png",
    "Disney+.png",
    "paramount+.png",
    "appletv 1.png",
    "ocs.png",
    "mycanal.png",
    "hbo.png",
    "Netflix",
    'Amazon',
    'Desney+',
    'Paramount+',
    'Apple tv',
    "OCS",
    "MyCanal",
    "HBO",
  ];
  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.teal,
    Colors.pink,
  ];

  List<Widget> _buildRows(y) {
    List<Widget> rows = [];

    for (int i = 0; i < 8; i += 4) {
      List<Widget> rowChildren = [];

      for (int j = i; j < i + 4 && j < 8; j++) {
        if (j == 4 && res?[4]["Apple TV"]["v"] == "1")
          rowChildren.add(
            Expanded(
                child: GestureDetector(
              onTap: () async {
                /*
                if (!await launchUrl(
                  Uri.parse("${res[4]["Apple TV"]["url"]}"),
                  mode: LaunchMode.externalApplication,
                )) {
                  throw Exception('Could not launch');
                }*/
              },
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/${whereicon[j]}'),
                        fit: BoxFit
                            .cover, // Adjust the image to cover the container
                      ),
                    ),
                  ),
                  Text(
                    '${whereicon[j + 8]}',
                    style: TextStyle(
                        color: Color.fromARGB(
                            255, 217, 217, 217), // Set the text color
                        fontFamily: 'Poppins', // Set the font family
                        fontWeight: FontWeight.w100, // Set the font weight
                        fontSize: (SizeConfig.screenWidth! * 10) /
                            384 // Set the font size
                        ),
                  ),
                ],
              ),
            )),
          );

        if (j == 1 && res?[1]["Amazon"]["v"] == "1")
          rowChildren.add(
            Expanded(
                child: GestureDetector(
              onTap: () async {
                /*  if (!await launchUrl(
                  Uri.parse("${res[1]["Amazon"]["url"]}"),
                  mode: LaunchMode.externalApplication,
                )) {
                  throw Exception('Could not launch');
                }*/
              },
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/${whereicon[j]}'),
                        fit: BoxFit
                            .cover, // Adjust the image to cover the container
                      ),
                    ),
                  ),
                  Text(
                    '${whereicon[j + 8]}',
                    style: TextStyle(
                        color: Color.fromARGB(
                            255, 217, 217, 217), // Set the text color
                        fontFamily: 'Poppins', // Set the font family
                        fontWeight: FontWeight.w100, // Set the font weight
                        fontSize: (SizeConfig.screenWidth! * 10) /
                            384 // Set the font size
                        ),
                  ),
                ],
              ),
            )),
          );
      }

      rows.add(
        Row(
          children: rowChildren,
        ),
      );
    }

    return rows;
  }

  generate(f1, f2, f3) async {
    final apiUrl = 'http://127.0.0.1:8000/films/GenerateFilm';
    final jsonBody = jsonEncode({
      "filmname1": "${f1}",
      "filmname2": "${f2}",
      "filmname3": "${f3}",
    });

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Token 33f856b083f6c1c85f466dd0c382e770b9e1b5ba'
        },
        body: jsonBody,
      );

      var r = jsonDecode(response.body);
      Filmrec y = Filmrec(
          name: r[0]['title'],
          imageUrl: r[0]['image'],
          year: r[0]["year"].toString(),
          director: 'TEST');
      setState(() {
        film = y;
        load = true;
      });

      whereto(y.name);
    } catch (e) {
      print("errer ${e}");
    }
  }

  whereto(filmname) async {
    final Map<String, String> headers = {
      'X-RapidAPI-Key': 'f01d02945amshd1ec8ffcd8526f5p175e20jsne056387171b5',
      'X-RapidAPI-Host': 'streaming-availability.p.rapidapi.com'
    };
    final Map<String, String> params = {
      'title': 'The sun light',
      'country': 'us',
      'show_type': 'movie',
      'output_language': 'en'
    };
    final uri = Uri.https(
        'streaming-availability.p.rapidapi.com', '/v2/search/title', params);

    try {
      final response = await http.get(uri, headers: headers);

      var r = jsonDecode(response.body)["result"][0]["streamingInfo"]["us"];
      print(jsonDecode(response.body)["result"][0]);
      List<dynamic> jsonMap = json.decode(where_to_watch_list);
      try {
        if (r.containsKey('prime')) {
          jsonMap[1]['Amazon']["v"] = "1";
          jsonMap[1]['Amazon']["url"] = r["prime"][0]['link'];

          setState(() {
            res = jsonMap;
            resload = "1";
          });
        } else {
          setState(() {
            resload = "1";
          });
        }
      } catch (e) {
        print(e);
        setState(() {
          resload = "1";
        });
      }
/* apple */
      try {
        if (r.containsKey('apple')) {
          jsonMap[4]['Apple TV']["v"] = "1";
          jsonMap[4]['Apple TV']["url"] = r["apple"][0]['link'];

          setState(() {
            res = jsonMap;
            resload = "1";
          });
        } else {
          setState(() {
            resload = "1";
          });
        }
      } catch (e) {
        print(e);
        setState(() {
          resload = "1";
        });
      }
    } catch (e) {
      print("ttttttttttttttttt${e}");
      setState(() {
        resload = "1";
      });
    }
  }

  @override
  void initState() {
    generate(widget.arg, widget.arg1, widget.arg2);
    // whereto();
    List<dynamic> jsonMap = json.decode(where_to_watch_list);
    print(jsonMap);
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller!,
      curve: Curves.easeInOut,
    );
    _controller!.forward();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: _drawerKey,
      drawer: SideMenu(),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          height: 900,
          width: SizeConfig.screenWidth!,
          color: Color.fromARGB(255, 20, 20, 20),
          child: SingleChildScrollView(
              child: load
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    icon: Icon(Icons.arrow_back_ios,
                                        size: 35,
                                        color: Color.fromARGB(255, 93, 90, 90)),
                                  ),
                                ),
                                SvgPicture.asset(
                                  "assets/logow.svg",
                                  width: 90,
                                  height: 45,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                    width: (SizeConfig.screenWidth! * 60) / 500,
                                    child: Icon(
                                      Icons.search,
                                      color: Color.fromARGB(0, 93, 90, 90),
                                      size: 10,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 7),
                            height: 1,
                            color: Color.fromARGB(255, 71, 71, 71),
                            width: SizeConfig.screenWidth! - 20,
                          ),
                          /*
                    Container(
                      height: 100,
                      child: YoutubePlayerIFrame(
                        aspectRatio: 16 / 9,
                        controller: YoutubePlayerController(
                            initialVideoId: 'LDG9bisJEaI',
                            params: YoutubePlayerParams(autoPlay: true)),
                      ),
                    ),
*/
                          /*       Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        if (!await launchUrl(
                          Uri.parse(
                              "https://www.youtube.com/watch?v=YMx8Bbev6T4"),
                          mode: LaunchMode.externalApplication,
                        )) {
                          throw Exception('Could not launch');
                        }
                      },
                      child: Text('Go to Google'),
                    ),
                  ),*/
                          Text(
                            "THIS RECOMMENDATION IS THE BEST MATCH!!",
                            style: TextStyle(
                              color: Color.fromARGB(
                                  255, 207, 208, 209), // Set the text color
                              fontFamily: 'Roboto', // Set the font family
                              fontWeight:
                                  FontWeight.w300, // Set the font weight
                              fontSize: (SizeConfig.screenWidth! * 13) /
                                  384, // Set the font size
                              // Set the font size
                            ),
                          ),
                          Stack(
                            children: [
                              Container(
                                width: SizeConfig.screenWidth! - 20,
                                padding: EdgeInsets.fromLTRB(
                                    (SizeConfig.screenWidth! * 0.001),
                                    (SizeConfig.screenHeight! * 0.005),
                                    (SizeConfig.screenWidth! * 0.001),
                                    (SizeConfig.screenHeight! * 0.005)),
                                margin: EdgeInsets.only(
                                    top: (SizeConfig.screenHeight! * 0.005)),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 8, 77,
                                      125), // Replace with your desired background color
                                  borderRadius: BorderRadius.circular(
                                      30.0), // Adjust the radius value as needed
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${film!.name}",
                                          style: TextStyle(
                                            color: Color.fromARGB(255, 207, 208,
                                                209), // Set the text color
                                            fontFamily:
                                                'Roboto', // Set the font family
                                            fontWeight: FontWeight
                                                .bold, // Set the font weight
                                            fontSize:
                                                (SizeConfig.screenWidth! * 20) /
                                                    384, // Set the font size
                                            // Set the font size
                                          ),
                                        ),
                                        Text(
                                          "2012",
                                          style: TextStyle(
                                            color: Color.fromARGB(255, 207, 208,
                                                209), // Set the text color
                                            fontFamily:
                                                'Roboto', // Set the font family
                                            fontWeight: FontWeight
                                                .w100, // Set the font weight
                                            fontSize:
                                                (SizeConfig.screenWidth! * 12) /
                                                    384, // Set the font size

                                            // Set the font size
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "Directed by Quentin Tarantino",
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 207, 208,
                                            209), // Set the text color
                                        fontFamily:
                                            'Roboto', // Set the font family
                                        fontWeight: FontWeight
                                            .w100, // Set the font weight
                                        fontSize:
                                            (SizeConfig.screenWidth! * 12) /
                                                384, // Set the font size

                                        // Set the font size
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 4,
                                left: 0,
                                right: 0,
                                child: Container(
                                  height: 6,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        blurRadius: 4,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 500,
                            width: 470,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(
                                        0.2), // Set the color of the shadow
                                    spreadRadius:
                                        2, // Set the spread radius of the shadow
                                    blurRadius:
                                        4, // Set the blur radius of the shadow
                                    offset: Offset(0, -4)),
                              ],
                              image: DecorationImage(
                                image: NetworkImage("${film!.imageUrl}"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Column(children: [
                              SizedBox(
                                height: 100,
                              ),
                              /* GestureDetector(
                        onTap: () {
                          setState(() {
                            showtrailler = true;
                          });
                        },
                        child: Container(
                            child: Image.asset(
                          "assets/play_circle.png",
                          color: Color.fromARGB(0, 255, 193, 7),
                          width: 100,
                        )),
                      ),*/
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  image: DecorationImage(
                                    image: AssetImage('assets/bg.png'),
                                    fit: BoxFit
                                        .cover, // Adjust the image to cover the container
                                  ),
                                ),
                                height: 400,
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 100,
                                      ),
                                      Text(
                                        'Where to whatch',
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 255, 255,
                                                255), // Set the text color
                                            fontFamily:
                                                'Poppins', // Set the font family
                                            fontWeight: FontWeight
                                                .w100, // Set the font weight
                                            fontSize:
                                                (SizeConfig.screenWidth! * 18) /
                                                    384 // Set the font size
                                            ),
                                      ),
                                      resload == "1"
                                          ? Column(
                                              children: _buildRows(
                                                  where_to_watch_list),
                                            )
                                          : Center(
                                              child:
                                                  CircularProgressIndicator())
                                    ],
                                  ),
                                ),
                              )
                            ]),
                          ),
                        ],
                      ),
                    )
                  : Container(
                      width: SizeConfig.screenWidth!,
                      height: SizeConfig.screenHeight!,
                      color: Color.fromARGB(255, 20, 20, 20),
                      child: Column(children: [
                        Center(
                          child: CircularProgressIndicator(),
                        )
                      ]),
                    )),
        ),
      ),
    );
  }
}

void _launchURL(String url) async {
  /*
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
  */
}
