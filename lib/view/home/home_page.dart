import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:worder/ui_assets/my_assets/colors.dart';
import 'package:worder/view/favorite/bloc/favorite_bloc.dart';
import 'package:worder/view/history/bloc/history_bloc.dart';
import 'package:worder/view/home/bloc/home_bloc.dart';
import 'package:worder/view/widget/cards_list.dart';
import '../home/widgets/animated_header/ui_nested_scroll_view.dart';
import '../home/widgets/botom_sheet_elements.dart';
import '../home/widgets/home_initial_baner.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  /// View area
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UINestedScrollView(
        pinned: true,
        expandedWidget: GestureDetector(
          child: const Text(
            'Rhyme me :)',
            style: TextStyle(
              color: Colors.white,
              fontSize: 50,
            ),
          ),
          onTap: () => _showSearchSheet(context),
        ),
        colapsedWidget: GestureDetector(
          child: const Text(
            'Rhyme me :)',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          onTap: () => _showSearchSheet(context),
        ),
        // leadingWidget: IconButton(
        //     onPressed: () async {
        //       final query = await _showSearchSheet(context);
        //       if (query != null) {
        //         searchWord = query;
        //       }
        //     },
        //     icon: const Icon(
        //       Icons.search,
        //       color: Colors.white,
        //     )),
        sliverList: BlocConsumer<HomeBloc, HomeState>(
          listener: _historyBlocHandle,
          builder: (context, state) {
            if (state is HomeDataLoaded) {
              return SliverList.builder(
                  itemCount: state.rhymes.length,
                  itemBuilder: (context, index) {
                    final rhyme = state.rhymes[index];
                    final isFavorite = state.isFavorite[index];
                    final searchWord = state.searchWord;
                    return CardsList(
                      isFavorite: isFavorite,
                      word: searchWord,
                      rhymes: rhyme,
                      tabFavorite: () => _toggleFavorite(
                          context, rhyme, searchWord, isFavorite),
                    );
                  });
            }
            if (state is HomeInitial) {
              return const SliverFillRemaining(
                child: HomeListInitialBanner(
                  title: 'Hi there!',
                  subTitle: 'Get started to search rhymes',
                ),
              );
            }
            return const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()),
            );
          },
        ),
        boxDecoration: const BoxDecoration(color: AppColors.mainColor),
      ),
    );
  }

  /// Methods area

  // Save new data to local starage and show in screen
  Future<String?> _showSearchSheet(BuildContext context) async {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    final topHight = MediaQuery.of(context).padding.top.toDouble();
    // final topHight = MediaQuery.of(context).size.height * 1.7 / 8;
    final query = await showModalBottomSheet<String>(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        context: context,
        builder: (context) => Padding(
              padding: EdgeInsets.only(top: topHight),
              child: const BotomSheetElements(),
            ));
    if (query?.isNotEmpty ?? false) {
      homeBloc.add(SearchRhymes(query: query!));
    }
    return query;
  }

  // update History screen thrue HistoryBloc and LoadHistoryRhymes event.
  void _historyBlocHandle(BuildContext context, HomeState state) {
    if (state is HomeDataLoaded) {
      BlocProvider.of<HistoryBloc>(context).add(LoadHistoryRhymes());
    }
  }

  // update isFavorite value on the data and show on the screen.
  Future<void> _toggleFavorite(
    BuildContext context,
    // HomeDataLoaded state,
    String currentRhyme,
    String searchWord,
    bool isFavorite,
  ) async {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    final favoriteRhymesBloc = BlocProvider.of<FavoriteBloc>(context);

    final completer = Completer();
    homeBloc.add(ToggleFavoriteRhymes(
      favoriteWord: currentRhyme,
      searchWord: searchWord,
      isFavorite: !isFavorite,
      completer: completer,
    ));

    await completer.future;
    favoriteRhymesBloc.add(LoadFavoriteRhymes());
  }
}
