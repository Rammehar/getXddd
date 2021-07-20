import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_flutter_ddd_getx/auth/presentation/bindings/auth_bindings.dart';
import 'package:sample_flutter_ddd_getx/posts/presentation/add_post_screen.dart';

import 'auth/presentation/sign_in_screen.dart';
import 'auth/presentation/sign_up_screen.dart';
import 'common/config/app_themes.dart';
import 'core/controllers/theme_controller.dart';
import 'posts/presentation/bindings/post_bindings.dart';
import 'posts/presentation/post_screen.dart';
import 'splash_screen.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    ThemeController.to.getThemeModeFromStore();

    return GetMaterialApp(
      initialBinding: AuthBindings(),
      title: 'GetX Demo',
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.system,
      getPages: AppRoutes.routes,
      initialRoute: "/",
    );
  }
}

class AppRoutes {
  //this is to prevent anyone from instantiating this object
  AppRoutes._();
  static final routes = [
    GetPage(
      name: '/',
      page: () => SplashScreen(),
    ),
    GetPage(
      name: '/sign-in',
      page: () => SignInScreen(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: '/sign-up',
      page: () => SignUpScreen(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: "/posts",
      page: () => PostScreen(),
      binding: PostBindings(),
    ),
    GetPage(
      name: "/add-post",
      page: () => AddPostScreen(),
      binding: PostBindings(),
    ),
  ];
}
