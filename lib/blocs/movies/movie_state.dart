import 'package:equatable/equatable.dart';
import 'package:flutter_movie_app/models/movie_model.dart';

abstract class MovieState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MovieStateInit extends MovieState {}

class MovieStateLoading extends MovieState {}

class MovieStateSuccess extends MovieState {
  MovieStateSuccess({required this.movies});
  final List<Movie> movies;

  @override
  List<Object?> get props => [this.movies];
}

class MovieStateFail extends MovieState {
  MovieStateFail({required this.error});
  final String error;

  @override
  List<Object?> get props => [error];
}
