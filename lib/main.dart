import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/network/remote/dio_helper.dart';
import 'package:flutter_movie_app/shared/bloc_observer.dart';
import 'package:flutter_movie_app/styles/theme.dart';
import 'blocs/movie_bloc.dart';
import 'layouts/movie_nav_layout/movie_nav_layout.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieAppCubit()
        ..getNowPlayingMovies()
        ..getTopRatedMovies()
        ..getPopularMovies()
        ..getUpComingMovies(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Movie App',
          darkTheme: darkTheme,
          theme: lightTheme,
          themeMode: ThemeMode.light,

          // TODO : use routes

          home: AnimatedSplashScreen(
            animationDuration: Duration(milliseconds: 3000),
            splash: 'assets/images/jk_logo.png',
            splashIconSize: 250,
            backgroundColor: Colors.black,
            nextScreen: MovieMainLayout(),
            splashTransition: SplashTransition.fadeTransition,
          )),
    );
  }
}
