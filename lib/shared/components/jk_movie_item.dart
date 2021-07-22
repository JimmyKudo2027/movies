import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/blocs/movies/movie_event.dart';
import 'package:flutter_movie_app/blocs/movies/movie_state.dart';
import 'package:flutter_movie_app/blocs/movies/movies_bloc.dart';
import 'package:flutter_movie_app/enums/movies_fetch_type.dart';
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
          w == 200 ? imageWith200w(path: movie.posterUrl) : imageWith400w(path: movie.posterUrl),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class MoviesItemList extends StatefulWidget {
  MoviesItemList({required this.movieFetchType});
  MovieFetchType movieFetchType;

  @override
  _MoviesItemListState createState() => _MoviesItemListState();
}

class _MoviesItemListState extends State<MoviesItemList> {
  late MovieBloc movieBloc;
  @override
  void initState() {
    movieBloc = MovieBloc();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    movieBloc.add(MovieEventFetch(movieFetchType: widget.movieFetchType));
    return BlocProvider(
      create: (_) => movieBloc,
      child: BlocBuilder<MovieBloc, MovieState>(
        bloc: movieBloc,
        builder: (context, MovieState state) {
          if (state is MovieStateSuccess) return _buildList(state.movies);
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Padding _buildList(List<Movie> movies) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ClickableMovieItem(movie: movies[index], w: 200);
          },
          separatorBuilder: (context, index) => SizedBox(
                width: 10,
              ),
          itemCount: movies.length),
    );
  }
}
