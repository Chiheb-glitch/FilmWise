import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_dashboard/dashboard.dart';
import 'package:responsive_dashboard/theme/theme_provider.dart';

import 'config/size_config.dart';

class messages_list extends StatelessWidget {
  TextEditingController _textEditingController = TextEditingController();
  final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();
  final PageController _pageController = PageController();
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Row(
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
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  Dashboard(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            var begin = Offset(-1.0,
                                0); // Change the begin offset to start from the left
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
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      color: Color.fromARGB(255, 129, 12, 168),
                    )),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Form(
              key: _formKey1,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    validator: (value) {
                      // add email validation

                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Find',
                      hintText: 'Find',
                      prefixIcon: Icon(
                        Icons.search,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.primary),

                      // Customize the border color
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 15),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 1.0,
                ),
              ),
            ),
            width: (SizeConfig.screenWidth! * 0.9),
            child: Column(children: [
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 0.0,
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
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Salim',
                        style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .primary, // S.et the text color
                          fontFamily: 'Poppins', // Set the font family
                          fontWeight: FontWeight.w800, // Set the font weight
                          fontSize: 14, // Set the font size
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Winek ech fama',
                            style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary, // Set the text color
                              fontFamily: 'Poppins', // Set the font family
                              fontWeight:
                                  FontWeight.w200, // Set the font weight
                              fontSize: MediaQuery.of(context).size.width >= 493
                                  ? 12
                                  : 8, // Set the font size
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.35,
                          ),
                          Text(
                            '20/12/2023',
                            style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary, // Set the text color
                              fontFamily: 'Poppins', // Set the font family
                              fontWeight:
                                  FontWeight.w100, // Set the font weight
                              fontSize: MediaQuery.of(context).size.width >= 493
                                  ? 11
                                  : 6, // Set the font size
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              )
            ]),
          )
        ],
      ),
    );
  }
}
