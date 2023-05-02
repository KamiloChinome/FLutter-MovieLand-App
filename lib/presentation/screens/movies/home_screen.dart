import 'package:flutter/material.dart';
import 'package:flutter_movies_app/presentation/providers/providers.dart';
import 'package:flutter_movies_app/presentation/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: CustomBottomNavigation(),
      body: _HomeView()
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();
  @override
  _HomeViewState createState() => _HomeViewState();
}
class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
  }
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    final slideShowMovies = ref.watch(moviesSlidesShowProvider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          shadowColor: Theme.of(context).scaffoldBackgroundColor,
          automaticallyImplyLeading: false,
          elevation: 0,
          surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
          centerTitle: false,
          floating: true,
          actions: [
            IconButton(
                icon: const Icon(Icons.search),
                onPressed: (){},
              ),
          ],
          title: Row(
            children: [
              Icon(Icons.movie_outlined, color: colors.primary,),
              const SizedBox(width: 10),
              Text('Movieland', style: titleStyle,),
            ],
          ),
        ),
        SliverList(delegate: SliverChildBuilderDelegate(
          (context, index){
            return Column(
              children: [
                
                MoviesSlideShow(movies: slideShowMovies),
                MovieHorizontalListview(
                  movies: nowPlayingMovies,
                  title: 'In cinemas',
                  subTitle: 'Lunes 20',
                  loadNextPage: () => ref.read(nowPlayingMoviesProvider.notifier).loadNextPage()
                ),
                MovieHorizontalListview(
                  movies: popularMovies,
                  title: 'Popular',
                  loadNextPage: () => ref.read(popularMoviesProvider.notifier).loadNextPage()
                ),
                MovieHorizontalListview(
                  movies: nowPlayingMovies,
                  title: 'Coming Soon',
                  subTitle: 'This Month',
                  loadNextPage: () => ref.read(nowPlayingMoviesProvider.notifier).loadNextPage()
                ),
                MovieHorizontalListview(
                  movies: nowPlayingMovies,
                  title: 'Top Rated',
                  loadNextPage: () => ref.read(nowPlayingMoviesProvider.notifier).loadNextPage()
                ),
                const SizedBox(height: 20,)
              ],
            );
          },
          childCount: 1,
        ))
      ]
    );
  }
}