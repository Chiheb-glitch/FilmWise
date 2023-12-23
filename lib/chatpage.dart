import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'config/size_config.dart';
import 'dashboard.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 26, 40, 50),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(196, 3, 3, 3).withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 7),
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
                    icon: Icon(Icons.arrow_back_ios,
                        size: 35, color: Color.fromARGB(255, 93, 90, 90)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  width: 40.0,
                  height: 40.0,
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
                Text("Chiheb xx.1",
                    style: TextStyle(
                      color: Color.fromARGB(
                          255, 252, 252, 252), // Set the text color
                      fontFamily: 'Poppins', // Set the font family
                      fontWeight: FontWeight.w500, // Set the font weight
                      fontSize: 15, // Set the font size
                    )),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              reverse: true,
              padding: EdgeInsets.all(8.0),
              children: [
                // Replace the following with your chat messages
                ChatMessage(text: 'Winek ech Famamaa', isMe: false),
                ChatMessage(text: ' 7agro rojla eli 3anaa', isMe: true),
                ChatMessage(text: 'eroooororororoo', isMe: false),
                ChatMessage(text: 'Winek ech Famamaa', isMe: false),
                ChatMessage(text: ' 7agro rojla eli 3anaa', isMe: true),
                ChatMessage(text: 'eroooororororoo', isMe: false),
                ChatMessage(
                    text:
                        'Winek ech Famamaa Winek ech FamamaaWinek ech FamamaaWinek ech Famamaa',
                    isMe: false),
                ChatMessage(text: ' 7agro rojla eli 3anaa', isMe: true),
                ChatMessage(text: 'eroooororororoo', isMe: false),
                ChatMessage(text: 'Winek ech Famamaa', isMe: false),
                ChatMessage(text: ' 7agro rojla eli 3anaa', isMe: true),
                ChatMessage(text: 'eroooororororoo', isMe: false),
                // ...
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 3.5),
            margin: EdgeInsets.only(bottom: 10),
            width: SizeConfig.screenWidth,
            height: 37,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 26, 40, 50),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(196, 3, 3, 3).withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: TextFormField(
                    controller: _messageController,
                    onChanged: (String value) {},
                    style: TextStyle(color: Color.fromARGB(255, 217, 218, 219)),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Messages..',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 18,
                        color: Color.fromARGB(255, 85, 96, 110),
                      ),
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Icon(Icons.image,
                        size: 25, color: Color.fromARGB(255, 255, 255, 255))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField() {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, -3),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: 'Type a message...',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              // Add your logic to send the message
              _sendMessage();
            },
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    // Add your logic to send the message
    String message = _messageController.text.trim();
    if (message.isNotEmpty) {
      // Add the message to the chat
      setState(() {
        // Add your logic to handle sent messages
        // You may want to update a list of messages here
      });
      _messageController.clear();
    }
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isMe;

  const ChatMessage({required this.text, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
          mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Container(
              width: SizeConfig.screenHeight! * 0.3,
              padding: EdgeInsets.all(8.0),
              constraints: BoxConstraints(),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 39, 48, 65),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: isMe ? Alignment.topRight : Alignment.topLeft,
                    child: Container(
                      width: SizeConfig.screenHeight! * 0.28,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 5, 122, 4),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Expanded(
                        child: Text(text,
                            style: TextStyle(
                              color: Color.fromARGB(
                                  255, 252, 252, 252), // Set the text color
                              fontFamily: 'Poppins', // Set the font family
                              fontWeight:
                                  FontWeight.w500, // Set the font weight
                              fontSize: (SizeConfig.screenWidth!! * 10) /
                                  384, // Set the font size
                            )),
                      ),
                    ),
                  ),
                  Container(
                    width: SizeConfig.screenHeight! * 0.28,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 226, 9, 186),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("20:30",
                            style: TextStyle(
                              color: Color.fromARGB(
                                  255, 252, 252, 252), // Set the text color
                              fontFamily: 'Poppins', // Set the font family
                              fontWeight:
                                  FontWeight.w500, // Set the font weight
                              fontSize: (SizeConfig.screenWidth!! * 10) /
                                  384, // Set the font size
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ]),
    );
  }
}
