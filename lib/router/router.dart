import 'package:auto_route/auto_route.dart';
import 'package:worder/view/favorite/favorite_page.dart';
import 'package:worder/view/home/home_page.dart';
import 'package:worder/view/history/history_page.dart';
import 'package:worder/view/settings/settings_page.dart';
import 'package:worder/view/tab_bar.dart';


part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: TabBarRoute.page, 
      path: '/',
      children: [
        AutoRoute(page: HomeRoute.page, path: 'home'),
        AutoRoute(page: FavoriteRoute.page, path: 'favorite'),
        AutoRoute(page: HistoryRoute.page, path: 'history'),
        AutoRoute(page: SettingsRoute.page, path: 'settings'),
      ]
    ),
  ];
}


// // GENERATED CODE - DO NOT MODIFY BY HAND

// // **************************************************************************
// // AutoRouterGenerator
// // **************************************************************************

// // ignore_for_file: type=lint
// // coverage:ignore-file

// part of 'router.dart';

// abstract class _$AppRouter extends RootStackRouter {
//   // ignore: unused_element
//   _$AppRouter({super.navigatorKey});

//   @override
//   final Map<String, PageFactory> pagesMap = {
//     TabBarRoute.name: (routeData) {
//       return AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: const MyTabBar(),
//       );
//     },
//     FavoriteRoute.name: (routeData) {
//       return AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: const FavoritePage(),
//       );
//     },
//     HistoryRoute.name: (routeData) {
//       return AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: const HistoryPage(),
//       );
//     },
//     HomeRoute.name: (routeData) {
//       return AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: BlocProvider(
//           create: (context) => HomeBloc(apiClient: getIt(), historyRepository: getIt()),
//           child: HomePage(),
//         ),
//       );
//     },
//     SettingsRoute.name: (routeData) {
//       return AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: const SettingsPage(),
//       );
//     },
//   };
// }

// /// generated route for
// /// [MyTabBar]
// class TabBarRoute extends PageRouteInfo<void> {
//   const TabBarRoute({List<PageRouteInfo>? children})
//       : super(
//           TabBarRoute.name,
//           initialChildren: children,
//         );

//   static const String name = 'TabBarRoute';

//   static const PageInfo<void> page = PageInfo<void>(name);
// }

// /// generated route for
// /// [FavoritePage]
// class FavoriteRoute extends PageRouteInfo<void> {
//   const FavoriteRoute({List<PageRouteInfo>? children})
//       : super(
//           FavoriteRoute.name,
//           initialChildren: children,
//         );

//   static const String name = 'FavoriteRoute';

//   static const PageInfo<void> page = PageInfo<void>(name);
// }

// /// generated route for
// /// [HistoryPage]
// class HistoryRoute extends PageRouteInfo<void> {
//   const HistoryRoute({List<PageRouteInfo>? children})
//       : super(
//           HistoryRoute.name,
//           initialChildren: children,
//         );

//   static const String name = 'HistoryRoute';

//   static const PageInfo<void> page = PageInfo<void>(name);
// }

// /// generated route for
// /// [HomePage]
// class HomeRoute extends PageRouteInfo<void> {
//   const HomeRoute({List<PageRouteInfo>? children})
//       : super(
//           HomeRoute.name,
//           initialChildren: children,
//         );

//   static const String name = 'HomeRoute';

//   static const PageInfo<void> page = PageInfo<void>(name);
// }

// /// generated route for
// /// [SettingsPage]
// class SettingsRoute extends PageRouteInfo<void> {
//   const SettingsRoute({List<PageRouteInfo>? children})
//       : super(
//           SettingsRoute.name,
//           initialChildren: children,
//         );

//   static const String name = 'SettingsRoute';

//   static const PageInfo<void> page = PageInfo<void>(name);
// }
