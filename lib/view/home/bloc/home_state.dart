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

// final class RhymesListLoaded extends RhymesListState {
//   const RhymesListLoaded({
//     required this.rhymes,
//     required this.query,
//     required List<FavoriteRhymes> favoriteRhymes,
//   }) : _favoriteRhymes = favoriteRhymes;

//   final String query;
//   final Rhymes rhymes;
//   final List<FavoriteRhymes> _favoriteRhymes;

//   bool isFavorite(String rhyme) {
//     return _favoriteRhymes
//         .where((e) => e.favoriteWord == rhyme && e.queryWord == query)
//         .isNotEmpty;
//   }

//   @override
//   List<Object> get props =>
//       super.props..addAll([rhymes, query, _favoriteRhymes]);

//   RhymesListLoaded copyWith({
//     String? query,
//     Rhymes? rhymes,
//     List<FavoriteRhymes>? favoriteRhymes,
//   }) {
//     return RhymesListLoaded(
//       query: query ?? this.query,
//       rhymes: rhymes ?? this.rhymes,
//       favoriteRhymes: favoriteRhymes ?? _favoriteRhymes,
//     );
//   }
// }
