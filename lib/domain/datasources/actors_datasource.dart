import 'package:flutter_movies_app/domain/entities/actor.dart';

abstract class ActorsDatasource {

  Future<List<Actor>> getActorsByMovie(String movieId);

}