abstract class SettingsRepositoryInterface {
  String getTheme();
  Future<void> setTheme(String themeType);
  String getNotificationValue();
  Future<void> setNotificationValue(String themeType);
}
