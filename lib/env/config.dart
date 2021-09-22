class Config {
  Config({this.apiBaseUrl, this.flavorName});

  final String? flavorName;
  final String? apiBaseUrl;

  static Config? _instance;

  static Config getInstance({
    String? flavorName,
    String? apiBaseUrl,
  }) {
    if (_instance == null) {
      _instance = Config(flavorName: flavorName, apiBaseUrl: apiBaseUrl);
      return _instance!;
    }
    return _instance!;
  }
}
