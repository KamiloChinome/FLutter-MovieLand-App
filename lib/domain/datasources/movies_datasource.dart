import 'package:flutter_movies_app/domain/entities/movie.dart';

abstract class MoviesDataSOurce{
  Future<List<Movie>>getNowPlaying({int page = 1});
  Future<List<Movie>>getPopular({int page = 1});

}