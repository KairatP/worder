import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:realm/realm.dart';
import 'package:worder/api/services/rhymes_service.dart';
import 'package:worder/repository/db_helper_interface.dart';
import 'package:worder/repository/model/history_rhymes_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final RhymesService apiClient;
  final DbHelperInterface historyRepository;

  HomeBloc({
    required this.apiClient,
    required this.historyRepository,
  }) : super(HomeInitial()) {
    on<SearchRhymes>(_onSearch);
    on<ToggleFavoriteRhymes>(_onToggleFavorite);
    on<ResetHomePage>(_onResetHomePage);
  }

  Future<void> _onSearch(SearchRhymes event, Emitter<HomeState> emit) async {
    try {
      emit(HomeLoading());
      // Get rhyme from local database
      final getRhyme = await historyRepository.getRhyme(event.query);
      if (getRhyme == null || getRhyme.word != event.query) {
        // If the rhyme does not exist in the local database, proceed to fetch from the API
        final getApiRhymes = await apiClient.fetchRhymes(event.query);
        var isFavorite = getApiRhymes.rhymes.map((n) => false).toList();

        // Save data to local database
        final saveData = HistoryRhymesModel(
          Uuid.v4().toString(),
          event.query,
          words: getApiRhymes.rhymes,
          isFavorite: isFavorite,
        );
        await historyRepository.setRhyme(saveData);
      }

      final updateRhyme = await historyRepository.getRhyme(event.query);

      // Emit the loaded state with the data fetched from the API
      emit(HomeDataLoaded(
          searchWord: updateRhyme!.word,
          rhymes: updateRhyme.words,
          isFavorite: updateRhyme.isFavorite));
    } catch (e) {
      // Handle errors by emitting a failure state
      emit(HomeStateFailure(e.toString()));
    }
  }

  Future<void> _onToggleFavorite(
    ToggleFavoriteRhymes event,
    Emitter<HomeState> emit,
  ) async {
    // print(event.isFavorite);
    try {
      final updateRhyme = await historyRepository.getUpdateFavoriteRhymesList(
          event.searchWord, event.favoriteWord, event.isFavorite);

      // Emit the loaded state with the data fetched from the API
      emit(HomeDataLoaded(
          searchWord: updateRhyme!.word,
          rhymes: updateRhyme.words,
          isFavorite: updateRhyme.isFavorite));
    } catch (e) {
      // Handle errors by emitting a failure state
      emit(HomeStateFailure(e.toString()));
      } finally {
        event.completer?.complete();
    }
  }

  // Reset HomePage to initial state
  _onResetHomePage(
    ResetHomePage event,
    Emitter<HomeState> emit,
  ) {
    emit(HomeInitial());
  }
}
