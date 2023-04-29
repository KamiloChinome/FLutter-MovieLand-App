

import 'package:flutter_movies_app/domain/datasources/movies_datasource.dart';
import 'package:flutter_movies_app/domain/entities/movie.dart';
import 'package:flutter_movies_app/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository{

  final MoviesDataSOurce datasource;
  MovieRepositoryImpl(this.datasource);

  
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page);
  }


} 