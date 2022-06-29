import 'package:get/get.dart';
import 'package:instagram/app/core/styles/style.dart';
import 'package:instagram/app/modules/profile_view/controllers/profile_view_controller.dart';

class PostDetailViewController extends GetxController {
  static ProfileViewController get find => Get.find();
  var scrollController = PageController(initialPage: Get.arguments as int);
}
