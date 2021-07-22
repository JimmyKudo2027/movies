import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/enums/movies_fetch_type.dart';
import 'package:flutter_movie_app/models/movie_model.dart';
import 'package:flutter_movie_app/network/remote/dio_helper.dart';

class MovieRepository {
  static Future<List<Movie>> getMovies({required MovieFetchType movieFetchType}) async {
    Response result = await DioHelper.getData(url: '3/movie/${movieFetchType.value}', query: {
      'api_key': '13003a48f989b82a73264ac39d8f6fbb',
      'language': 'en-US',
    });
    return (result.data['results'] as List<dynamic>).map((e) => Movie.get(e)).toList();
  }
}
