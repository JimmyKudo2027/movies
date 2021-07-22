import 'package:flutter/material.dart';

class ClickableText extends StatelessWidget {
  final Function()? onClick;
  final String title;
  final bool isSelected;
  ClickableText({required this.title,required this.onClick,required this.isSelected,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onClick,
        child: Center(
            child: Text(
              title,
              style: TextStyle(
                  color: isSelected?Colors.deepOrange:Colors.blueGrey[900],
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            )));
  }
}
