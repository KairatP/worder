import 'package:shared_preferences/shared_preferences.dart';

import 'settings_repository_interface.dart';

class SettingsRepository implements SettingsRepositoryInterface {
  SettingsRepository({required this.preference});

  final SharedPreferences preference;
  static const _themeSelected = 'theme_selected';
  static const _notificationSelected = 'notification_selected';

  @override
  String getTheme() {
    final selected = preference.getString(_themeSelected);
    return selected ?? "0";
  }

  @override
  Future<void> setTheme(String themeType) async {
    await preference.setString(_themeSelected, themeType);
  }

  @override
  String getNotificationValue() {
    final selected = preference.getString(_notificationSelected);
    return selected ?? "1";
  }

  @override
  Future<void> setNotificationValue(String themeType) async {
    await preference.setString(_notificationSelected, themeType);
  }
}
