import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/blocs/movie_states.dart';
import 'package:flutter_movie_app/modules/movie_favourite_screen/favourite_screen.dart';
import 'package:flutter_movie_app/modules/movie_home_screen/home_screen.dart';
import 'package:flutter_movie_app/modules/movie_search_screen/search_screen.dart';
import 'package:flutter_movie_app/network/remote/dio_helper.dart';

class MovieAppCubit extends Cubit<MovieAppStates>{
  MovieAppCubit():super(MovieAppInitState());
  static MovieAppCubit get(context) => BlocProvider.of(context);

  TextEditingController controller = TextEditingController();

  int screenCurrentIdx = 0;
  List<Widget> movieScreen = [
    MovieHomeScreen(),
    MovieSearchScreen(),
    MovieFavouriteScreen(),
  ];

  void changeScreenCurrentIndex({required int idx}){
    screenCurrentIdx =idx;
    emit(MovieAppChangeNavBarCurrentIndex(idx: screenCurrentIdx));
  }

  List<dynamic> nowPlayingMovies = [];
  int currentPlayingMovieIdx = 0;

  void changeCurrentPlayingMovieIndex({required int index}){
    currentPlayingMovieIdx = index;
    emit(NowPlayingMoviesChangeCurrentIndex());
  }

  void getNowPlayingMovies() {
    emit(NowPlayingMoviesLoadingState());
    if (nowPlayingMovies.length == 0) {
      DioHelper.getData(
          url: '3/movie/now_playing',
          query: {
            'api_key':'13003a48f989b82a73264ac39d8f6fbb',
            'language':'en-US',
          }
      ).then((value) {
        nowPlayingMovies = value.data['results'];
        print(nowPlayingMovies.length);
        emit(NowPlayingMoviesSuccessState());
      }).catchError((error) {
        emit(NowPlayingMoviesFailureState(error:error.toString()));
        print("Error With Getting Data ----> ${error.toString()}");
      });
    } else {
      emit(NowPlayingMoviesSuccessState());
    }
  }


  List<dynamic> topRatedMovies = [];

  void getTopRatedMovies() {
    emit(TopRatedMoviesLoadingState());
    if (topRatedMovies.length == 0) {
      DioHelper.getData(
          url: '3/movie/top_rated',
          query: {
            'api_key':'13003a48f989b82a73264ac39d8f6fbb',
            'language':'en-US',
          }
      ).then((value) {
        topRatedMovies = value.data['results'];
        toggleBetweenTopRatedPopularAndUpComingMovies(idx: 0);
        print(topRatedMovies.length);
        emit(TopRatedMoviesSuccessState());
      }).catchError((error) {
        emit(TopRatedMoviesFailureState(error:error.toString()));
        print("Error With Getting Data ----> ${error.toString()}");
      });
    } else {
      emit(TopRatedMoviesSuccessState());
    }
  }

  List<dynamic> popularMovies = [];

  void getPopularMovies() {
    emit(PopularMoviesLoadingState());
    if (popularMovies.length == 0) {
      DioHelper.getData(
          url: '3/movie/popular',
          query: {
            'api_key':'13003a48f989b82a73264ac39d8f6fbb',
            'language':'en-US',
          }
      ).then((value) {
        popularMovies = value.data['results'];
        print(popularMovies.length);
        emit(PopularMoviesSuccessState());
      }).catchError((error) {
        emit(PopularMoviesFailureState(error:error.toString()));
        print("Error With Getting Data ----> ${error.toString()}");
      });
    } else {
      emit(PopularMoviesSuccessState());
    }
  }

  List<dynamic> upComingMovies = [];

  void getUpComingMovies() {
    emit(UpComingMoviesLoadingState());
    if (upComingMovies.length == 0) {
      DioHelper.getData(
          url: '3/movie/upcoming',
          query: {
            'api_key':'13003a48f989b82a73264ac39d8f6fbb',
            'language':'en-US',
          }
      ).then((value) {
        upComingMovies = value.data['results'];
        print(upComingMovies.length);
        emit(UpComingMoviesSuccessState());
      }).catchError((error) {
        emit(UpComingMoviesFailureState(error:error.toString()));
        print("Error With Getting Data ----> ${error.toString()}");
      });
    } else {
      emit(UpComingMoviesSuccessState());
    }
  }

  List<dynamic> tempMovies = [];
  bool isTopRatedSelected = true;
  bool isPopularSelected = false;
  bool isUpComingSelected = false;
  void toggleBetweenTopRatedPopularAndUpComingMovies({required int idx}){
    // 0 -> topRated
    // 1 -> popular
    // 2 - upComing
    if(idx == 0){
      tempMovies = topRatedMovies;
      isTopRatedSelected = true;
      isPopularSelected = false;
      isUpComingSelected = false;
      emit(MovieAppChangeButtonsRowCurrentSelected());
    }else if (idx == 1){
      tempMovies = popularMovies;
      isTopRatedSelected = false;
      isPopularSelected = true;
      isUpComingSelected = false;
      emit(MovieAppChangeButtonsRowCurrentSelected());
    }else if (idx == 2){
      tempMovies = upComingMovies;
      isTopRatedSelected = false;
      isPopularSelected = false;
      isUpComingSelected = true;
      emit(MovieAppChangeButtonsRowCurrentSelected());
    }
  }

  List<dynamic> searchMovies = [];

  void getSearchMovies({required String query}) {
    searchMovies = [];
    emit(SearchMoviesLoadingState());
    DioHelper.getData(
        url: '3/search/movie',
        query: {
          'api_key':'13003a48f989b82a73264ac39d8f6fbb',
          'language':'en-US',
          'query' : query
        }
    ).then((value) {
      searchMovies = value.data['results'];
      print(searchMovies.length);
      emit(SearchMoviesSuccessState());
    }).catchError((error) {
      emit(SearchMoviesFailureState(error:error.toString()));
      print("Error With Getting Data ----> ${error.toString()}");
    });
  }





}