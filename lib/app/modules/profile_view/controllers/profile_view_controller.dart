import 'package:get/get.dart';

import '../../../core/styles/style.dart';
import '../../../routes/app_pages.dart';

class ProfileViewController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  var tabIndex = 0.obs;
  final isVisibility = false.obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: 2);
    tabController.addListener(() {});
  }

  void changeTabIndex(int index) {
    tabIndex.value = index;
    tabController.animateTo(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void updateIndex(bool isClick) {
    isVisibility(isClick);
  }

  void toDetail(int index) {
    Get.toNamed(
      Routes.postDetailPage,
      arguments: index,
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
