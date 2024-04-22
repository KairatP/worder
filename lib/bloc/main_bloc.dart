import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rhyme_me/global/repository/shared_settings_db/settings_repository_interface.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final SettingsRepositoryInterface themeRepository;
  MainBloc({required this.themeRepository})
      : super(MainInitial(
            themeValue: themeRepository.getTheme() == '0' ||
                    themeRepository.getTheme() == '1'
                ? themeRepository.getTheme()
                : '0')) {
    on<MainEvent>(_onMainEvent);
  }

  FutureOr<void> _onMainEvent(MainEvent event, Emitter<MainState> emit) {
    try {
      final newTheme = themeRepository.getTheme();
      if (newTheme != '0' || newTheme != '1') {
        emit(const MainState(themeValue: '0'));
      }
      emit(MainState(themeValue: newTheme));
    } catch (e) {
      log(e.toString());
    }
  }
}
