import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/models/movie_model.dart';
import 'package:flutter_movie_app/modules/movie_detail_screen/detail_screen.dart';
import 'package:flutter_movie_app/shared/constants.dart';

import 'jk_rate_bar.dart';

class SearchMovieItem extends StatelessWidget {
  final BuildContext context;
  final Movie movie;

  SearchMovieItem({required this.context, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            width: 150.0,
            height: 200.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: DecorationImage(
                    image: NetworkImage(imageWith200w(path: movie.posterUrl)),
                    fit: BoxFit.cover
                )
            ),
          ),
          SizedBox(width: 20.0,),
          Expanded(
            child: Container(
              height: 200.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(movie.title,
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis ,
                    ),
                  ),
                  Center(child: RateBar(rate: movie.rate,size: 25)),
                  SizedBox(height: 10,),
                  Expanded(
                    child: Text(movie.overview,
                      style: TextStyle(color: Colors.grey,),
                      maxLines: 7,
                      overflow: TextOverflow.ellipsis ,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SearchMovieItemList extends StatelessWidget {
  final List<dynamic> movies;
  SearchMovieItemList({required this.movies});
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            navigateTo(
                context: context,
                route: MovieDetailScreen(movie: Movie.get(movies[index])));
          },
          child: SearchMovieItem(
            context: context,
            movie: Movie.get(movies[index]),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Divider(
            height: 1.0,
            color: Colors.grey,
          ),
        );
      },
      itemCount: movies.length,
    );
  }
}

