import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rhyme_me/global/ui_assets/my_assets/colors.dart';
import 'package:rhyme_me/view/favorite/bloc/favorite_bloc.dart';
import 'package:rhyme_me/view/history/bloc/history_bloc.dart';
import 'package:rhyme_me/view/home/bloc/home_bloc.dart';
import 'package:rhyme_me/view/widget/cards_list.dart';
import 'package:rhyme_me/view/widget/initial_baner.dart';

import '../home/widgets/animated_header/ui_nested_scroll_view.dart';
import '../home/widgets/botom_sheet_elements.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  /// View area
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: UINestedScrollView(
        pinned: true,
        expandedWidget: GestureDetector(
          child: const Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.search,
                size: 40,
                color: AppColors.whiteColor,
              ),
              SizedBox(
                width: 10,
              ),
              // Expanded(
              //   child: FittedBox(
              // child:
              Text(
                'Rhyme me',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                ),
                overflow: TextOverflow.ellipsis,
                //   ),
                // ),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          onTap: () => _showSearchSheet(context),
        ),
        colapsedWidget: GestureDetector(
          child: const Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.search,
                size: 20,
                color: AppColors.whiteColor,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Rhyme me',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          onTap: () => _showSearchSheet(context),
        ),
        // leadingWidget: IconButton(
        //     onPressed: () async {
        //       await _showSearchSheet(context);
        //       // if (query != null) {
        //       //   searchWord = query;
        //       // }
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
                child: ListInitialBanner(
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
        boxDecoration: BoxDecoration(
          color: theme.secondaryHeaderColor,
        ),
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
