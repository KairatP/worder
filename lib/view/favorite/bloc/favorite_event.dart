part of 'favorite_bloc.dart';

sealed class FavoriteEvent {
  const FavoriteEvent();

  List<Object> get props => [];
}

final class LoadFavoriteRhymes extends FavoriteEvent {}

final class ToggleFavoriteRhyme extends FavoriteEvent {
  const ToggleFavoriteRhyme({required this.word, required this.rhyme, required this.isFavorite,});

  final String word;
  final String rhyme;
  final bool isFavorite;

  @override
  List<Object> get props => super.props..add([word, rhyme, isFavorite]);
}
