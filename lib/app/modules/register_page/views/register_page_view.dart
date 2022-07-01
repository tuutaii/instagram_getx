import 'package:flutter/gestures.dart';
import 'package:get/get.dart';

import '../../../core/styles/style.dart';
import '../../../core/utilities/image.dart';
import '../../../widgets/commons/app_button.dart';
import '../../../widgets/commons/input_custom.dart';
import '../controllers/register_page_controller.dart';

class RegisterPageView extends GetView<RegisterPageController> {
  const RegisterPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(
          color: context.onBackground,
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: controller.formKey,
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40.0),
                    child: Image.asset(AppImage.logo),
                  ),
                  Text(
                    "Register",
                    style: context.bodyText1
                        .copyWith(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InputCustom(
                      controller: controller.emailController,
                      radius: 5,
                      borderSide: BorderSide(
                        color: context.dividerColor,
                      ),
                      labelText: "Email",
                      validator: (value) {
                        return controller.emailValidator(value!);
                      }),
                  const SizedBox(
                    height: 12.0,
                  ),
                  InputCustom(
                    controller: controller.nameController,
                    radius: 5,
                    borderSide: BorderSide(
                      color: context.dividerColor,
                    ),
                    labelText: "Username",
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  InputCustom(
                    controller: controller.passwordController,
                    radius: 5,
                    borderSide: BorderSide(color: context.dividerColor),
                    labelText: "Password",
                    isPassword: true,
                    isShowSuffixIcon: true,
                    validator: (value) {
                      return controller.passwordValidator(value!);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Obx(
                      () => AppButton(
                        "Sign In",
                        loading: controller.isLoading.value,
                        axisSize: MainAxisSize.max,
                        color: context.primary,
                        borderRadius: 5,
                        onPressed: controller.trySubmitSignUp,
                      ),
                    ),
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Already have an account? ',
                          style: TextStyle(
                            color: context.onSecondary.withOpacity(.5),
                          ),
                        ),
                        TextSpan(
                            text: ' Sign In.',
                            style: context.bodyText2.copyWith(
                                fontWeight: FontWeight.w600,
                                color: context.primary),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Get.back()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
