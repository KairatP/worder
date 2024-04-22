import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rhyme_me/view/favorite/bloc/favorite_bloc.dart';
import 'package:rhyme_me/view/history/rhymes_page/bloc/rhyme_page_bloc.dart';
import 'package:rhyme_me/view/home/bloc/home_bloc.dart';
import 'package:rhyme_me/view/widget/cards_list.dart';

class RhymePage extends StatelessWidget {
  const RhymePage({
    super.key,
  });

  /// View area
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.secondaryHeaderColor,
      ),
      body:
          BlocBuilder<RhymePageBloc, RhymePageState>(builder: (context, state) {
        if (state is RhymePageDataLoaded) {
          return SafeArea(
            child: ListView.builder(
                padding: const EdgeInsets.only(top: 10),
                itemCount: state.rhymes.length,
                itemBuilder: (context, index) {
                  final rhyme = state.rhymes[index];
                  final isFavorite = state.isFavorite[index];
                  final searchWord = state.searchWord;
                  return CardsList(
                    isFavorite: isFavorite,
                    word: searchWord,
                    rhymes: rhyme,
                    tabFavorite: () =>
                        _toggleFavorite(context, rhyme, searchWord, isFavorite),
                  );
                }),
          );
        }
        return const SliverFillRemaining(
          child: Center(child: CircularProgressIndicator()),
        );
      }),
    );
  }

  /// Methods area

  // update isFavorite value on the data and show on the screen.
  Future<void> _toggleFavorite(
    BuildContext context,
    // HomeDataLoaded state,
    String currentRhyme,
    String searchWord,
    bool isFavorite,
  ) async {
    final rhymePageBloc = BlocProvider.of<RhymePageBloc>(context);
    final favoriteRhymesBloc = BlocProvider.of<FavoriteBloc>(context);
    final homeBloc = BlocProvider.of<HomeBloc>(context);

    final completer = Completer();
    rhymePageBloc.add(ToggleFavoriteRhymesRhymePage(
      favoriteWord: currentRhyme,
      searchWord: searchWord,
      isFavorite: !isFavorite,
      completer: completer,
    ));

    await completer.future;
    favoriteRhymesBloc.add(LoadFavoriteRhymes());
    homeBloc.add(ResetHomePage());
  }
}
