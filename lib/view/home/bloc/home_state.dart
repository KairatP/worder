part of 'home_bloc.dart';

sealed class HomeState{
  const HomeState();

  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeDataLoaded extends HomeState {
  const HomeDataLoaded({
    required this.searchWord,
    required this.rhymes,
    required this.isFavorite,
  });

  final String searchWord;
  final List<String> rhymes;
  final List<bool> isFavorite;

  @override
  List<Object> get props => super.props..addAll([searchWord, rhymes, isFavorite]);
}

final class HomeStateFailure extends HomeState {
  const HomeStateFailure(this.error);

  final Object error;

  @override
  List<Object> get props => super.props..add(error);
}
