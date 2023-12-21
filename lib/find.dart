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
import 'package:responsive_dashboard/data/data.dart';
import 'package:responsive_dashboard/style/colors.dart';
import 'package:responsive_dashboard/style/style.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:ui' as ui;
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'component/findcard.dart';

class Film {
  final String id;
  final String name;
  final String year;
  final String imageUrl;
  final String director;

  Film({
    required this.id,
    required this.name,
    required this.year,
    required this.imageUrl,
    required this.director,
  });
}

class Find extends StatefulWidget {
  final String arg; // Assuming the argument is of type String

  Find({required this.arg});
  @override
  _Find createState() => _Find();
}

class _Find extends State<Find> with TickerProviderStateMixin {
  TextEditingController _textEditingController = TextEditingController();

  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  late AnimationController _controller;
  late Animation<double> _animation;
  List<bool> d = [false, false, false];
  List<bool> g = [false, false, false, false, false, false];
  bool find = false;
  bool show = false;
  String value = 'Initial Value';

  List<Film> Films = [];

  Future<Film> fetch_data(ch) async {
    final Map<String, String> headers = {
      'X-RapidAPI-Key': '2bd1074f16msh88e1b8a33528e93p12330djsnf36f181d64c0',
      'X-RapidAPI-Host': 'online-movie-database.p.rapidapi.com'
    };
    final Map<String, String> params = {
      'title': '${ch}',
      'limit': '3',
      'sortArg': 'moviemeter,asc'
    };
    final uri = Uri.https(
        'online-movie-database.p.rapidapi.com', '/title/v2/find', params);
    List<Film> _Films = [];

    try {
      final response = await http.get(uri, headers: headers);
      if (response.statusCode == 200) {
        setState(() {
          find = true;
        });
        if (jsonDecode(response.body).containsKey("results")) {
          for (var filmData in jsonDecode(response.body)["results"]) {
            if (filmData['titleType'] == "movie") {
              var id = filmData['id'].toString();
              var name = filmData['title'];

              var image = filmData['image']["url"];
              var year = filmData['year'].toString();
              String extractedValue = id.split('/').elementAt(2);

              final Map<String, String> _params = {
                'tconst': '${extractedValue}',
              };
              final _uri = Uri.https('online-movie-database.p.rapidapi.com',
                  '/title/get-full-credits', _params);
              try {
                final _response = await http.get(_uri, headers: headers);

                if (_response.statusCode == 200) {
                  var dir =
                      jsonDecode(_response.body)["crew"]["director"][0]["name"];
                  var director = dir;

                  Film film = Film(
                    id: id,
                    name: name,
                    year: year,
                    imageUrl: image,
                    director: director,
                  );
                  _Films.add(film);

                  print("dircc ${dir}");
                }
              } catch (error) {
                print('Error2: $error');
                setState(() {
                  find = false;
                });
                setState(() {
                  Films = _Films;
                });
              }

              print(extractedValue);
            }

            /*   Film film = Film(
            id: filmData['id'],
            name: filmData['name'],
            year: filmData['year'],
            imageUrl: filmData['image']["url"],
            director: filmData['director'],
          );
          Films.add(film);*/
          }
          setState(() {
            find = false;
          });
          setState(() {
            Films = _Films;
          });
        }

        final x = Film(
            id: "15",
            name: "te",
            director: "tt",
            imageUrl: "tet",
            year: "2015");
        return x;
      } else {
        setState(() {
          Films = _Films;
          find = false;
        });
        print('Request failed with status1: ${response.statusCode}');
        final x =
            Film(id: "0", name: "0", director: "0", imageUrl: "0", year: "0");
        return x;
      }
    } catch (error) {
      print('Error1: $error');
      setState(() {
        Films = _Films;
        find = false;
      });
      final x =
          Film(id: "0", name: "0", director: "0", imageUrl: "0", year: "0");
      return x;
    }
  }

