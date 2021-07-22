import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_movie_app/shared/constants.dart';

class BlurredCurvedImage extends StatelessWidget {
  final String imagePath;
  final BorderRadius borderRadius;
  final double height;
  BlurredCurvedImage({required this.imagePath,required this.borderRadius,required this.height});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imageWith400w(path: imagePath)),
            fit: BoxFit.fill,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 10,
            sigmaY: 10,
          ),
          child: Container(color: Colors.white.withOpacity(0.0)),
        ),
      ),
    );
  }
}
