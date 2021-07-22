import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:flutter_movie_app/blocs/movie_bloc.dart';
import 'package:flutter_movie_app/blocs/movie_states.dart';
import 'package:flutter_movie_app/enums/movies_fetch_type.dart';
import 'package:flutter_movie_app/shared/components/jk_blurred_image.dart';
import 'package:flutter_movie_app/shared/components/jk_clickable_text.dart';
import 'package:flutter_movie_app/shared/components/jk_movie_item.dart';
import 'package:flutter_movie_app/shared/components/jk_now_playing_movies_swiper.dart';
import 'package:flutter_movie_app/shared/components/jk_rate_bar.dart';

class MovieHomeScreen extends StatefulWidget {
  @override
  _MovieHomeScreenState createState() => _MovieHomeScreenState();
}

class _MovieHomeScreenState extends State<MovieHomeScreen> {
  MovieFetchType _fetchType = MovieFetchType.topRated;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieAppCubit, MovieAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        MovieAppCubit cubit = MovieAppCubit.get(context);

        return Conditional.single(
          context: context,
          widgetBuilder: (context) => Stack(
            children: [
              _buildCuurvedImage(cubit),
              Column(
                children: [
                  SizedBox(height: 100),
                  NowPlayingMoviesSwiper(height: 300, ctx: context),
                  SizedBox(height: 10),
                  RateBar(rate: cubit.nowPlayingMovies[cubit.currentPlayingMovieIdx]['vote_average'] / 2, size: 40),
                  Text(
                    "Released Date (${cubit.nowPlayingMovies[cubit.currentPlayingMovieIdx]['release_date']})",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            ClickableText(
                                title: 'TopRated',
                                onClick: () {
                                  cubit.toggleBetweenTopRatedPopularAndUpComingMovies(idx: 0);
                                  setState(() {
                                    _fetchType = MovieFetchType.topRated;
                                  });
                                },
                                isSelected: cubit.isTopRatedSelected),
                            Spacer(),
                            ClickableText(
                                title: 'Popular',
                                onClick: () {
                                  cubit.toggleBetweenTopRatedPopularAndUpComingMovies(idx: 1);
                                  setState(() {
                                    _fetchType = MovieFetchType.popular;
                                  });
                                },
                                isSelected: cubit.isPopularSelected),
                            Spacer(),
                            ClickableText(
                                title: 'UpComing',
                                onClick: () {
                                  cubit.toggleBetweenTopRatedPopularAndUpComingMovies(idx: 2);
                                  setState(() {
                                    _fetchType = MovieFetchType.upComing;
                                  });
                                },
                                isSelected: cubit.isUpComingSelected),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: MoviesItemList(movieFetchType: _fetchType),
                  )
                ],
              )
            ],
          ),
          fallbackBuilder: (context) => Center(child: CircularProgressIndicator()),
          conditionBuilder: (BuildContext context) => cubit.tempMovies.length != 0,
        );
      },
    );
  }

  BlurredCurvedImage _buildCuurvedImage(MovieAppCubit cubit) {
    return BlurredCurvedImage(
      height: 350,
      imagePath: cubit.nowPlayingMovies[cubit.currentPlayingMovieIdx]['poster_path'],
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(175),
        bottomLeft: Radius.circular(175),
      ),
    );
  }
}
