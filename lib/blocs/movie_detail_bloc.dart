import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/blocs/movie_states.dart';
import 'package:flutter_movie_app/network/remote/dio_helper.dart';

class MovieDetailCubit extends Cubit<MovieAppStates>{
  MovieDetailCubit():super(MovieDetailInitState());
  static MovieDetailCubit get(BuildContext context)=>BlocProvider.of(context);

  List<dynamic> movieGenres = [];
  List<dynamic> movieCast = [];
  int movieDuration = 0;
  String movieTrailer = '';

  void getMovieDetailAGT({required int movieId}) {
    emit(MovieDetailAGTLoadingState());
    movieGenres = [];
    movieCast = [];
    movieDuration = 0;
    DioHelper.getData(
        url: '3/movie/$movieId',
        query: {
          'api_key':'13003a48f989b82a73264ac39d8f6fbb',
          'language':'en-US',
          'append_to_response':'credits',
        }
    ).then((value) {
      movieGenres = value.data['genres'];
      movieDuration = value.data['runtime'];
      movieCast = value.data['credits']['cast'];
      print(movieGenres.length);
      print(movieDuration);
      print(movieCast.length);
      emit(MovieDetailAGTSuccessState());
    }).catchError((error) {
      emit(MovieDetailAGTFailureState(error:error.toString()));
      print("Error With Getting Data ----> ${error.toString()}");
    });
  }

  void getMovieDetailTrailer({required int movieId}) {
    emit(MovieDetailTrailerLoadingState());
    movieTrailer = '';
    DioHelper.getData(
        url: '3/movie/$movieId/videos',
        query: {
          'api_key':'13003a48f989b82a73264ac39d8f6fbb',
          'language':'en-US',
        }
    ).then((value) {
      movieTrailer = 'https://www.youtube.com/watch?v=${value.data['results'][0]['key']}';
      print(movieTrailer);
      emit(MovieDetailTrailerSuccessState());
    }).catchError((error) {
      emit(MovieDetailTrailerFailureState(error:error.toString()));
      print("Error With Getting Data ----> ${error.toString()}");
    });
  }


}