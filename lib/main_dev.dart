import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'common/config/constants.dart';
import 'common/config/flavor_config.dart';
import 'core/controllers/theme_controller.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Get.put<ThemeController>(ThemeController());

  FlavorConfig(
    flavor: Flavor.dev,
    color: Colors.green,
    values: FlavorValues(baseUrl: devBaseUrl),
  );
  runApp(MyApp());
}
