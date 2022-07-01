import 'package:get/get.dart';
import 'package:instagram/app/core/styles/style.dart';

class DashboardController extends GetxController {
  var pageController = PageController();

  var tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
    pageController.jumpToPage(index);
    if (index == 2) {
      Get.changeTheme(ThemeData.dark());
    } else {
      Get.changeTheme(ThemeData.light());
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
