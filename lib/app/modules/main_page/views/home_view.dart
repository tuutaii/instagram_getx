import 'package:flutter_svg/svg.dart';
import 'package:instagram/app/core/utilities/image.dart';
import 'package:instagram/app/modules/main_page/controllers/main_page_controller.dart';
import 'package:get/get.dart';
import 'package:instagram/app/modules/main_page/models/post_model.dart';
import 'package:instagram/app/routes/app_pages.dart';
import 'package:instagram/app/services/auth_services/auth_controller.dart';

import '../../../core/styles/style.dart';
import '../models/story_model.dart';
import '../widgets/main_story.dart';
import '../widgets/post_record.dart';

class HomeInstagramView extends GetView<MainPageController> {
  const HomeInstagramView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: context.surface,
        leading: IconButton(
          icon: SvgPicture.asset(
            AppImage.iconCamera,
            color: context.onSurface,
          ),
          onPressed: () {
            Get.toNamed(Routes.cameraPage);
          },
        ),
        title: Image.asset(
          AppImage.logo,
          height: 28,
          color: context.onSurface,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              AppImage.iconAdd,
              color: context.onSurface,
            ),
            onPressed: () {
              AuthController.instance.logOut();
            },
          ),
          IconButton(
            icon: SvgPicture.asset(
              AppImage.iconSend,
              color: context.onSurface,
            ),
            onPressed: () {
              Get.toNamed(Routes.chatPage);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 98,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  ...listStoryData
                      .map((e) => MainStory(storyModel: e))
                      .toList(),
                ],
              ),
            ),
            const Divider(),
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              children: [
                ...listPost
                    .map((e) => PostNewFeed(
                          postModel: e,
                        ))
                    .toList(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
