import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:instagram/app/core/styles/style.dart';

import '../../../core/utilities/image.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_page_controller.dart';
import '../models/post_model.dart';
import '../models/story_model.dart';
import '../widgets/main_story.dart';
import '../widgets/post_record.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
            onPressed: controller.logOut,
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
              height: 110,
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
