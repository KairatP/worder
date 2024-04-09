import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:worder/repository/db_helper_interface.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final DbHelperInterface historyRepository;
  SettingsBloc({required this.historyRepository}) : super(SettingsInitial()) {
    on<ClearRhymesHistoryEvent>(_clearRhymesHistory);
    // on<LoadHistoryRhymesEvent>(_load);
  }

  FutureOr<void> _clearRhymesHistory(
      ClearRhymesHistoryEvent event, Emitter<SettingsState> emit) async {
    try {
      await historyRepository.clear();
      emit(HistoryClean());
    } catch (e) {
      log(e.toString());
    }
  }

  // Future<void> _load(
  //   LoadHistoryRhymesEvent event,
  //   Emitter<SettingsState> emit,
  // ) async {
  //   try {
  //     await historyRepository.getRhymesList();
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }
}
