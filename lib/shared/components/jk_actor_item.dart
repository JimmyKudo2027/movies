import 'package:flutter/material.dart';

import '../constants.dart';

class ActorItem extends StatelessWidget {
  final String? imageUrl;
  ActorItem({required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(35),
        child: Image.network(
          imageUrl != null
              ? 'https://image.tmdb.org/t/p/w300$imageUrl'
              : noImageFound,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}


class ActorsItemList extends StatelessWidget {
  final double height;
  final List<dynamic> actors;
  ActorsItemList({required this.height,required this.actors});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.all(10.0),
      child: ListView.separated(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ActorItem(imageUrl: actors[index]['profile_path']);
          },
          separatorBuilder: (context, index) {
            return SizedBox(width: 10,);
          },
          itemCount: actors.length),
    );
  }
}

