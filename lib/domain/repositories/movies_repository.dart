import 'package:flutter_movies_app/domain/entities/movie.dart';

abstract class MoviesRepository{
  Future<List<Movie>>getNowPlaying({int page = 1});
}