part of 'favorite_bloc.dart';

sealed class FavoriteState {
  const FavoriteState();

  List<Object> get props => [];
}

final class FavoriteInitial extends FavoriteState {}

final class FavoriteRhymesLoading extends FavoriteState {}

final class FavoriteRhymesLoaded extends FavoriteState {
  const FavoriteRhymesLoaded({required this.items});

  final List<Rhyme> items;

  @override
  List<Object> get props => super.props..add(items);
}

final class NoFavoriteState extends FavoriteState {}

final class FavoriteRhymesFailure extends FavoriteState {
  const FavoriteRhymesFailure(this.error);
  final Object error;

  @override
  List<Object> get props => super.props..add(error);
}


