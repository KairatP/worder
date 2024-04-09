part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class SearchRhymes extends HomeEvent {
  const SearchRhymes({required this.query});

  final String query;

  @override
  List<Object?> get props => super.props..addAll([query]);
}

class ToggleFavoriteRhymes extends HomeEvent {
  const ToggleFavoriteRhymes({
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

class ResetHomePage extends HomeEvent {
  
}
