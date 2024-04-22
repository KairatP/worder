import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:rhyme_me/global/injection/injection_container.dart';
import 'package:rhyme_me/global/router/router.dart';
import 'package:rhyme_me/view/favorite/bloc/favorite_bloc.dart';
import 'package:rhyme_me/view/history/bloc/history_bloc.dart';
import 'package:rhyme_me/view/history/rhymes_page/bloc/rhyme_page_bloc.dart';
import 'package:rhyme_me/view/home/bloc/home_bloc.dart';
import 'package:rhyme_me/view/settings/bloc/settings_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bloc/main_bloc.dart';
import 'global/ui_assets/theme/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding();
  await dotenv.load(fileName: ".env");
  final preferences = await SharedPreferences.getInstance();
  await initGetIt(preferences);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              HomeBloc(apiClient: getIt(), historyRepository: getIt()),
        ),
        BlocProvider(
          create: (context) => FavoriteBloc(favoritesRepository: getIt()),
        ),
        BlocProvider(
          create: (context) => HistoryBloc(historyRepository: getIt()),
        ),
        BlocProvider(
          create: (context) => SettingsBloc(
              historyRepository: getIt(), settingsRepository: getIt()),
        ),
        BlocProvider(
          create: (context) => MainBloc(themeRepository: getIt()),
        ),
        BlocProvider(
          create: (context) => RhymePageBloc(historyRepository: getIt()),
        ),
      ],
      child: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            // title: 'Rhymer',
            theme: state.themeValue == '0' ? lightTheme : darkTheme,
            darkTheme: darkTheme,
            routerConfig: _router.config(),
          );
        },
      ),
    );
  }
}
