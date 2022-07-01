import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:instagram/app/core/styles/style.dart';
import 'package:instagram/app/modules/chat_page/models/chat_model.dart';
import 'package:instagram/app/routes/app_pages.dart';
import '../../../core/utilities/image.dart';
import '../../../widgets/commons/app_button.dart';
import '../../../widgets/commons/circle_avatar.dart';
import '../../../widgets/commons/input_custom.dart';
import '../controllers/chat_page_controller.dart';

class ChatPageView extends GetView<ChatPageController> {
  const ChatPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.surface,
        automaticallyImplyLeading: false,
        elevation: .5,
        leading: BackButton(
          color: context.onSurface,
          onPressed: () {
            Get.back();
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppButton(
              "tuutaii",
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
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add,
              color: context.onSurface,
              size: 30,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              Container(
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
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                children: [
                  ...listChat
                      .map((e) => InkWell(
                          onTap: () {
                            controller.toChatDetail(e);
                          },
                          child: _ChatDetailWidget(chatModel: e)))
                      .toList(),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
            bottom: context.mediaQueryViewPadding.bottom > 0 ? 20 : 0),
        child: AppButton(
          "Camera",
          icon: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Image.asset(
              AppImage.cameraBlue,
              height: 20,
            ),
          ),
          textColor: context.primary,
          color: context.surface,
          elevation: 0,
          borderRadius: 0,
          onPressed: () {
            Get.toNamed(Routes.cameraPage);
          },
        ),
      ),
    );
  }
}

class _ChatDetailWidget extends StatelessWidget {
  const _ChatDetailWidget({
    Key? key,
    required this.chatModel,
  }) : super(key: key);
  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: SizedBox(
        height: 60,
        child: ListTile(
          horizontalTitleGap: 10,
          isThreeLine: false,
          leading: CustomCircleAvatar(chatModel.avtUrl),
          contentPadding: EdgeInsets.zero,
          title: Text(
            chatModel.userName,
            style: context.subtitle2,
          ),
          subtitle: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  chatModel.content,
                  style: context.bodyText2.copyWith(
                    fontSize: 13,
                    overflow: TextOverflow.ellipsis,
                    color: context.onSurface.withOpacity(.5),
                  ),
                  maxLines: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0, left: 6.0),
                child: Text(
                  chatModel.time,
                  style: context.bodyText2.copyWith(
                    fontSize: 13,
                    color: context.onSurface.withOpacity(.5),
                  ),
                ),
              ),
            ],
          ),
          trailing: InkWell(
            onTap: () {
              Get.toNamed(Routes.cameraPage);
            },
            child: SvgPicture.asset(
              AppImage.iconCamera,
              color: context.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}

class CircleAvatarCustom extends StatelessWidget {
  const CircleAvatarCustom({
    Key? key,
    required this.avtUrl,
  }) : super(key: key);
  final String avtUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.0,
      height: 60.0,
      decoration: BoxDecoration(
        border: Border.all(color: context.dividerColor, width: 1),
        shape: BoxShape.circle,
      ),
      child: CircleAvatar(
        backgroundColor:
            Get.isDarkMode ? Colors.white.withOpacity(.8) : Colors.white,
        child: CircleAvatar(
          radius: 60 / 2.5,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage(
            avtUrl,
          ),
        ),
      ),
    );
  }
}
