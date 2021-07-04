import 'package:flutter/material.dart';

enum Flavor { dev, prod }

extension SelectedFlavorExtension on Flavor {
  String get flavorName {
    switch (this) {
      case Flavor.dev:
        return "dev";
      case Flavor.prod:
        return "prod";
    }
  }
}

class FlavorValues {
  FlavorValues({required this.baseUrl});
  final String baseUrl;
}

class FlavorConfig {
  final Flavor flavor;
  final String name;
  final Color color;
  final FlavorValues values;

  static FlavorConfig? _instance;

  factory FlavorConfig(
      {required Flavor flavor,
      Color color = Colors.blue,
      required FlavorValues values}) {
    _instance ??=
        FlavorConfig._internal(flavor, flavor.flavorName, color, values);
    return _instance!;
  }

  FlavorConfig._internal(this.flavor, this.name, this.color, this.values);

  static FlavorConfig get instance {
    return _instance!;
  }

  static bool isProduction() => _instance!.flavor == Flavor.prod;

  static bool isDevelopment() => _instance!.flavor == Flavor.dev;
}
