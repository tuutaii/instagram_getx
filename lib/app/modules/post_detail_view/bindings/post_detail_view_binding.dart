import 'package:get/get.dart';

import '../controllers/post_detail_view_controller.dart';

class PostDetailViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostDetailViewController>(
      () => PostDetailViewController(),
    );
  }
}
