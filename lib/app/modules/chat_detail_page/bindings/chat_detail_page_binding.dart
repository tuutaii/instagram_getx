import 'package:get/get.dart';

import '../controllers/chat_detail_page_controller.dart';

class ChatDetailPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatDetailPageController>(
      () => ChatDetailPageController(),
    );
  }
}
