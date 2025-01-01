enum Flavor {
  dev,
  stg,
  prod,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Firebase Auth Dev';
      case Flavor.stg:
        return 'Firebase Auth Stg';
      case Flavor.prod:
        return 'Firebase Auth';
      default:
        return 'title';
    }
  }

}
