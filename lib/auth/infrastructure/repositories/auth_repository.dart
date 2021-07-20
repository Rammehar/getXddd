import 'package:sample_flutter_ddd_getx/auth/domain/entities/user.dart';
import 'package:sample_flutter_ddd_getx/auth/domain/interface/user_interface.dart';

class AuthRepository implements UserInterface {
  @override
  Future<User> appStarted() {
    throw UnimplementedError();
  }

  @override
  Future<User> signInWithEmailAndPassword(String email, String password) async {
    await Future.delayed(Duration(seconds: 2));

    if (email.toLowerCase() != 'ram@domain.com' || password != 'ram123') {
      throw Exception("Ops!!");
    }
    return User(name: 'Ram Mehar', email: email);
  }

  @override
  Future<bool> signOut() async {
    await Future.delayed(Duration(seconds: 2));
    return true;
  }

  @override
  Future<User> signUpWithEmailAndPassword(
      String name, String email, String password) async {
    await Future.delayed(Duration(seconds: 2));
    return User(name: name, email: email);
  }
}
