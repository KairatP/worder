import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rhyme_me/global/ui_assets/my_assets/colors.dart';
import 'package:rhyme_me/view/favorite/bloc/favorite_bloc.dart';
import 'package:rhyme_me/view/home/bloc/home_bloc.dart';
import 'package:rhyme_me/view/widget/cards_list.dart';
import 'package:rhyme_me/view/widget/initial_baner.dart';

@RoutePage()
class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final historyBloc = BlocProvider.of<FavoriteBloc>(context);
    historyBloc.add(LoadFavoriteRhymes());
    return Scaffold(
      body: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                snap: false,
                floating: false,
                title: const Text(
                  "Favorites",
                  style: TextStyle(color: AppColors.whiteColor),
                ),
                centerTitle: true,
                elevation: 0,
                backgroundColor: theme.secondaryHeaderColor,
                surfaceTintColor: Colors.transparent,
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 10),
              ),
              if (state is FavoriteRhymesLoaded)
                SliverList.builder(
                    itemCount: state.items.length,
                    itemBuilder: (context, index) => CardsList(
                          isFavorite: state.items[index].isFavorite,
                          word: state.items[index].word,
                          rhymes: state.items[index].rhyme,
                          tabFavorite: () => _toggleFavorite(
                              context,
                              state.items[index].word,
                              state.items[index].rhyme,
                              state.items[index].isFavorite),
                        )),
              if (state is NoFavoriteState)
                const SliverFillRemaining(
                  child: ListInitialBanner(
                    title: 'No favorite rhymes yet',
                    subTitle: 'Search rhymes at home page',
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  // update isFavorite value on the data and show on the screen.
  Future<void> _toggleFavorite(
    BuildContext context,
    String searchWord,
    String currentRhyme,
    bool isFavorite,
  ) async {
    final favoriteRhymesBloc = BlocProvider.of<FavoriteBloc>(context);
    favoriteRhymesBloc.add(ToggleFavoriteRhyme(
        word: searchWord, rhyme: currentRhyme, isFavorite: !isFavorite));

    final homeBloc = BlocProvider.of<HomeBloc>(context);
    homeBloc.add(ResetHomePage());
  }
}
