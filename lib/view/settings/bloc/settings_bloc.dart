import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:rhyme_me/global/repository/realm_rhymes_db/db_helper_interface.dart';
import 'package:rhyme_me/global/repository/shared_settings_db/settings_repository_interface.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SettingsRepositoryInterface settingsRepository;
  final DbHelperInterface historyRepository;
  SettingsBloc(
      {required this.historyRepository, required this.settingsRepository})
      : super(SettingsInitial(
          theme: settingsRepository.getTheme(),
          notification: settingsRepository.getNotificationValue(),
        )) {
    on<ClearRhymesHistoryEvent>(_clearRhymesHistory);
    on<LoadSettingsEvent>(_load);
    on<ThemLoadSettingsEvent>(_themLoad);
    on<NotificationLoadSettingsEvent>(_notificationLoad);
  }

  FutureOr<void> _load(LoadSettingsEvent event, Emitter<SettingsState> emit) {
    emit(SettingsState(
      theme: event.theme,
      notification: event.notification,
    ));
  }

  FutureOr<void> _clearRhymesHistory(
      ClearRhymesHistoryEvent event, Emitter<SettingsState> emit) async {
    try {
      await historyRepository.clear();
      // emit(HistoryClean());
      emit(SettingsState(
        theme: event.theme,
        notification: event.notification,
        // appTrack: event.appTrack
      ));
    } catch (e) {
      log(e.toString());
    }
  }

  FutureOr<void> _themLoad(
      ThemLoadSettingsEvent event, Emitter<SettingsState> emit) {
    try {
      settingsRepository.setTheme(event.theme);
      final theme = settingsRepository.getTheme();

      emit(SettingsState(
        theme: theme,
        notification: state.notification,
      ));
    } catch (e) {
      // Handle errors by emitting a failure state
      log(e.toString());
    } finally {
      event.completer?.complete();
    }
  }

  FutureOr<void> _notificationLoad(
      NotificationLoadSettingsEvent event, Emitter<SettingsState> emit) {
    try {
      settingsRepository.setNotificationValue(event.notificationValue);
      final theme = settingsRepository.getNotificationValue();

      emit(SettingsState(
        theme: state.theme,
        notification: theme,
      ));
    } catch (e) {
      log(e.toString());
    }
  }
}
