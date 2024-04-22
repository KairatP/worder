part of 'rhyme_page_bloc.dart';

sealed class RhymePageEvent {
  const RhymePageEvent();

  List<Object?> get props => [];
}

class SearchRhymes extends RhymePageEvent {
  const SearchRhymes({required this.query});

  final String query;

  @override
  List<Object?> get props => super.props..addAll([query]);
}

class ToggleFavoriteRhymesRhymePage extends RhymePageEvent {
  const ToggleFavoriteRhymesRhymePage({
    // required this.rhymes,
    required this.searchWord,
    required this.favoriteWord,
    required this.isFavorite,
    this.completer,
  });

  final String searchWord;
  final String favoriteWord;
  final bool isFavorite;
  // final RhymesModel rhymes;
  final Completer? completer;

  @override
  List<Object?> get props =>
      super.props..addAll([favoriteWord, searchWord, isFavorite, completer]);
}

class ResetRhymePage extends RhymePageEvent {
  
}
