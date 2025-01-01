enum Flavor {
  dev,
  stg,
  prod,
}

class FlavorConfig {
  final Flavor flavor;
  final String name;
  static FlavorConfig? _instance;

  factory FlavorConfig({
    required Flavor flavor,
    required String name,
  }) {
    _instance ??= FlavorConfig._internal(flavor, name);
    return _instance!;
  }

  FlavorConfig._internal(this.flavor, this.name);

  static FlavorConfig get instance {
    return _instance!;
  }

  static bool isProduction() => _instance?.flavor == Flavor.prod;
  static bool isStaging() => _instance?.flavor == Flavor.stg;
  static bool isDevelopment() => _instance?.flavor == Flavor.dev;
}
