part of 'main_bloc.dart';

class MainState extends Equatable {
  const MainState({required this.themeValue});

  final String themeValue;

  @override
  List<Object> get props => [themeValue];
}

final class MainInitial extends MainState {
  const MainInitial({required super.themeValue});
}
