import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:instagram/app/core/utilities/utils.dart';
import 'package:instagram/app/widgets/commons/input_custom.dart';
import '../../../core/styles/style.dart';
import '../controllers/story_detail_controller.dart';
import '../models/story_model.dart';

class StoryDetailView extends GetView<StoryDetailController> {
  const StoryDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.onBackground,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    PageView.builder(
                      controller: controller.pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: stories.length,
                      itemBuilder: (context, i) {
                        final Story story = stories[i];
                        return GestureDetector(
                          onTapDown: (detail) {
                            controller.onTapDown(detail, story);
                          },
                          child: CachedNetworkImage(
                            imageUrl: story.url,
                            fit: BoxFit.fitHeight,
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10),
                      child: Column(
                        children: [
                          Row(
                            children: stories
                                .asMap()
                                .map((i, e) {
                                  return MapEntry(
                                    i,
                                    Obx(
                                      () => AnimatedBar(
                                        animController:
                                            controller.animController,
                                        position: i,
                                        currentIndex:
                                            controller.currentIndex.value,
                                      ),
                                    ),
                                  );
                                })
                                .values
                                .toList(),
                          ),
                          ListTile(
                            horizontalTitleGap: 0,
                            leading: CircleAvatar(
                              radius: 16,
                              child: Image.asset(AppImage.avtNeymar1),
                            ),
                            title: RichText(
                              textAlign: TextAlign.start,
                              maxLines: 2,
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "Neymar_Jr.",
                                    style: context.subtitle2
                                        .copyWith(color: Colors.white),
                                  ),
                                  TextSpan(
                                    text: ' 3d ',
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {},
                                  ),
                                ],
                              ),
                            ),
                            trailing: CloseButton(
                              color: Colors.white,
                              onPressed: controller.onCloseStory,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Expanded(
                      child: InputCustom(
                        isShowBorder: true,
                        isShowPrefixIcon: true,
                        radius: 30,
                        hintText: "Send Message",
                        hintStyle: context.bodyText2
                            .copyWith(fontSize: 15, color: Colors.white),
                        borderSide: const BorderSide(color: Colors.white),
                        constraintPrefixWidth: 50,
                        prefixIcon: SvgPicture.asset(
                          AppImage.iconTakePicture,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        AppImage.iconSend,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_horiz,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class AnimatedBar extends StatelessWidget {
  final AnimationController animController;
  final int position;
  final int currentIndex;

  const AnimatedBar({
    Key? key,
    required this.animController,
    required this.position,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1.5),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: <Widget>[
                _timeLineBuilder(
                  double.infinity,
                  position < currentIndex
                      ? Colors.white
                      : Colors.white.withOpacity(0.5),
                ),
                position == currentIndex
                    ? AnimatedBuilder(
                        animation: animController,
                        builder: (context, child) {
                          return _timeLineBuilder(
                            constraints.maxWidth * animController.value,
                            Colors.white,
                          );
                        },
                      )
                    : const SizedBox.shrink(),
              ],
            );
          },
        ),
      ),
    );
  }

  _timeLineBuilder(double width, Color color) {
    return Container(
      height: 5.0,
      width: width,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: Colors.black26,
          width: 0.8,
        ),
        borderRadius: BorderRadius.circular(3.0),
      ),
    );
  }
}
