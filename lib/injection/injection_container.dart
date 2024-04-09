import 'package:get_it/get_it.dart';
import 'package:worder/injection/rhymes_dio.dart';
import 'package:worder/repository/db_helper.dart';
import 'package:worder/repository/db_helper_interface.dart';

import '../api/services/rhymes_service.dart';

GetIt getIt = GetIt.I;

initGetIt() {
  getIt.registerLazySingleton<RhymesDio>(
    () => RhymesDio(),
  );

  getIt.registerLazySingleton<RhymesService>(
    () => RhymesServiceImplementation(rhymesDio: getIt()),
  );

  getIt.registerLazySingleton<DbHelperInterface>(
    () => DbHelper(),
  );
}