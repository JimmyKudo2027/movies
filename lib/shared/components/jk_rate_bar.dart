import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RateBar extends StatelessWidget {
  final double rate;
  final double size;
  RateBar({required this.rate, required this.size});
  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      ignoreGestures: true,
      tapOnlyMode: false,
      initialRating: rate,
      minRating: 1,
      itemSize: size,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => Icon(
        Icons.star_outline_rounded,
        color: Colors.orange,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}
