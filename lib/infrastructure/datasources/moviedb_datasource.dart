import 'package:dio/dio.dart';

import 'package:flutter_movies_app/config/constants/environment.dart';
import 'package:flutter_movies_app/domain/datasources/movies_datasource.dart';
import 'package:flutter_movies_app/domain/entities/movie.dart';
import 'package:flutter_movies_app/infrastructure/mappers/movie_mapper.dart';
import 'package:flutter_movies_app/infrastructure/models/moviedb/moviedb_response.dart';

class MoviedbDatasource extends MoviesDataSOurce{

    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/3',
        queryParameters: {
          'api_key': Enviroment.theMovieDbKey,
          'language': 'es-CO'
        }
      )
    );

    List<Movie> _jsonToMovies(Map<String, dynamic> json){
      final movieDBResponse = MovieDbResponse.fromJson(json);
      final List<Movie> movies = movieDBResponse.results
      .where((movieDB) => movieDB.posterPath != 'no-poster')
      .map(
        (movieDB) => MovieMapper.movieDBToEntity(movieDB)).toList();
      return movies;
    }


  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing', queryParameters: {
      'page': page
    });
    return _jsonToMovies(response.data);
  }
  

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response = await dio.get('/movie/popular', queryParameters: {
      'page': page
    });
    return _jsonToMovies(response.data);
  }
}