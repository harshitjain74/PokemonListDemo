class Environment {
  const Environment();
  static const bool isProduction = bool.fromEnvironment('dart.vm.product');

  static const String apiUrl = isProduction
      ? 'https://api.production.com'
      : 'https://api.development.com';

  static const String version = '1.0.0';


}