import 'package:get/get.dart';

import '../../../core/styles/style.dart';

class SearchViewController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  var tabIndex = 0.obs;
  final isVisibility = false.obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: 6);
  }
}
