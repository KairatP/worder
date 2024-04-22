import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rhyme_me/global/ui_assets/my_assets/colors.dart';
import 'package:rhyme_me/view/history/rhymes_page/bloc/rhyme_page_bloc.dart';
import 'package:rhyme_me/view/history/rhymes_page/rhyme_page.dart';
import 'package:rhyme_me/view/widget/initial_baner.dart';
import 'package:rhyme_me/view/widget/view.dart';

import 'bloc/history_bloc.dart';

@RoutePage()
class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final historyBloc = BlocProvider.of<HistoryBloc>(context);
    historyBloc.add(LoadHistoryRhymes());
    return Scaffold(
      body: BlocBuilder<HistoryBloc, HistoryState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                snap: false,
                floating: false,
                title: const Text(
                  "History",
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
              if (state is HistoryStateLoaded)
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200.0,
                      mainAxisSpacing: 10.0,
                      // crossAxisSpacing: 10.0,
                      childAspectRatio: 1.4,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return GestureDetector(
                          child: HistoryCards(
                            searchWord: state.rhymes[index].word,
                            rhymes: state.rhymes[index].words,
                            maxLines: 5,
                            width: double.infinity,
                          ),
                          onTap: () => _rhymePageAction(
                              context, state.rhymes[index].word),
                        );
                      },
                      childCount: state.rhymes.length,
                    ),
                  ),
                ),
              if (state is NoHistoryState)
                const SliverFillRemaining(
                  child: ListInitialBanner(
                    title: 'No history yet',
                    subTitle: 'Search rhymes at home page',
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  /// Methods
  void _rhymePageAction(BuildContext context, String searchWord) {
    final rhymePageBloc = BlocProvider.of<RhymePageBloc>(context);
    rhymePageBloc.add(SearchRhymes(query: searchWord));
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RhymePage()),
    );
  }
}
