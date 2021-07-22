import 'package:flutter/material.dart';

class HexTextMiddleDivider extends StatelessWidget {
  final String title;
  HexTextMiddleDivider({required this.title});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            flex: 1,
            child: Divider(
              height: 1,
              color: Colors.deepOrange,
              thickness: 5,
            )),
        Expanded(
          flex: 3,
          child: ElevatedButton(
            autofocus: false,
            onPressed: () {},
            child: Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ),
        Expanded(
            flex: 1,
            child: Divider(
              height: 1,
              color: Colors.deepOrange,
              thickness: 5,
            )),
      ],
    );
  }
}

class HexTextLeftDivider extends StatelessWidget {
  final String title;
  HexTextLeftDivider({required this.title});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex:1,
          child: Divider(
            height: 1,
            color: Colors.deepOrange,
            thickness: 5,
          ),
        ),
        ElevatedButton(
          autofocus: false,
          onPressed: () {},
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
          style: ElevatedButton.styleFrom(
            shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
        Expanded(
            flex:15,
            child: Divider(
              height: 1,
              color: Colors.deepOrange,
              thickness: 5,
            )),
      ],
    );
  }
}
