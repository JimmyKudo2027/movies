import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:flutter_movie_app/blocs/movie_bloc.dart';
import 'package:flutter_movie_app/models/movie_model.dart';
import 'package:flutter_movie_app/modules/movie_detail_screen/detail_screen.dart';

import '../constants.dart';

class NowPlayingMoviesSwiper extends StatelessWidget {
  final double height;
  final BuildContext ctx;
  NowPlayingMoviesSwiper({required this.height,required this.ctx});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: Swiper(
        itemBuilder: (BuildContext context, int idx) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.network(
              'https://image.tmdb.org/t/p/w400${MovieAppCubit.get(ctx).nowPlayingMovies[idx]['poster_path']}',
              fit: BoxFit.fill,
            ),
          );
        },
        itemCount: MovieAppCubit.get(ctx).nowPlayingMovies.length,
        viewportFraction: 0.5,
        scale: 0.1,
        index: MovieAppCubit.get(ctx).currentPlayingMovieIdx,
        physics: BouncingScrollPhysics(),
        onTap: (idx) {
          navigateTo(context: context, route: MovieDetailScreen(movie: Movie.get(MovieAppCubit.get(ctx).nowPlayingMovies[idx]),));
          print(idx);
        },
        onIndexChanged: (idx) {
          print(idx);
          MovieAppCubit.get(ctx).nowPlayingMovies[idx].changeCurrentPlayingMovieIndex(index: idx);
        },
      ),
    );
  }
}
