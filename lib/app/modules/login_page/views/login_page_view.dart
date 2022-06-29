import 'package:flutter/gestures.dart';

import 'package:get/get.dart';
import 'package:instagram/app/core/utilities/image.dart';
import 'package:instagram/app/widgets/commons/app_button.dart';
import 'package:instagram/app/widgets/commons/input_custom.dart';

import '../../../core/styles/style.dart';
import '../../../widgets/bottom_text.dart';
import '../controllers/login_page_controller.dart';

class LoginPageView extends GetView<LoginPageController> {
  const LoginPageView({Key? key}) : super(key: key);

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
                  InputCustom(
                      controller: controller.emailController,
                      radius: 5,
                      borderSide: BorderSide(
                        color: context.dividerColor,
                      ),
                      validator: (value) {
                        return controller.emailValidator(value!);
                      }),
                  const SizedBox(
                    height: 12.0,
                  ),
                  InputCustom(
                    controller: controller.passwordController,
                    radius: 5,
                    borderSide: BorderSide(color: context.dividerColor),
                    validator: (value) {
                      return controller.passwordValidator(value!);
                    },
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: AppButton(
                      "For get password?",
                      textColor: context.primary,
                      type: ButtonType.text,
                      onPressed: () {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Obx(
                      () => AppButton("Log in",
                          loading: controller.isLoading.value,
                          axisSize: MainAxisSize.max,
                          color: context.primary,
                          borderRadius: 5,
                          onPressed: controller.trySubmitLogin),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.facebook_outlined, color: context.primary),
                      AppButton(
                        "Log in with Facebook",
                        textColor: context.primary,
                        type: ButtonType.text,
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Row(children: [
                    const Expanded(child: Divider()),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 40.0),
                      child: Text(
                        "OR",
                        style: context.bodyText2.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: context.onSecondary.withOpacity(.5),
                        ),
                      ),
                    ),
                    const Expanded(child: Divider()),
                  ]),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Don’t have an account? ',
                          style: TextStyle(
                            color: context.onSecondary.withOpacity(.5),
                          ),
                        ),
                        TextSpan(
                            text: ' Sign up.',
                            style: context.bodyText2.copyWith(
                                fontWeight: FontWeight.w600,
                                color: context.primary),
                            recognizer: TapGestureRecognizer()..onTap = () {}),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const Bottom(
        text: "Instagram от Facebook",
        textOnTap: "",
      ),
    );
  }
}
