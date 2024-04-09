import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:worder/repository/db_helper_interface.dart';
import 'package:worder/view/favorite/model/favorite_model.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final DbHelperInterface favoritesRepository;
  FavoriteBloc({required this.favoritesRepository})
      : super(FavoriteInitial()) {
    on<LoadFavoriteRhymes>(_load);
    on<ToggleFavoriteRhyme>(_toggleFavorite);
  }

  Future<void> _load(
    LoadFavoriteRhymes event,
    Emitter<FavoriteState> emit,
  ) async {
    try {
      emit(FavoriteRhymesLoading());
      final rhymes = await favoritesRepository.getFavoriteRhymesList();
      if (rhymes.isEmpty) {
        emit(NoFavoriteState());
      } else {
        final List<Rhyme> presentData = [];

        for (var item in rhymes) {
          for (var i = 0; i < item.words.length; i++) {
            if (item.isFavorite[i] == true) {
              final Rhyme rhyme = Rhyme(
              item.word,
              item.words[i],
              item.isFavorite[i],
            );
            presentData.add(rhyme);
            }
          }
        }
        if (presentData.isEmpty) {
          emit(NoFavoriteState());
        } else {
          emit(FavoriteRhymesLoaded(items: presentData));
        }
      }
    } catch (e) {
      emit(FavoriteRhymesFailure(e));
    }
  }

  Future<void> _toggleFavorite(
    ToggleFavoriteRhyme event,
    Emitter<FavoriteState> emit,
  ) async {
    final rhymes = await favoritesRepository.getUpdatedRhymesList(
        event.word, event.rhyme, event.isFavorite);
    try {
      if (rhymes.isEmpty) {
        emit(NoFavoriteState());
      } else {
        final List<Rhyme> presentData = [];

        for (var item in rhymes) {
          for (var i = 0; i < item.words.length; i++) {
            if (item.isFavorite[i] == true) {
              final Rhyme rhyme = Rhyme(
              item.word,
              item.words[i],
              item.isFavorite[i],
            );
            presentData.add(rhyme);
            }
          }
        }
        if (presentData.isEmpty) {
          emit(NoFavoriteState());
        } else {
          emit(FavoriteRhymesLoaded(items: presentData));
        }
      }
    } catch (e) {
      emit(FavoriteRhymesFailure(e));
    }
  }
}
