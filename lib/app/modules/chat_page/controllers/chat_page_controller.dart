import 'package:get/get.dart';
import 'package:instagram/app/modules/chat_page/models/chat_model.dart';
import 'package:instagram/app/routes/app_pages.dart';

class ChatPageController extends GetxController {
  void toChatDetail(ChatModel e) {
    Get.toNamed(Routes.chatDetailPage,
        arguments: [e.avtUrl, e.time, e.userName, e.content]);
  }
}
