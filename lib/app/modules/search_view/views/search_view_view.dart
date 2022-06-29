import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:instagram/app/core/utilities/image.dart';
import 'package:instagram/app/widgets/commons/input_custom.dart';

import '../../../core/styles/style.dart';
import '../controllers/search_view_controller.dart';

class SearchViewView extends GetView<SearchViewController> {
  const SearchViewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: context.surface,
        leadingWidth: 0,
        centerTitle: false,
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            color: context.dividerColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: InputCustom(
              hintText: "Search",
              hintStyle: context.subtitle1.copyWith(
                fontSize: 16,
                color: context.onSurface.withOpacity(.5),
              ),
              textAlign: TextAlign.start,
              isShowPrefixIcon: true,
              borderSide: BorderSide.none,
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SvgPicture.asset(
                  AppImage.iconSearch,
                  color: context.onSurface.withOpacity(.5),
                ),
              ),
              fillColor: Colors.transparent,
              contentPadding: const EdgeInsets.only(top: 10),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: SvgPicture.asset(
              AppImage.iconSearchBar,
              color: context.onSurface,
            ),
          ),
        ],
        bottom: TabBar(
          controller: controller.tabController,
          labelColor: context.onBackground,
          indicatorSize: TabBarIndicatorSize.label,
          isScrollable: true,
          indicatorPadding: EdgeInsets.zero,
          labelPadding: const EdgeInsets.symmetric(horizontal: 10),
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.transparent),
          tabs: [
            _TabSearchWidget(
              title: "IGTV",
              icon: SvgPicture.asset(
                AppImage.iconTVSearch,
                color: context.onSurface,
              ),
            ),
            _TabSearchWidget(
              title: "SHOP",
              icon: SvgPicture.asset(
                AppImage.iconShopSearch,
                color: context.onSurface,
              ),
            ),
            const _TabSearchWidget(
              title: "Style",
            ),
            const _TabSearchWidget(
              title: "Sports",
            ),
            const _TabSearchWidget(
              title: "Auto",
            ),
            const _TabSearchWidget(
              title: "Fashion",
            ),
          ],
        ),
      ),
      body: GridView.custom(
        gridDelegate: SliverQuiltedGridDelegate(
          crossAxisCount: 4,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          repeatPattern: QuiltedGridRepeatPattern.inverted,
          pattern: const [
            QuiltedGridTile(2, 2),
            QuiltedGridTile(1, 1),
            QuiltedGridTile(1, 1),
            QuiltedGridTile(1, 2),
          ],
        ),
        childrenDelegate: SliverChildBuilderDelegate(
          (context, index) => Container(
            height: 120.0,
            width: 120.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image:
                    NetworkImage('https://picsum.photos/500/500?random=$index'),
                fit: BoxFit.fill,
              ),
              shape: BoxShape.rectangle,
            ),
          ),
        ),
      ),
    );
  }
}

class _TabSearchWidget extends StatelessWidget {
  const _TabSearchWidget({
    Key? key,
    this.title,
    this.icon,
  }) : super(key: key);
  final String? title;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Tab(
        height: 32,
        child: DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: context.dividerColor, width: 1)),
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: icon ?? const SizedBox.shrink(),
                  ),
                  Text(
                    title ?? "Empty",
                    style:
                        context.subtitle2.copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
