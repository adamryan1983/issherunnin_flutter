import 'package:get/get.dart';
import 'authController.dart';

class InstanceBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<AuthController>(() => AuthController());
  }
}
