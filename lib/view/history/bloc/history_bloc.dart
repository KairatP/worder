import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rhyme_me/global/repository/realm_rhymes_db/db_helper_interface.dart';
import 'package:rhyme_me/global/repository/realm_rhymes_db/model/history_rhymes_model.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final DbHelperInterface historyRepository;

  HistoryBloc({required this.historyRepository})
      : super(HistoryStateInitial()) {
    on<LoadHistoryRhymes>(_load);
    on<ClearRhymesHistory>(_clear);
  }

  Future<void> _load(
    LoadHistoryRhymes event,
    Emitter<HistoryState> emit,
  ) async {
    try {
      emit(HistoryStateLoading());
      final rhymes = await historyRepository.getRhymesList();
      if (rhymes.isEmpty) {
        emit(NoHistoryState());
      } else {
        emit(HistoryStateLoaded(rhymes: rhymes));
      }
    } catch (e) {
      emit(HistoryStateFailure(e));
    }
  }

  Future<void> _clear(
    ClearRhymesHistory event,
    Emitter<HistoryState> emit,
  ) async {
    try {
      await historyRepository.clear();
      add(LoadHistoryRhymes());
    } catch (e) {
      emit(HistoryStateFailure(e));
    }
  }
}
