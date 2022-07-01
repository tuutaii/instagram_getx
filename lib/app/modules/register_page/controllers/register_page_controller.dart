import 'package:get/get.dart';

import '../../../core/styles/style.dart';
import '../../../services/auth_services/auth_service.dart';

class RegisterPageController extends GetxController {
  AuthService get _auth => Get.find();
  final formKey = GlobalKey<FormState>();
  final isLoading = false.obs;

  final emailController = TextEditingController();
  String get email => emailController.text;

  final nameController = TextEditingController();
  String get name => nameController.text;

  final passwordController = TextEditingController();
  String get password => passwordController.text;

  void trySubmitSignUp() {
    final isValid = formKey.currentState!.validate();
    if (isValid) {
      isLoading(true);
      2.delay().whenComplete(() {
        isLoading(false);
        formKey.currentState!.save();
        _auth.singUp(email.trim(), password.trim(), name);
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
