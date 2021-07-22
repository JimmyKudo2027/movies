abstract class MovieAppStates{}

class MovieAppInitState extends MovieAppStates{}


// For Changing Screen's Index
class MovieAppChangeNavBarCurrentIndex extends MovieAppStates{
  int idx;
  MovieAppChangeNavBarCurrentIndex({required this.idx});
}

// For Changing TopRated, Popular and UpComing Selected Button
class MovieAppChangeButtonsRowCurrentSelected extends MovieAppStates{}

// For Now Playing Movies
class NowPlayingMoviesLoadingState extends MovieAppStates{}
class NowPlayingMoviesSuccessState extends MovieAppStates{}
class NowPlayingMoviesFailureState extends MovieAppStates{
  String error;
  NowPlayingMoviesFailureState({required this.error});
}
// For Changing Screen's Index
class NowPlayingMoviesChangeCurrentIndex extends MovieAppStates{}


// For Popular Movies
class TopRatedMoviesLoadingState extends MovieAppStates{}
class TopRatedMoviesSuccessState extends MovieAppStates{}
class TopRatedMoviesFailureState extends MovieAppStates{
  String error;
  TopRatedMoviesFailureState({required this.error});
}


// For Popular Movies
class PopularMoviesLoadingState extends MovieAppStates{}
class PopularMoviesSuccessState extends MovieAppStates{}
class PopularMoviesFailureState extends MovieAppStates{
  String error;
  PopularMoviesFailureState({required this.error});
}

// For Up Coming Movies
class UpComingMoviesLoadingState extends MovieAppStates{}
class UpComingMoviesSuccessState extends MovieAppStates{}
class UpComingMoviesFailureState extends MovieAppStates{
  String error;
  UpComingMoviesFailureState({required this.error});
}

// For Search About Movies
class SearchMoviesLoadingState extends MovieAppStates{}
class SearchMoviesSuccessState extends MovieAppStates{}
class SearchMoviesFailureState extends MovieAppStates{
  String error;
  SearchMoviesFailureState({required this.error});
}

// For Movie Details
class MovieDetailInitState extends MovieAppStates{}
// For Actors & Genres & Time
class MovieDetailAGTLoadingState extends MovieAppStates{}
class MovieDetailAGTSuccessState extends MovieAppStates{}
class MovieDetailAGTFailureState extends MovieAppStates{
  String error;
  MovieDetailAGTFailureState({required this.error});
}
// For Actors & Genres & Time
class MovieDetailTrailerLoadingState extends MovieAppStates{}
class MovieDetailTrailerSuccessState extends MovieAppStates{}
class MovieDetailTrailerFailureState extends MovieAppStates{
  String error;
  MovieDetailTrailerFailureState({required this.error});
}