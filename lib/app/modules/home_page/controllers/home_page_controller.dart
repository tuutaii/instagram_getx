import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/styles/style.dart';
import '../../../services/auth_services/auth_service.dart';
import '../widgets/heart_animation.dart';

class HomePageController extends GetxController {
  AuthService get _auth => Get.find();
  var imageCtr = PageController();

  final itemKey = GlobalKey();
  OverlayState? overlayState;
  OverlayEntry? overlayEntry;
  final isLike = false.obs;

  var current = 0.obs;

  void updateIndex(int index) {
    current(index);
  }

  void onDoubleTapLike() {
    overlayState = Overlay.of(itemKey.currentContext!);
    isLike.toggle();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        overlayEntry = OverlayEntry(
          builder: (context) {
            return Positioned.fill(
              child: HeartAnimation(
                child: isLike.value
                    ? const Icon(
                        CupertinoIcons.heart_fill,
                        color: Colors.white,
                        size: 100,
                      )
                    : const Icon(
                        CupertinoIcons.heart_fill,
                        color: Colors.red,
                        size: 100,
                      ),
              ),
            );
          },
        );
        overlayState?.insert(
          overlayEntry!,
        );
        await 0.4.delay();
        overlayEntry?.remove();
        overlayEntry = null;
      },
    );
  }

  void logOut() {
    return _auth.logOut();
  }
}
