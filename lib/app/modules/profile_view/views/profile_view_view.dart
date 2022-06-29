import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:instagram/app/core/utilities/image.dart';
import 'package:instagram/app/modules/main_page/models/post_model.dart';
import 'package:instagram/app/widgets/commons/app_button.dart';

import '../../../core/styles/style.dart';
import '../controllers/profile_view_controller.dart';
import '../models/follow_suggest_model.dart';
import '../models/profile_story.dart';
import '../widgets/bottom_sheet.dart';
import '../widgets/follow_suggest.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_story.dart';

class ProfileViewView extends GetView<ProfileViewController> {
  const ProfileViewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.surface,
        automaticallyImplyLeading: false,
        elevation: 0,
        leadingWidth: 0,
        title: Row(
          children: [
            Icon(Icons.lock, size: 20, color: context.onSurface),
            AppButton(
              Get.arguments,
              type: ButtonType.text,
              textColor: context.onSurface,
              fontSize: 20,
              onPressed: () {},
            ),
            Icon(
              Icons.arrow_drop_down,
              color: context.onSurface,
            ),
          ],
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              Get.bottomSheet(
                const BottomSheetWidget(),
                backgroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              );
            },
            // Get.changeTheme(
            //   Get.isDarkMode ? ThemeData.light() : ThemeData.dark(),
            // );

            icon: Icon(
              Icons.settings,
              color: context.onSurface,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: ProfileHeader(
                imgUrl: AppImage.avt,
                alias: "COTD - on The Mic",
              ),
            ),
            SliverToBoxAdapter(
              child: Obx(
                () => controller.isVisibility.isTrue
                    ? _suggestFollows(context)
                    : _profileStories(),
              ),
            ),
            const SliverPersistentHeader(
              pinned: true,
              delegate: _HeaderDelegate(),
            ),
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 150.0,
                mainAxisSpacing: 3.0,
                crossAxisSpacing: 3.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      controller.toDetail(index);
                    },
                    child: listPost[index].imgUrl.length > 1
                        ? Stack(
                            children: [
                              Positioned.fill(
                                child: Image.asset(
                                  listPost[index].imgUrl.first,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: SvgPicture.asset(AppImage.iconMore),
                                ),
                              ),
                            ],
                          )
                        : Image.asset(
                            listPost[index].imgUrl.first,
                            fit: BoxFit.cover,
                          ),
                  );
                },
                childCount: listPost.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileStories() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SizedBox(
        height: 80,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: [
            ...profileStory
                .map((e) => ProfileStory(profileStoryModel: e))
                .toList(),
          ],
        ),
      ),
    );
  }

  Widget _suggestFollows(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Discovery People",
                style: context.subtitle2,
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  "See All",
                  style: context.subtitle2.copyWith(color: context.primary),
                ),
              )
            ],
          ),
          SizedBox(
            height: 195,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                ...listFollowSuggestData
                    .map((e) => FollowSuggest(followSuggestModels: e))
                    .toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderDelegate extends SliverPersistentHeaderDelegate {
  const _HeaderDelegate();
  ProfileViewController get controller => Get.find();

  @override
  Widget build(BuildContext context, __, ___) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2.0),
      child: DefaultTabController(
        length: 2,
        child: ColoredBox(
          color: context.surface,
          child: TabBar(
            controller: controller.tabController,
            indicatorColor: context.onSurface,
            onTap: controller.changeTabIndex,
            tabs: [
              Tab(
                icon: SvgPicture.asset(
                  AppImage.iconGrid,
                  color: context.onSurface,
                ),
              ),
              Tab(
                icon: SvgPicture.asset(
                  AppImage.iconPersonal,
                  color: context.onSurface,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 48;

  @override
  double get minExtent => 48;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    throw UnimplementedError();
  }
}
