import 'package:get/get.dart';
import 'package:instagram/app/core/utilities/image.dart';
import 'package:instagram/app/routes/app_pages.dart';
import 'package:instagram/app/widgets/commons/app_button.dart';

import '../../../core/styles/style.dart';
import '../../../widgets/bottom_text.dart';
import '../controllers/welcome_page_controller.dart';

class WelcomePageView extends GetView<WelcomePageController> {
  const WelcomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppImage.logo,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 50.0,
                  bottom: 13,
                ),
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.transparent,
                  child: Image.asset(AppImage.avt),
                ),
              ),
              Text(
                Get.arguments ?? "",
                style: context.bodyText1.copyWith(
                    fontWeight: FontWeight.w600, color: context.onBackground),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 34.0, vertical: 12.0),
                child: AppButton(
                  "Log in",
                  color: context.primary,
                  axisSize: MainAxisSize.max,
                  borderRadius: 5,
                  onPressed: () => Get.offAndToNamed(Routes.mainPage,
                      arguments: Get.arguments),
                ),
              ),
              AppButton(
                "Switch accounts",
                borderRadius: 5,
                textColor: context.primary,
                type: ButtonType.text,
                onPressed: () {
                  Get.offAndToNamed(Routes.login);
                },
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Bottom(),
    );
  }
}
