part of 'history_bloc.dart';

sealed class HistoryState {
  const HistoryState();
  
  List<Object> get props => [];
}

final class HistoryStateInitial extends HistoryState {}

final class HistoryStateLoading extends HistoryState {}

final class NoHistoryState extends HistoryState {}

final class HistoryStateLoaded extends HistoryState {
  const HistoryStateLoaded({required this.rhymes});
  final List<HistoryRhymesModel> rhymes;


  @override
  List<Object> get props => super.props..add(rhymes);
}

final class HistoryStateFailure extends HistoryState {
  const HistoryStateFailure(this.error);

  final Object error;

  @override
  List<Object> get props => super.props..add(error);
}
