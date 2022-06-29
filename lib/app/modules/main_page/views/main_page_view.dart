import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:instagram/app/core/utilities/image.dart';
import 'package:instagram/app/modules/favorite_page/views/favorite_page_view.dart';
import 'package:instagram/app/modules/main_page/views/home_view.dart';
import 'package:instagram/app/modules/profile_view/views/profile_view_view.dart';
import 'package:instagram/app/modules/search_view/views/search_view_view.dart';
import 'package:instagram/app/modules/watch_page/views/watch_page_view.dart';

import '../../../core/styles/style.dart';
import '../controllers/main_page_controller.dart';

class MainPageView extends GetView<MainPageController> {
  const MainPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: const [
          HomeInstagramView(),
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

class _BottomNavigationBuilder extends GetView<MainPageController> {
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
            icon: controller.tabIndex.value == 0
                ? SvgPicture.asset(
                    AppImage.iconHome,
                    color: context.onSurface,
                  )
                : SvgPicture.asset(
                    AppImage.iconHome,
                    color: context.onSurface.withOpacity(.5),
                  ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: controller.tabIndex.value == 1
                ? SvgPicture.asset(AppImage.iconSearch,
                    color: context.onSurface)
                : SvgPicture.asset(
                    AppImage.iconSearch,
                    color: context.onSurface.withOpacity(.5),
                  ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: controller.tabIndex.value == 2
                ? SvgPicture.asset(
                    AppImage.iconWatch,
                    color: context.onSurface,
                  )
                : SvgPicture.asset(
                    AppImage.iconWatch,
                    color: context.onSurface.withOpacity(.5),
                  ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: controller.tabIndex.value == 3
                ? SvgPicture.asset(
                    AppImage.iconHeart,
                    color: context.onSurface,
                  )
                : SvgPicture.asset(
                    AppImage.iconHeart,
                    color: context.onSurface.withOpacity(.5),
                  ),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              height: 30,
              child: Image.asset(AppImage.avt),
            ),
            label: 'Home',
          ),
        ],
      ),
    );
  }
}
