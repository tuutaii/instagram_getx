import 'package:get/get.dart';
import 'package:instagram/app/core/styles/style.dart';

class MainPageController extends GetxController {
  var pageController = PageController();
  var imageCtr = PageController();
  final itemKey = GlobalKey();
  OverlayState? overlayState;
  OverlayEntry? overlayEntry;
  final isLike = false.obs;

  var tabIndex = 0.obs;
  var current = 0.obs;

  // void onDoubleTapLike() {
  //   overlayState = Overlay.of(itemKey.currentContext!);
  //   isLike.toggle();
  //   WidgetsBinding.instance.addPostFrameCallback(
  //     (timeStamp) async {
  //       overlayEntry = OverlayEntry(
  //         builder: (context) {
  //           return Positioned.fill(
  //             child: HeartAnimation(
  //               child: isLike.value
  //                   ? const Icon(
  //                       CupertinoIcons.heart_fill,
  //                       color: Colors.white,
  //                       size: 100,
  //                     )
  //                   : const Icon(
  //                       CupertinoIcons.heart_fill,
  //                       color: Colors.red,
  //                       size: 100,
  //                     ),
  //             ),
  //           );
  //         },
  //       );
  //       overlayState?.insert(
  //         overlayEntry!,
  //       );
  //       await 0.4.delay();
  //       overlayEntry?.remove();
  //       overlayEntry = null;
  //     },
  //   );
  // }

  void updateIndex(int index) {
    current(index);
  }

  void changeTabIndex(int index) {
    tabIndex.value = index;
    pageController.jumpToPage(index);
    if (index == 2) {
      Get.changeTheme(ThemeData.dark());
    } else {
      Get.changeTheme(ThemeData.light());
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    imageCtr.dispose();
    super.dispose();
  }
}
