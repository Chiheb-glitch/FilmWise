import 'package:flutter/material.dart';

class cardcategories extends StatefulWidget {
  final String name;
  final ValueChanged<String> onValueChanged;

  cardcategories({required this.name, required this.onValueChanged});

  @override
  _cardcategories createState() => _cardcategories();
}

class _cardcategories extends State<cardcategories>
    with TickerProviderStateMixin {
  bool d = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          d = !d;
        });
        String newValue = "New Value";
        print(d);
        widget.onValueChanged(newValue);
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 2, 9, 2),
        decoration: BoxDecoration(
          color: d
              ? Color.fromARGB(255, 1, 116, 229)
              : Color.fromARGB(255, 26, 40, 50),
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: d
                  ? Color.fromARGB(255, 1, 116, 229)
                  : Color.fromARGB(255, 26, 40, 50),
              // Set the color of the box shadow
              blurRadius: 15, // Set the blur radius
              // Set the spread radius
              offset: Offset(0, 2), // Set the offset
            ),
          ],
        ),
        padding: EdgeInsets.fromLTRB(9, 2, 9, 2),
        child: Text(
          '${widget.name}',
          style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255), // Set the text color
              fontFamily: 'Poppins', // Set the font family
              fontWeight: FontWeight.w100, // Set the font weight
              fontSize: 15 // Set the font size
              ),
        ),
      ),
    );
  }
}
