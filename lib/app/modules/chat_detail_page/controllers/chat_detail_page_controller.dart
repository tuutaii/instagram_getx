import 'package:get/get.dart';
import 'package:instagram/app/modules/chat_detail_page/models/content_chat_detail.dart';

import '../../../core/styles/style.dart';

class ChatDetailPageController extends GetxController
    with StateMixin<List<ChatMessage>> {
  var data = Get.arguments;
  final textCtr = TextEditingController();
  String get text => textCtr.text;

  final checkEmpty = false.obs;

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  Future<void> initialData() async {
    try {
      await 1.delay();
      List<ChatMessage> data = chatMessages;
      change(
        data,
        status: data.isNotEmpty ? RxStatus.success() : RxStatus.empty(),
      );
    } catch (e) {
      change(
        null,
        status: RxStatus.error(
          e.toString(),
        ),
      );
    }
  }

  onChange(String value) {
    value = text;
    if (value.isNotEmpty) {
      checkEmpty.value = true;
    } else {
      checkEmpty.value = false;
    }
  }
}
