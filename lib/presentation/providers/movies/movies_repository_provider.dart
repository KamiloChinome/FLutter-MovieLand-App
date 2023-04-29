import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_movies_app/infrastructure/datasources/moviedb_datasource.dart';
import 'package:flutter_movies_app/infrastructure/repositories/movie_repository_impl.dart';

final movieRepositoryProvider = Provider<MovieRepositoryImpl>((ref) {
  
  return MovieRepositoryImpl(MoviedbDatasource());
});