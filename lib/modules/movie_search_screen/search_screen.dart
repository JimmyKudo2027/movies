import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:flutter_movie_app/blocs/movie_bloc.dart';
import 'package:flutter_movie_app/blocs/movie_states.dart';
import 'package:flutter_movie_app/shared/components/jk_search_movie_item.dart';
import 'package:flutter_movie_app/shared/components/jk_text_form_field.dart';

class MovieSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieAppCubit,MovieAppStates>(
        listener: (context, state) {
          if(state is MovieAppChangeNavBarCurrentIndex){
            if(state.idx == 1){
              MovieAppCubit.get(context).controller.clear();
              MovieAppCubit.get(context).searchMovies = [];
            }
          }
        },
        builder: (context, state) {
          MovieAppCubit cubit = MovieAppCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: DefaultTextFormField(
                          controller: MovieAppCubit.get(context).controller,
                          type: TextInputType.text,
                          onChange: (String value){
                            MovieAppCubit.get(context).getSearchMovies(query:value);
                          },
                          label: "Search",
                          prefix: Icons.search_outlined),
                    ),
                    Expanded(
                      child: Conditional.single(
                          context: context,
                          conditionBuilder: (context) => state is! SearchMoviesLoadingState,
                          widgetBuilder: (context) {
                            return SearchMovieItemList(movies: cubit.searchMovies);
                          },
                          fallbackBuilder: (context) => Center(child: CircularProgressIndicator()),),
                    )
                  ],
                  ),
            ),
            );
        },
    );
  }
}
