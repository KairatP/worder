part of 'history_bloc.dart';

sealed class HistoryEvent extends Equatable {
  const HistoryEvent();

  @override
  List<Object> get props => [];
}

class LoadHistoryRhymes extends HistoryEvent  {

}

final class ClearRhymesHistory extends HistoryEvent {}