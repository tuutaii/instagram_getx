import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:instagram/app/core/utilities/image.dart';
import 'package:instagram/app/modules/favorite_page/views/favorite_page_view.dart';
import 'package:instagram/app/modules/home_page/views/home_page_view.dart';
import 'package:instagram/app/modules/profile_view/views/profile_view_view.dart';
import 'package:instagram/app/modules/search_view/views/search_view_view.dart';
import 'package:instagram/app/modules/watch_page/views/watch_page_view.dart';

import '../../../core/styles/style.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: const [
          HomePageView(),
          SearchViewView(),
          WatchPageView(),
          FavoritePageView(),
          ProfileViewView(),
        ],
      ),
      bottomNavigationBar: const _BottomNavigationBuilder(),
    );
  }
}

class _BottomNavigationBuilder extends GetView<DashboardController> {
  const _BottomNavigationBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        selectedItemColor: context.onSurface,
        unselectedItemColor: context.onSurface.withOpacity(.5),
        onTap: controller.changeTabIndex,
        currentIndex: controller.tabIndex.value,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              controller.tabIndex.value == 0
                  ? AppImage.iconHomeFill
                  : AppImage.iconHome,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              controller.tabIndex.value == 1
                  ? AppImage.iconSearchFill
                  : AppImage.iconSearch,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppImage.iconWatch,
              color: controller.tabIndex.value == 2
                  ? context.onSurface
                  : context.onSurface.withOpacity(.5),
            ),
            label: 'Watch',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              controller.tabIndex.value == 3
                  ? AppImage.iconHeartFill
                  : AppImage.iconHeart,
            ),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              height: 30,
              child: Image.asset(AppImage.avt),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