  void auto_complete(ch) async {
    print(ch);
    if (ch.length > 5) final Film x = await fetch_data(ch);
  }

  void handleValueChanged(String newValue) {
    setState(() {
      value = newValue;
    });
  }

  addfilm(filmname, filmid, filmimageUrl, filmyear, filmdirector) async {
    print(widget.arg);

    final apiUrl = 'http://127.0.0.1:8000/films/add_film_generate';
    final jsonBody = jsonEncode({
      "index": "${widget.arg}",
      'filmname': filmname,
      'filmid': filmid,
      'filmimageUrl': filmimageUrl,
      'filmyear': filmyear,
      'filmdirector': filmdirector,
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
      print(response.statusCode);
    } catch (e) {
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
      drawer: SideMenu(
        key: null,
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          height: 900,
          color: Color.fromARGB(255, 20, 20, 20),
          child: SingleChildScrollView(
            child: Padding(
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
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    var begin = Offset(-1.0,
                                        0); // Change the begin offset to start from the left
                                    var end = Offset.zero;
                                    var tween = Tween(begin: begin, end: end);
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
                            width: (SizeConfig.screenWidth!! * 60) / 500,
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
                    width: SizeConfig.screenWidth!! - 20,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        for (var i in top_bar_search)
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 0, 10, 8),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: !i["is_active"]
                                      ? Color.fromARGB(0, 0, 122, 204)
                                      : Color.fromARGB(240, 2, 154,
                                          255), // Set the background color of the button
                                  onPrimary: Colors
                                      .white, // Set the text color of the button
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        28), // Set the border radius of the button
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    i["is_active"] = !i["is_active"];
                                  });
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 2, 0, 2),
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: 3),
                                        child: Text(
                                          "${i["btn_string"]}",
                                          style: TextStyle(
                                            color: Color.fromARGB(255, 255, 255,
                                                255), // Set the text color
                                            fontFamily:
                                                'Poppins', // Set the font family
                                            fontWeight: FontWeight
                                                .w300, // Set the font weight
                                            fontSize: 20, // Set the font size
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                      ],
                    ),
                  ),
                  SafeArea(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(bottom: 3.5),
                                margin: EdgeInsets.only(top: 10),
                                width: SizeConfig.screenWidth! - 20,
                                height: 37,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 26, 40, 50),
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(196, 3, 3, 3)
                                          .withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 2, 0, 0),
                                      child: Icon(
                                        Icons.search,
                                        color: Color.fromARGB(255, 1, 116, 229),
                                        size: 28,
                                      ),
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        controller: _textEditingController,
                                        onChanged: (String value) {},
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 217, 218, 219)),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Search',
                                          hintStyle: TextStyle(
                                            fontWeight: FontWeight.w100,
                                            fontSize: 18,
                                            color: Color.fromARGB(
                                                255, 85, 96, 110),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 10),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Color.fromARGB(255, 6, 94,
                                              153), // Set the background color of the button
                                          onPrimary: Colors
                                              .white, // Set the text color of the button
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                30), // Set the border radius of the button
                                          ),
                                        ),
                                        onPressed: () {
                                          auto_complete(
                                              _textEditingController.text);
                                        },
                                        child: const Text(
                                          'Submit',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 217, 218, 219)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (find == true)
                                Container(
                                  margin: EdgeInsets.only(top: 40),
                                  child: Center(
                                      child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  )),
                                ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: Films.length,
                                itemBuilder: (context, index) {
                                  if (Films.length > 0) {
                                    var film = Films[index];

                                    return GestureDetector(
                                      onTap: () {
                                        addfilm(
                                            film.name,
                                            film.id,
                                            film.imageUrl,
                                            film.year,
                                            film.director);

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
                                      child: Findcard(
                                          filmname: film.name,
                                          year: film.year,
                                          directed: film.director,
                                          imageurl: film.imageUrl),
                                    );
                                  } else {
                                    return Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    );
                                  }
                                },
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
          ),
        ),
      ),
    );
  }
}
