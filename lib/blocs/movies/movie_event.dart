import 'package:equatable/equatable.dart';
import 'package:flutter_movie_app/enums/movies_fetch_type.dart';

abstract class MovieEvent extends Equatable {}

class MovieEventFetch extends MovieEvent {
  MovieEventFetch({required this.movieFetchType});
  final MovieFetchType movieFetchType;

  @override
  List<Object?> get props => [];
}
