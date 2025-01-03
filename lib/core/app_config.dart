enum Environment { development, production }

class AppConfig {
  final Environment environment;

  AppConfig._(this.environment);

  static late AppConfig _instance;

  static void initialize(Environment env) {
    _instance = AppConfig._(env);
  }

  static AppConfig get instance => _instance;

  String get baseUrl {
    switch (environment) {
      case Environment.development:
        return "https://jsonplaceholder.typicode.com";
      case Environment.production:
        return "https://jsonplaceholder.typicode.com";
      default:
        return "https://jsonplaceholder.typicode.com";
    }
  }
}
