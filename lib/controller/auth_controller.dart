import 'package:get/get.dart';

class AuthController extends GetxController {
  var isLoginActive = true.obs;

  void toggleLogin() {
    isLoginActive.value = !isLoginActive.value;
  }
}