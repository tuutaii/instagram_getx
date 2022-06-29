import 'package:get/get.dart';

import '../../../core/styles/style.dart';
import '../../main_page/models/post_model.dart';
import '../../main_page/widgets/post_record.dart';
import '../controllers/post_detail_view_controller.dart';

class PostDetailViewView extends GetView<PostDetailViewController> {
  const PostDetailViewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.surface,
        leadingWidth: 30,
        title: Text('Post', style: context.subtitle2.copyWith(fontSize: 20)),
        centerTitle: false,
        elevation: .5,
        leading: BackButton(
          color: context.onSurface,
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SafeArea(
        child: PageView(
          controller: controller.scrollController,
          scrollDirection: Axis.vertical,
          children: [
            ...listPost
                .map(
                  (e) => PostNewFeed(
                    postModel: e,
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
