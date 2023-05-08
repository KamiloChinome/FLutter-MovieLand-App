
import 'package:flutter_movies_app/infrastructure/datasources/actor_moviedb_datasource.dart';
import 'package:flutter_movies_app/infrastructure/repositories/actor_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorRepositoryProvider = Provider<ActorRepositoryImpl>((ref) {
  
  return ActorRepositoryImpl(ActorMovieDbDatasource());
});