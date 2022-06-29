import 'package:get/get.dart';

import '../controllers/watch_page_controller.dart';

class WatchPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WatchPageController>(
      () => WatchPageController(),
    );
  }
}
