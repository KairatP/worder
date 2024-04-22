part of 'rhyme_page_bloc.dart';

sealed class RhymePageState{
  const RhymePageState();

  List<Object> get props => [];
}

final class RhymePageInitial extends RhymePageState {}

final class HomeLoading extends RhymePageState {}

final class RhymePageDataLoaded extends RhymePageState {
  const RhymePageDataLoaded({
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

final class RhymePageStateFailure extends RhymePageState {
  const RhymePageStateFailure(this.error);

  final Object error;

  @override
  List<Object> get props => super.props..add(error);
}
