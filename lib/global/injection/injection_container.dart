import 'package:get_it/get_it.dart';
import 'package:rhyme_me/global/injection/rhymes_dio.dart';
import 'package:rhyme_me/global/repository/realm_rhymes_db/db_helper.dart';
import 'package:rhyme_me/global/repository/realm_rhymes_db/db_helper_interface.dart';
import 'package:rhyme_me/global/repository/shared_settings_db/settings_repository.dart';
import 'package:rhyme_me/global/repository/shared_settings_db/settings_repository_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/services/rhymes_service.dart';

// GetIt getIt = GetIt.I;

// initGetIt() {
//   getIt.registerLazySingleton<RhymesDio>(
//     () => RhymesDio(),
//   );

//   getIt.registerLazySingleton<RhymesService>(
//     () => RhymesServiceImplementation(rhymesDio: getIt()),
//   );

//   getIt.registerLazySingleton<DbHelperInterface>(
//     () => DbHelper(),
//   );

//   getIt.registerSingleton<SettingsRepositoryInterface>(
//     () => SettingsRepository(preference: preference);
//     preference = await SharedPreferences.getInstance();
//   );
// }

// Define a global instance of GetIt for dependency injection
GetIt getIt = GetIt.instance;

initGetIt(SharedPreferences preferences) async {
  // Register RhymesDio as a lazy singleton
  getIt.registerLazySingleton<RhymesDio>(
    () => RhymesDio(),
  );

  // Register RhymesService as a lazy singleton
  getIt.registerLazySingleton<RhymesService>(
    () => RhymesServiceImplementation(rhymesDio: getIt()),
  );

  // Register DbHelper as a lazy singleton
  getIt.registerLazySingleton<DbHelperInterface>(
    () => DbHelper(),
  );

  // Obtain SharedPreferences instance asynchronously

  // Create an instance of SettingsRepository
  final settingsRepository = SettingsRepository(preference: preferences);

  // Register SettingsRepository as a singleton
  getIt.registerSingleton<SettingsRepositoryInterface>(
    settingsRepository,
  );
}
