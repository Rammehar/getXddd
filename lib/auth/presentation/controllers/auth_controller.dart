import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sample_flutter_ddd_getx/auth/application/auth_facade_service.dart';
import 'package:sample_flutter_ddd_getx/auth/domain/entities/user.dart';

enum AuthState { unknown, unAuthenticated, authenticated }

class AuthController extends GetxController {
  late AuthFacadeService _authFacadeService;
  final store = GetStorage();

  //for sign-in form and sign up form
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool isLoading = false.obs;
  final _authState = AuthState.unknown.obs;

  Rxn<User> user = Rxn<User>();

  @override
  void onInit() {
    _authFacadeService = Get.find<AuthFacadeService>();
    super.onInit();
  }

  @override
  void onReady() async {
    //check app start
    _getAuthenticatedUser();

    //used to redirect
    ever(_authState, (aStatus) {
      if (aStatus == AuthState.authenticated) {
        Get.offAndToNamed("/posts");
      } else {
        Get.offAndToNamed("/sign-in");
      }
    });
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  //Method to handle user sign in using email and password
  Future<void> signInWithEmailAndPassword() async {
    showLoading();
    try {
      final _user = await _authFacadeService.signInWithEmailAndPassword(
        emailController.text.trim(),
        passwordController.text.trim(),
      );
      user = Rxn(_user);
      emailController.clear();
      passwordController.clear();
      _authState.value = AuthState.authenticated;
      //store in local storage
      //await store.write('authState', "AuthState.authenticated");
      hideLoading();
    } catch (error) {
      _authState.value = AuthState.unAuthenticated;
      hideLoading();
      Get.snackbar('Sign In Error', 'Something Went Wrong',
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 7),
          backgroundColor: Get.theme.snackBarTheme.backgroundColor,
          colorText: Get.theme.snackBarTheme.actionTextColor);
    }
  }

  // User registration using email and password
  registerWithEmailAndPassword() async {
    showLoading();
    try {
      final _user = await _authFacadeService.signInWithEmailAndPassword(
        emailController.text.trim(),
        passwordController.text.trim(),
      );
      user = Rxn(_user);
      emailController.clear();
      passwordController.clear();
      _authState.value = AuthState.authenticated;
      //store in local storage
      //await store.write('authState', "AuthState.authenticated");

      hideLoading();
    } catch (error) {
      _authState.value = AuthState.unAuthenticated;
      hideLoading();
      Get.snackbar('Sign In Error', 'Something Went Wrong',
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 7),
          backgroundColor: Get.theme.snackBarTheme.backgroundColor,
          colorText: Get.theme.snackBarTheme.actionTextColor);
    }
  }

  // Sign out
  Future<void> signOut() async {
    final status = await _authFacadeService.signOut();
    if (status) {
      await store.remove('authState');
      _authState.value = AuthState.unAuthenticated;
    }
  }

  showLoading() {
    isLoading.toggle();
  }

  hideLoading() {
    isLoading.toggle();
  }

  void _getAuthenticatedUser() async {
    await Future.delayed(Duration(seconds: 2));
    final response = await store.read('authState');
    if (response != null && response == "AuthState.authenticated") {
      _authState.value = AuthState.authenticated;
    } else {
      _authState.value = AuthState.unAuthenticated;
    }
  }
}
