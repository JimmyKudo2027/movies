import 'package:flutter/material.dart';
import 'package:flutter_movie_app/models/movie_model.dart';
import 'package:flutter_movie_app/modules/movie_detail_screen/detail_screen.dart';

import '../constants.dart';

class MovieItem extends StatelessWidget {
  final String imagePath;
  MovieItem({required this.imagePath});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Image.network(
          imageWith400w(path: imagePath),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}


class ClickableMovieItem extends StatelessWidget {
  final Movie movie;
  final int w;
  ClickableMovieItem({required this.movie, required this.w});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateTo(context: context, route: MovieDetailScreen(movie: movie));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Image.network(
          w == 200
              ? imageWith200w(path: movie.posterUrl)
              : imageWith400w(path: movie.posterUrl),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class MoviesItemList extends StatelessWidget {
  final List<dynamic> movies;
  MoviesItemList({required this.movies});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ClickableMovieItem(movie: Movie.get(movies[index]) , w: 200);
          },
          separatorBuilder: (context, index) => SizedBox(
                width: 10,
              ),
          itemCount: movies.length),
    );
  }
}

