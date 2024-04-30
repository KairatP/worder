import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rhyme_me/bloc/main_bloc.dart';
import 'package:rhyme_me/global/ui_assets/my_assets/colors.dart';
import 'package:rhyme_me/view/favorite/bloc/favorite_bloc.dart';
import 'package:rhyme_me/view/history/bloc/history_bloc.dart';
import 'package:rhyme_me/view/home/bloc/home_bloc.dart';
import 'package:rhyme_me/view/settings/bloc/settings_bloc.dart';
import 'package:rhyme_me/view/settings/email/email_page.dart';

import 'widget/settings_action_card.dart';
import 'widget/settings_card.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          // if (state is SettingsLoaded) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                title: const Text(
                  "Settings",
                  style: TextStyle(color: AppColors.whiteColor),
                ),
                elevation: 0,
                backgroundColor: theme.secondaryHeaderColor,
                surfaceTintColor: Colors.transparent,
              ),
              SliverToBoxAdapter(
                child: SettingsCard(
                  title: 'Light theme',
                  style: theme.textTheme.titleMedium!,
                  toggle: state.theme == '0' ? true : false,
                  onChange: (value) => _themeAction(context, value),
                ),
              ),
              // SliverToBoxAdapter(
              //   child: SettingsCard(
              //     title: 'Notification',
              //     style: theme.textTheme.titleMedium!,
              //     toggle: state.notification == '0' ? true : false,
              //     onChange: (value) => _notificationAction(context, value),
              //   ),
              // ),
              // SliverToBoxAdapter(
              //   child: SettingsCard(
              //     title: 'App tracking transparency',
              //     style: theme.textTheme.titleMedium!,
              //     toggle: state.appTrack == '0' ? true : false,
              //     onChange: (value) {
              //       /// do some change on theme
              //     },
              //   ),
              // ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 20),
              ),
              SliverToBoxAdapter(
                child: SettingsActionCard(
                  title: 'Clean history',
                  textStyle: theme.textTheme.titleMedium!,
                  buttonName: "Delete",
                  buttonColor: AppColors.redColor,
                  onTab: () => showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      /// do delate action on button
                      return AlertDialog(
                        actionsAlignment: MainAxisAlignment.center,
                        title: const Text(
                          "Delete all data?",
                          textAlign: TextAlign.center,
                        ),
                        content: const Text(
                          "The history and favorite datas will be deleted",
                          textAlign: TextAlign.center,
                        ),
                        actions: [
                          TextButton(
                            child: const Text("Cancel"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text(
                              "Yes",
                              style: TextStyle(color: Colors.red),
                            ),
                            onPressed: () {
                              _historyBlocHandle(context, state);
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
                  textStyle: theme.textTheme.titleMedium!,
                  buttonName: "Message",
                  buttonColor: AppColors.settingsTextActionMainColor,
                  onTab: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MailPage()),
                    );
                  },
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 20),
              ),
            ],
          );
          // } else {
          //   return const SizedBox();
          // }
        },
      ),
      floatingActionButton: Container(
        padding: const EdgeInsets.only(left: 20),
        width: double.maxFinite,
        height: 20,
        child: const Center(
          child: Text(
            '© Kairat Parmanov',
            style: TextStyle(color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  void _historyBlocHandle(BuildContext context, SettingsState state) {
    // if (state is HistoryClean) {
    final settingsBloc = BlocProvider.of<SettingsBloc>(context);
    final historyBloc = BlocProvider.of<HistoryBloc>(context);
    final favoriteBloc = BlocProvider.of<FavoriteBloc>(context);
    final homeBloc = BlocProvider.of<HomeBloc>(context);

    settingsBloc.add(ClearRhymesHistoryEvent(
        notification: state.notification, theme: state.theme));

    historyBloc.add(LoadHistoryRhymes());
    favoriteBloc.add(LoadFavoriteRhymes());
    homeBloc.add(ResetHomePage());
    // BlocProvider.of<HistoryBloc>(context).add(LoadHistoryRhymes());
    // BlocProvider.of<FavoriteBloc>(context).add(LoadFavoriteRhymes());
    // }
  }

  _themeAction(BuildContext context, bool value) async {
    final settingsBloc = BlocProvider.of<SettingsBloc>(context);
    final mainBloc = BlocProvider.of<MainBloc>(context);
    final completer = Completer();
    settingsBloc.add(
        ThemLoadSettingsEvent(theme: value ? "0" : "1", completer: completer));

    await completer.future;
    mainBloc.add(MainEvent());
  }

  // _notificationAction(BuildContext context, bool value) {
  //   final settingsBloc = BlocProvider.of<SettingsBloc>(context);
  //   settingsBloc.add(
  //       NotificationLoadSettingsEvent(notificationValue: value ? "0" : "1"));
  // }
}
