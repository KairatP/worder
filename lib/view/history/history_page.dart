import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:worder/ui_assets/my_assets/colors.dart';
import 'package:worder/view/home/widgets/home_initial_baner.dart';
import 'package:worder/view/widget/view.dart';

import 'bloc/history_bloc.dart';

@RoutePage()
class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final historyBloc = BlocProvider.of<HistoryBloc>(context);
    historyBloc.add(LoadHistoryRhymes());
    return Scaffold(
      body: BlocBuilder<HistoryBloc, HistoryState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              const SliverAppBar(
                pinned: true,
                snap: false,
                floating: false,
                title: Text("History", style: TextStyle(color: AppColors.whiteColor),),
                centerTitle: true,
                elevation: 0,
                backgroundColor: AppColors.mainColor,
                surfaceTintColor: Colors.transparent,
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 10),
              ),
              if (state is HistoryStateLoaded) 
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200.0,
                    mainAxisSpacing: 10.0,
                    // crossAxisSpacing: 10.0,
                    childAspectRatio: 1.4,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return HistoryCards(
                        searchWord: state.rhymes[index].word,
                        rhymes: state.rhymes[index].words,
                        maxLines: 5,
                        width: double.infinity,
                      );
                    },
                    childCount: state.rhymes.length,
                  ),
                ),
              ),
              if (state is NoHistoryState) 
              const SliverFillRemaining(
                child: HomeListInitialBanner(title: 'No history yet', subTitle: 'Search rhymes at home page',),
              ),
            ],
          );
        },
      ),
    );
  }
}
