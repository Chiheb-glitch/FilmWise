import 'package:flutter/material.dart';

import '../config/size_config.dart';

class Findcard extends StatefulWidget {
  final String filmname;
  final String year;
  final String directed;
  final String imageurl;

  Findcard(
      {required this.filmname,
      required this.year,
      required this.directed,
      required this.imageurl});

  @override
  _Findcard createState() => _Findcard();
}

class _Findcard extends State<Findcard> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
          decoration: BoxDecoration(
            color: Color.fromARGB(0, 6, 94, 153),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.fromLTRB(20, 5, 0, 5),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Image.network(
                  '${widget.imageurl}',
                  height: 80,
                  width: 70,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${widget.filmname}',
                          style: TextStyle(
                            color: Color.fromARGB(
                                255, 255, 255, 255), // Set the text color
                            fontFamily: 'Poppins', // Set the font family
                            fontWeight: FontWeight.w100, // Set the font weight
                            fontSize: 22, // Set the font size
                            height: 1.2,
                          ),
                        ),
                        Text(
                          '   ${widget.year}',
                          style: TextStyle(
                            color: Color.fromARGB(
                                255, 217, 217, 217), // Set the text color
                            fontFamily: 'Poppins', // Set the font family
                            fontWeight: FontWeight.w100, // Set the font weight
                            fontSize: 10,
                            height: 1.2, // Set the font size
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Directed by ${widget.directed}',
                      style: TextStyle(
                        color: Color.fromARGB(
                            255, 217, 217, 217), // Set the text color
                        fontFamily: 'Poppins', // Set the font family
                        fontWeight: FontWeight.w100, // Set the font weight
                        fontSize: 12,
                        height: 1.2, // Set the font size
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 0),
          height: 1,
          color: Color.fromARGB(255, 71, 71, 71),
          width: SizeConfig.screenWidth!! - 20,
        ),
      ],
    );
  }
}
