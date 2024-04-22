part of 'settings_bloc.dart';

sealed class SettingsEvent {
  const SettingsEvent();

  List<Object> get props => [];
}

class ClearRhymesHistoryEvent extends SettingsEvent {
  const ClearRhymesHistoryEvent({
    required this.theme,
    required this.notification,
    // required this.appTrack,
  });

  final String theme;
  final String notification;
  // final String appTrack;
}

class LoadSettingsEvent extends SettingsEvent {
  const LoadSettingsEvent({
    required this.theme,
    required this.notification,
    // required this.appTrack,
  });

  final String theme;
  final String notification;
  // final String appTrack;
}

class ThemLoadSettingsEvent extends SettingsEvent {
  const ThemLoadSettingsEvent({
    required this.theme,
    this.completer,
  });
  final String theme;
  final Completer? completer;
}

class NotificationLoadSettingsEvent extends SettingsEvent {
  const NotificationLoadSettingsEvent({
    required this.notificationValue,
  });
  final String notificationValue;
}


