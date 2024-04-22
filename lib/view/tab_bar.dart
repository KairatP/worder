import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rhyme_me/global/router/router.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({Key? key}) : super(key: key);

  void _onTab(int index, TabsRouter tabsRouter) {
    tabsRouter.setActiveIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AutoTabsRouter(
      routes: const [
        HomeRoute(),
        FavoriteRoute(),
        HistoryRoute(),
        SettingsRoute()
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            showUnselectedLabels: true,
            selectedItemColor: theme.primaryColor,
            unselectedItemColor: theme.hintColor,
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) => _onTab(index, tabsRouter),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                label: "Home",
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: "Favorites"),
              BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: "History",
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: "Settings"),
            ],
          ),
        );
      },
    );
  }
}
