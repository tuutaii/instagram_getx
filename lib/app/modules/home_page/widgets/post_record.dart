import 'package:flutter/gestures.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:instagram/app/modules/home_page/controllers/home_page_controller.dart';

import '../../../core/styles/style.dart';
import '../../../core/utilities/image.dart';
import '../models/post_model.dart';
import 'heart_animation.dart';

class PostNewFeed extends GetView<HomePageController> {
  const PostNewFeed({
    Key? key,
    required this.postModel,
  }) : super(key: key);
  final PostModel postModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 60,
          child: ListTile(
            horizontalTitleGap: 10,
            isThreeLine: true,
            leading: CircleAvatar(
              radius: 16,
              child: Image.asset(postModel.avtUrl),
            ),
            minLeadingWidth: 0,
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            title: Row(
              children: [
                Text(
                  postModel.userName,
                  style: context.subtitle2,
                ),
                Icon(
                  Icons.check_circle_rounded,
                  color: context.primary,
                  size: 15,
                )
              ],
            ),
            subtitle: Text(
              postModel.location,
              style: context.bodyText2.copyWith(fontSize: 11),
            ),
            trailing: const Icon(
              Icons.more_horiz,
            ),
          ),
        ),
        postModel.imgUrl.length > 1
            ? Stack(
                children: [
                  SizedBox(
                    key: controller.itemKey,
                    height: 375,
                    child: PageView.builder(
                      physics: const BouncingScrollPhysics(),
                      controller: controller.imageCtr,
                      itemCount: postModel.imgUrl.length,
                      onPageChanged: (index) => controller.updateIndex(index),
                      itemBuilder: (context, index) => Image.asset(
                        postModel.imgUrl[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Obx(
                    () => Positioned(
                      top: 14,
                      right: 14,
                      child: Container(
                        height: 30,
                        width: 40,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: context.onSurface.withOpacity(.5),
                        ),
                        child: Center(
                            child: Text(
                          "${controller.current.value + 1} / ${postModel.imgUrl.length}",
                          style: context.bodyText1.copyWith(
                            color: context.surface,
                            fontSize: 12,
                          ),
                        )),
                      ),
                    ),
                  ),
                ],
              )
            : SizedBox(
                height: 375,
                width: double.infinity,
                child: Image.asset(
                  postModel.imgUrl.first,
                  fit: BoxFit.cover,
                ),
              ),
        postModel.imgUrl.length > 1
            ? Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: postModel.imgUrl
                      .asMap()
                      .entries
                      .map(_itemBuilder)
                      .toList(),
                ),
              )
            : const SizedBox(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => Row(
                  children: [
                    HeartAnimation(
                      child: InkWell(
                        onTap: () {
                          postModel.isLike.toggle();
                        },
                        child: postModel.isLike.value
                            ? SvgPicture.asset(
                                AppImage.iconHeartFill,
                                color: Colors.red,
                              )
                            : SvgPicture.asset(
                                AppImage.iconHeart,
                              ),
                      ),
                      duration: const Duration(milliseconds: 200),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        AppImage.iconComment,
                        color: context.onSurface,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        AppImage.iconSend,
                        color: context.onSurface,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        AppImage.iconSave,
                        color: context.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 10,
                    child: Image.asset(postModel.avtUrl),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Liked by ',
                          style: TextStyle(
                            color: context.onSurface,
                            fontSize: 13,
                          ),
                        ),
                        TextSpan(
                            text: 'tuu_taii',
                            style: TextStyle(
                              color: context.onSurface,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () {}),
                        TextSpan(
                          text: ' and ',
                          style: TextStyle(
                            color: context.onSurface,
                            fontSize: 13,
                          ),
                        ),
                        TextSpan(
                            text: '44,666 others',
                            style: TextStyle(
                              color: context.onSurface,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () {}),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: postModel.userName,
                        style: TextStyle(
                          color: context.onSurface,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {}),
                    TextSpan(
                      text: postModel.caption,
                      style: TextStyle(
                        color: context.onSurface,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
            ],
          ),
        )
      ],
    );
  }

  Widget _itemBuilder(MapEntry<int, dynamic> entry) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
      child: GestureDetector(
        child: Container(
          height: 7,
          width: 7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: (controller.current.value != entry.key
                ? Colors.black.withOpacity(.2)
                : Colors.blue.withOpacity(.5)),
          ),
        ),
      ),
    );
  }
}
