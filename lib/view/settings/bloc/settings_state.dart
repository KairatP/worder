part of 'settings_bloc.dart';

class SettingsState {
  const SettingsState(
    { 
    required this.theme,
    required this.notification, 
    // required this.appTrack, 
  }
  );

  final String theme;
  final String notification;
  // final String appTrack;

  List<Object> get props => [];
}

// class SettingsLoadingState extends SettingsState {}



// class SettingsLoaded extends SettingsState {
//   const SettingsLoaded({ 
//     required this.theme,
//     required this.notification, 
//     required this.appTrack, 
//   });

//   final String theme;
//   final String notification;
//   final String appTrack;
// }

class SettingsInitial extends SettingsState {
  SettingsInitial({
    required super.theme, 
    required super.notification, 
    // required super.appTrack
  });
}

// class SettingsStateFailure extends SettingsState {
//   SettingsStateFailure(String string);
// }


// final class HistoryClean extends SettingsState {}
