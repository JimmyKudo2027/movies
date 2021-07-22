import 'package:flutter/material.dart';

class GenresItem extends StatelessWidget {
  final List<dynamic> genres;
  GenresItem({required this.genres});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text(
                genres[index]['name'],
                textAlign: TextAlign.center,
                style:
                TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            width: 15,
          ),
          itemCount: genres.length),
    );
  }
}
