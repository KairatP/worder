import 'package:auto_route/auto_route.dart';
import 'package:rhyme_me/view/favorite/favorite_page.dart';
import 'package:rhyme_me/view/history/history_page.dart';
import 'package:rhyme_me/view/home/home_page.dart';
import 'package:rhyme_me/view/settings/settings_page.dart';
import 'package:rhyme_me/view/tab_bar.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: TabBarRoute.page, path: '/', children: [
          AutoRoute(page: HomeRoute.page, path: 'home'),
          AutoRoute(page: FavoriteRoute.page, path: 'favorite'),
          AutoRoute(page: HistoryRoute.page, path: 'history'),
          AutoRoute(page: SettingsRoute.page, path: 'settings')
        ]),
      ];
}
