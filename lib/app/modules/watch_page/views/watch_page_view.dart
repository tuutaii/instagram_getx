import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:instagram/app/modules/watch_page/models/watch_model.dart';
import 'package:instagram/app/routes/app_pages.dart';

import '../../../core/styles/style.dart';
import '../../../core/utilities/image.dart';
import '../../../widgets/commons/app_button.dart';
import '../../main_page/widgets/heart_animation.dart';
import '../controllers/watch_page_controller.dart';

class WatchPageView extends GetView<WatchPageController> {
  const WatchPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: PageView(
          controller: controller.scrollController,
          scrollDirection: Axis.vertical,
          children: [
            ...listWatchModel
                .map(
                  (e) => _WatchDetail(
                    watchModel: e,
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}

class _WatchDetail extends StatelessWidget {
  const _WatchDetail({
    Key? key,
    required this.watchModel,
  }) : super(key: key);
  final WatchModel watchModel;

  void incrementCount() {
    watchModel.isLike.toggle();
    if (watchModel.isLike.isTrue) {
      watchModel.likeCount.value++;
    } else {
      watchModel.likeCount.value--;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          watchModel.imgUrl,
          fit: BoxFit.fitWidth,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "Reels",
                      style: context.subtitle2
                          .copyWith(color: Colors.white, fontSize: 18),
                      maxLines: 2,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.cameraPage);
                    },
                    child: SvgPicture.asset(
                      AppImage.iconCamera,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            color: Colors.transparent,
            elevation: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  horizontalTitleGap: 0,
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(
                    radius: 16,
                    child: Image.asset(watchModel.avtUrl),
                  ),
                  title: Row(
                    children: [
                      Text(
                        watchModel.userName,
                        style: context.subtitle2.copyWith(color: Colors.white),
                      ),
                      AppButton(
                        "Follow",
                        color: Colors.transparent,
                        type: ButtonType.outline,
                        borderColor: Colors.white,
                        borderRadius: 4,
                        height: 23,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: '@n${watchModel.userNameTag}. ',
                          style: TextStyle(
                            color: Colors.white.withOpacity(.5),
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {}),
                      TextSpan(
                        text: watchModel.description,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.equalizer_rounded,
                      color: Colors.white,
                    ),
                    Text(
                      " ghostkiller .",
                      style: context.subtitle2.copyWith(color: Colors.white),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Origin sound",
                        style: context.subtitle2
                            .copyWith(color: Colors.white, fontSize: 13),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20)
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Card(
            color: Colors.transparent,
            elevation: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Obx(
                  () => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      HeartAnimation(
                        child: InkWell(
                          onTap: incrementCount,
                          child: watchModel.isLike.value
                              ? const Icon(
                                  CupertinoIcons.heart_fill,
                                  color: Colors.red,
                                )
                              : const Icon(
                                  CupertinoIcons.heart,
                                  color: Colors.white,
                                ),
                        ),
                        duration: const Duration(milliseconds: 200),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, bottom: 20),
                        child: Text(
                          watchModel.likeCount.toString(),
                          style:
                              context.subtitle2.copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Obx(
                  () => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: SvgPicture.asset(
                          AppImage.iconComment,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, bottom: 10),
                        child: Text(
                          watchModel.cmtCount.toString(),
                          style:
                              context.subtitle2.copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  splashRadius: 10,
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    AppImage.iconSend,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  splashRadius: 10,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                ),
                Container(
                  height: 30.5,
                  width: 30.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  child: Image.asset(AppImage.imagePost),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
