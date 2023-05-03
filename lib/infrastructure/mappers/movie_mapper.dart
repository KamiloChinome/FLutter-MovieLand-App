import 'package:flutter_movies_app/domain/entities/movie.dart';
import 'package:flutter_movies_app/infrastructure/models/moviedb/movie_details.dart';
import 'package:flutter_movies_app/infrastructure/models/moviedb/movie_moviedb.dart';

class MovieMapper {

  static Movie movieDBToEntity(MovieMovieDB movieDB) => Movie(
    adult: movieDB.adult,
    backdropPath: movieDB.backdropPath != '' 
    ? 'https://image.tmdb.org/t/p/w500${movieDB.backdropPath}'
    : 'https://ih1.redbubble.net/image.1893341687.8294/poster,504x498,f8f8f8-pad,600x600,f8f8f8.jpg',
    genreIds: movieDB.genreIds.map((e) => e.toString()).toList(),
    id: movieDB.id,
    originalLanguage: movieDB.originalLanguage,
    originalTitle: movieDB.originalTitle,
    overview: movieDB.overview,
    popularity: movieDB.popularity,
    posterPath: movieDB.posterPath != ''
    ? 'https://image.tmdb.org/t/p/w500${movieDB.posterPath}'
    : 'https://ih1.redbubble.net/image.1893341687.8294/poster,504x498,f8f8f8-pad,600x600,f8f8f8.jpg',
    releaseDate: movieDB.releaseDate,
    title: movieDB.title,
    video: movieDB.video,
    voteAverage: movieDB.voteAverage,
    voteCount: movieDB.voteCount
  );

  static Movie movieDetailsToEntity(MovieDetails movieDB) => Movie(
    adult: movieDB.adult,
    backdropPath: movieDB.backdropPath != '' 
    ? 'https://image.tmdb.org/t/p/w500${movieDB.backdropPath}'
    : 'https://ih1.redbubble.net/image.1893341687.8294/poster,504x498,f8f8f8-pad,600x600,f8f8f8.jpg',
    genreIds: movieDB.genres.map((e) => e.name).toList(),
    id: movieDB.id,
    originalLanguage: movieDB.originalLanguage,
    originalTitle: movieDB.originalTitle,
    overview: movieDB.overview,
    popularity: movieDB.popularity,
    posterPath: movieDB.posterPath != ''
    ? 'https://image.tmdb.org/t/p/w500${movieDB.posterPath}'
    : 'https://ih1.redbubble.net/image.1893341687.8294/poster,504x498,f8f8f8-pad,600x600,f8f8f8.jpg',
    releaseDate: movieDB.releaseDate,
    title: movieDB.title,
    video: movieDB.video,
    voteAverage: movieDB.voteAverage,
    voteCount: movieDB.voteCount
  );
}
