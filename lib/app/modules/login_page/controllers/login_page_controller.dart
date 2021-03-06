import 'package:get/get.dart';
import 'package:instagram/app/services/auth_services/auth_service.dart';

import '../../../core/styles/style.dart';
import '../../../routes/app_pages.dart';

class LoginPageController extends GetxController {
  AuthService get _auth => Get.find();
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
        _auth.login(email.trim(), password.trim());
        Get.toNamed(Routes.welcome);
      });
      WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
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
