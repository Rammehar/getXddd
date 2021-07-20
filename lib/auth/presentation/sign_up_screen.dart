import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_flutter_ddd_getx/auth/presentation/controllers/auth_controller.dart';
import 'package:sample_flutter_ddd_getx/common/helpers/validators.dart';

class SignUpScreen extends StatelessWidget {
  final authController = Get.find<AuthController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New User Sign Up"),
      ),
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: authController.nameController,
                  decoration: InputDecoration(hintText: 'Name'),
                  validator: Validator().name,
                  keyboardType: TextInputType.text,
                  onChanged: (value) => null,
                  onSaved: (value) =>
                      authController.nameController.text = value!,
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: authController.emailController,
                  decoration: InputDecoration(hintText: 'Email'),
                  validator: Validator().email,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) => null,
                  onSaved: (value) =>
                      authController.emailController.text = value!,
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: authController.passwordController,
                  decoration: InputDecoration(hintText: 'Password'),
                  validator: Validator().password,
                  obscureText: true,
                  onChanged: (value) => null,
                  onSaved: (value) =>
                      authController.passwordController.text = value!,
                  maxLines: 1,
                ),
                SizedBox(height: 30),
                Obx(() => !authController.isLoading.value
                    ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          onPrimary: Colors.white,
                          primary: Colors.blue,
                          minimumSize: Size(88, 36),
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(2)),
                          ),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            authController.signInWithEmailAndPassword();
                          }
                        },
                        child: Text('Sign Up'),
                      )
                    : CircularProgressIndicator()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
