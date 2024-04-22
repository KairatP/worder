import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rhyme_me/global/repository/realm_rhymes_db/db_helper_interface.dart';

part 'rhyme_page_event.dart';
part 'rhyme_page_state.dart';

class RhymePageBloc extends Bloc<RhymePageEvent, RhymePageState> {
  final DbHelperInterface historyRepository;

  RhymePageBloc({
    required this.historyRepository,
  }) : super(RhymePageInitial()) {
    on<SearchRhymes>(_onSeasrchRhymes);
    on<ToggleFavoriteRhymesRhymePage>(_onToggleFavorite);
  }

  Future<void> _onSeasrchRhymes(
      SearchRhymes event, Emitter<RhymePageState> emit) async {
    try {
      emit(HomeLoading());
      // Get rhyme from local database
      final getRhyme = await historyRepository.getRhyme(event.query);

      // Emit the loaded state with the data fetched from the API
      emit(RhymePageDataLoaded(
          searchWord: getRhyme!.word,
          rhymes: getRhyme.words,
          isFavorite: getRhyme.isFavorite));
    } catch (e) {
      // Handle errors by emitting a failure state
      emit(RhymePageStateFailure(e.toString()));
    }
  }

  Future<void> _onToggleFavorite(
    ToggleFavoriteRhymesRhymePage event,
    Emitter<RhymePageState> emit,
  ) async {
    // print(event.isFavorite);
    try {
      final updateRhyme = await historyRepository.getUpdateFavoriteRhymesList(
          event.searchWord, event.favoriteWord, event.isFavorite);

      // Emit the loaded state with the data fetched from the API
      emit(RhymePageDataLoaded(
          searchWord: updateRhyme!.word,
          rhymes: updateRhyme.words,
          isFavorite: updateRhyme.isFavorite));
    } catch (e) {
      // Handle errors by emitting a failure state
      emit(RhymePageStateFailure(e.toString()));
    } finally {
      event.completer?.complete();
    }
  }
}
