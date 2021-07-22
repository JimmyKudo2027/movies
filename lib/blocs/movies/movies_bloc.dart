import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/blocs/movies/movie_event.dart';
import 'package:flutter_movie_app/blocs/movies/movie_state.dart';
import 'package:flutter_movie_app/models/movie_model.dart';
import 'package:flutter_movie_app/repositories/movie_repository.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieStateInit());

  @override
  Stream<MovieState> mapEventToState(MovieEvent event) async* {
    if (event is MovieEventFetch) {
      yield* _fetchMovies(event);
    }
  }

  Stream<MovieState> _fetchMovies(MovieEventFetch event) async* {
    try {
      yield MovieStateLoading();
      List<Movie> movies = await MovieRepository.getMovies(movieFetchType: event.movieFetchType);
      yield MovieStateSuccess(movies: movies);
    } catch (e) {
      yield MovieStateFail(error: e.toString());
    }
  }
}
