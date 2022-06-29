import 'package:get/get.dart';
import 'package:instagram/app/services/auth_services/auth_controller.dart';

import '../../../core/styles/style.dart';

class LoginPageController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final isLoading = false.obs;

  final emailController = TextEditingController();
  String get email => emailController.text;

  final passwordController = TextEditingController();
  String get password => passwordController.text;

  void trySubmitLogin() {
    final isValid = formKey.currentState!.validate();
    if (isValid) {
      isLoading(true);
      2.delay().whenComplete(() {
        isLoading(false);
        formKey.currentState!.save();
        AuthController.instance.login(email.trim(), password.trim());
      });
    }
  }

  String? emailValidator(String value) {
    if (value.isEmpty || !value.contains('@')) {
      return 'Please enter a valid email address.';
    }
    return null;
  }

  String? passwordValidator(String value) {
    if (value.isEmpty || value.length < 6) {
      return 'Password must be at least 6 characters long.';
    }
    return null;
  }
}
