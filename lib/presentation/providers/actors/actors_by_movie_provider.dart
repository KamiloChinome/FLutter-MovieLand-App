import 'package:flutter_movies_app/domain/entities/actor.dart';
import 'package:flutter_movies_app/presentation/providers/actors/actors_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsByMovieProvider = StateNotifierProvider<ActorsByMovieNotifier, Map<String, List<Actor>>>((ref) {

  final actorsRepository = ref.watch(actorRepositoryProvider);
  return ActorsByMovieNotifier(getActor: actorsRepository.getActorsByMovie); 
///xd
});


typedef GetActorsCallback = Future<List<Actor>>Function(String movieId);

class ActorsByMovieNotifier extends StateNotifier<Map<String, List<Actor>>>{
  final GetActorsCallback getActor;
  ActorsByMovieNotifier({required this.getActor}): super({});
  Future<void> loadActors(String movieId) async {
    if(state[movieId] != null) return;
    final List<Actor> actors = await getActor(movieId);
    state = {...state, movieId: actors};

  }
}