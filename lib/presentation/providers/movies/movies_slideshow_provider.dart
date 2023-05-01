import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_movies_app/domain/entities/movie.dart';
import 'package:flutter_movies_app/presentation/providers/movies/movies_providers.dart';

final moviesSlidesShowProvider = Provider<List<Movie>>((ref) {
  final nowplayingMovies = ref.watch(nowPlayingMoviesProvider);

  if (nowplayingMovies.isEmpty) return[];
  return nowplayingMovies.sublist(0, 6);
});