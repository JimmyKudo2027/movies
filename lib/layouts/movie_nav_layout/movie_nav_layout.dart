import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/blocs/movie_bloc.dart';
import 'package:flutter_movie_app/blocs/movie_states.dart';

class MovieMainLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieAppCubit,MovieAppStates>(
        listener: (context, state) {

        },
      builder: (context, state) {
          MovieAppCubit cubit = MovieAppCubit.get(context);
        return Scaffold(
          body: cubit.movieScreen[cubit.screenCurrentIdx],
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: 'Search',
                icon: Icon(Icons.search),
              ),
              BottomNavigationBarItem(
                label: 'Favourite',
                icon: Icon(Icons.favorite_border),
              ),
            ],
            currentIndex: cubit.screenCurrentIdx,
            onTap: (int index) {
              cubit.changeScreenCurrentIndex(idx: index);
            },
            type: BottomNavigationBarType.fixed,
          ),
        );
      },
    );
  }
}
