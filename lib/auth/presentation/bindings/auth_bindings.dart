import 'package:get/get.dart';
import 'package:sample_flutter_ddd_getx/auth/application/auth_facade_service.dart';
import 'package:sample_flutter_ddd_getx/auth/presentation/controllers/auth_controller.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(), permanent: true);
    Get.put(AuthFacadeService(), permanent: true);
  }
}
