import 'package:get/get.dart';
import 'package:sample_flutter_ddd_getx/auth/domain/entities/user.dart';
import 'package:sample_flutter_ddd_getx/auth/infrastructure/repositories/auth_repository.dart';

class AuthFacadeService {
  late AuthRepository authRepository;

  AuthFacadeService() {
    this.authRepository = Get.put(AuthRepository());
  }
  Future<User> signInWithEmailAndPassword(String email, String password) {
    return authRepository.signInWithEmailAndPassword(email, password);
  }

  Future<User> signUpWithEmailAndPassword(
      String name, String email, String password) {
    return authRepository.signUpWithEmailAndPassword(name, email, password);
  }

  Future<bool> signOut() {
    return authRepository.signOut();
  }
}
