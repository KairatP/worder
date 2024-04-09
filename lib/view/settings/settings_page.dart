import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:worder/ui_assets/my_assets/colors.dart';
import 'package:worder/view/favorite/bloc/favorite_bloc.dart';
import 'package:worder/view/history/bloc/history_bloc.dart';
import 'package:worder/view/settings/bloc/settings_bloc.dart';
import 'widget/settings_action_card.dart';
import 'widget/settings_card.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final settingBloc = BlocProvider.of<SettingsBloc>(context);
    return Scaffold(
      body: BlocConsumer<SettingsBloc, SettingsState>(
        listener: _historyBlocHandle,
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              const SliverAppBar(
                pinned: true,
                title: Text("Settings", style: TextStyle(color: AppColors.whiteColor),),
                elevation: 0,
                backgroundColor: AppColors.mainColor,
                surfaceTintColor: Colors.transparent,
              ),
              SliverToBoxAdapter(
                child: SettingsCard(
                  title: 'Theme',
                  toggle: true,
                  onChange: (value) {
                    /// do some change on theme
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: SettingsCard(
                  title: 'Notification',
                  toggle: true,
                  onChange: (value) {
                    /// do some change on theme
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: SettingsCard(
                  title: 'App tracking transparency',
                  toggle: false,
                  onChange: (value) {
                    /// do some change on theme
                  },
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 20),
              ),
              SliverToBoxAdapter(
                child: SettingsActionCard(
                  title: 'Clean history',
                  buttonName: "Delate",
                  buttonColor: AppColors.redColor,
                  onTab: ()  => showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      /// do delate action on button
                      return AlertDialog(
                        actionsAlignment: MainAxisAlignment.center,
                        title: const Text("Delete all data?", textAlign: TextAlign.center,),
                        content: const Text("The history and favorite datas will be deleted", textAlign: TextAlign.center,),
                        actions: [
                          TextButton(
                            child: const Text("Cancel"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text("Yes"),
                            onPressed: () {
                              settingBloc.add(ClearRhymesHistoryEvent());
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SettingsActionCard(
                  title: 'Support',
                  buttonName: "Message",
                  buttonColor: AppColors.mainColor,
                  onTab: () {
                    /// do delate action on button
                  },
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 20),
              ),
            ],
          );
        },
      ),
    );
  }

  void _historyBlocHandle(BuildContext context, SettingsState state) {
    if (state is HistoryClean) {
      BlocProvider.of<HistoryBloc>(context).add(LoadHistoryRhymes());
      BlocProvider.of<FavoriteBloc>(context).add(LoadFavoriteRhymes());
    }
  }
}
