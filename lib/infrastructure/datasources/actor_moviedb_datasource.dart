import 'package:dio/dio.dart';
import 'package:flutter_movies_app/config/constants/environment.dart';
import 'package:flutter_movies_app/domain/datasources/actors_datasource.dart';
import 'package:flutter_movies_app/domain/entities/actor.dart';
import 'package:flutter_movies_app/infrastructure/mappers/actor_mapper.dart';
import 'package:flutter_movies_app/infrastructure/models/moviedb/credits_response.dart';

class ActorMovieDbDatasource extends ActorsDatasource{

  final dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/3',
        queryParameters: {
          'api_key': Enviroment.theMovieDbKey,
          'language': 'es-CO'
        }
      )
    );

    List<Actor> _jsonToActors(Map<String, dynamic> json){
      final castResponse = CreditsResponse.fromJson(json);
      final List<Actor> actors = castResponse.cast
      .map(
        (cast) => ActorMaper.castToEntity(cast)).toList();
      return actors;
    }


  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');
    return _jsonToActors(response.data);
  }

}