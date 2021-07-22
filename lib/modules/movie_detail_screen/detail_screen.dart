import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/blocs/movie_detail_bloc.dart';
import 'package:flutter_movie_app/blocs/movie_states.dart';
import 'package:flutter_movie_app/models/movie_model.dart';
import 'package:flutter_movie_app/shared/components/jk_actor_item.dart';
import 'package:flutter_movie_app/shared/components/jk_blurred_image.dart';
import 'package:flutter_movie_app/shared/components/jk_genres_item.dart';
import 'package:flutter_movie_app/shared/components/jk_hex_shape_text_divider.dart';
import 'package:flutter_movie_app/shared/components/jk_movie_item.dart';
import 'package:flutter_movie_app/shared/components/jk_rate_bar.dart';
import 'package:flutter_movie_app/shared/constants.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;
  MovieDetailScreen({required this.movie});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MovieDetailCubit()
          ..getMovieDetailAGT(movieId: movie.id)
          ..getMovieDetailTrailer(movieId: movie.id),
      child: BlocConsumer<MovieDetailCubit,MovieAppStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          MovieDetailCubit cubit = MovieDetailCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Stack(children: [
                  BlurredCurvedImage(
                    height: 350,
                    imagePath: movie.posterUrl,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(25),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 280,
                        ),
                        ElevatedButton(
                          onPressed: ()async{
                            launchURL(movieTrailer: cubit.movieTrailer);
                          },
                          child: Icon(
                            Icons.play_arrow,
                            size: 35,
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(25),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 150,),
                        MovieItem(imagePath: movie.posterUrl),
                        SizedBox(height: 10,),
                        RateBar(rate: movie.rate, size: 35),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 25, 10, 0),
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 450),
                        GenresItem(genres: cubit.movieGenres),
                        SizedBox(height: 20,),
                        HexTextMiddleDivider(title: movie.title),
                        Text(
                          movie.overview,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.blueGrey[700],
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        HexTextLeftDivider(title: 'Cast'),
                        ActorsItemList(height: 120, actors: cubit.movieCast),
                      ],
                    ),
                  )
                ]),
              ),
            ),
          );
        },
      ),
    );
  }
}
