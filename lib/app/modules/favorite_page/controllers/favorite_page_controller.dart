import 'package:get/get.dart';

import '../../../core/styles/style.dart';

class FavoritePageController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: 2);
  }
}
