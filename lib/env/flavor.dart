import 'package:try_starter/env/config.dart';

class FlavorSetting {
  FlavorSetting.development() {
    Config.getInstance(
        flavorName: 'development',
        apiBaseUrl: 'https://api.smartschool.var-x.id');
  }

  FlavorSetting.staging() {
    Config.getInstance(
        flavorName: 'staging', apiBaseUrl: 'https://api.smartschool.var-x.id');
  }

  FlavorSetting.production() {
    Config.getInstance(
        flavorName: 'production',
        apiBaseUrl: 'https://api.smartschool.var-x.id');
  }
}
