import 'package:flutter/material.dart';

import 'common/config/constants.dart';
import 'common/config/flavor_config.dart';
import 'my_app.dart';

void main() {
  FlavorConfig(
      flavor: Flavor.dev,
      color: Colors.green,
      values: FlavorValues(baseUrl: devBaseUrl));

  runApp(MyApp());
}
