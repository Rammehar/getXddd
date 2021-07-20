import 'package:sample_flutter_ddd_getx/auth/domain/entities/user.dart';

abstract class UserInterface {
  Future<User> appStarted();
  Future<User> signInWithEmailAndPassword(String email, String password);
  Future<User> signUpWithEmailAndPassword(
      String name, String email, String password);
  Future<bool> signOut();
}
