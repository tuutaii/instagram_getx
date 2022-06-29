import 'package:get/get.dart';

import '../../../core/styles/style.dart';

class ChatDetailPageController extends GetxController {
  var data = Get.arguments;
  final textCtr = TextEditingController();
  String get text => textCtr.text;

  final checkEmpty = false.obs;

  onChange(String value) {
    value = text;
    if (value.isNotEmpty) {
      checkEmpty.value = true;
    } else {
      checkEmpty.value = false;
    }
  }
}
