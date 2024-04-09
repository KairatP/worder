import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:worder/injection/injection_container.dart';
import 'package:worder/router/router.dart';
import 'package:worder/ui_assets/theme/theme.dart';
import 'package:worder/view/favorite/bloc/favorite_bloc.dart';
import 'package:worder/view/history/bloc/history_bloc.dart';
import 'package:worder/view/home/bloc/home_bloc.dart';
import 'package:worder/view/settings/bloc/settings_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding();
  await dotenv.load(fileName: ".env");
  await initGetIt();
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
          create: (context) => HomeBloc(apiClient: getIt(), historyRepository: getIt()),
        ),
        BlocProvider(
          create: (context) => FavoriteBloc(favoritesRepository: getIt()),
        ),
        BlocProvider(
          create: (context) => HistoryBloc(historyRepository: getIt()),
        ),
        BlocProvider(
          create: (context) => SettingsBloc(historyRepository: getIt()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Rhymer',
        theme: themeData,
        routerConfig: _router.config(),
      ),
    );
  }
}
