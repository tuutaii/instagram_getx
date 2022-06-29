import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:instagram/app/modules/chat_detail_page/models/content_chat_detail.dart';
import '../../../core/styles/style.dart';
import '../../../core/utilities/image.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/commons/app_button.dart';
import '../../../widgets/commons/input_custom.dart';
import '../controllers/chat_detail_page_controller.dart';

class ChatDetailPageView extends GetView<ChatDetailPageController> {
  const ChatDetailPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.surface,
        automaticallyImplyLeading: false,
        elevation: .5,
        centerTitle: false,
        leading: InkWell(
          onTap: () => Get.back(),
          child: Icon(
            CupertinoIcons.arrow_left,
            color: context.onSurface,
          ),
        ),
        title: ListTile(
          horizontalTitleGap: 0,
          leading: Container(
            width: 30.0,
            decoration: BoxDecoration(
              border: Border.all(color: context.dividerColor, width: 1),
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              backgroundColor:
                  Get.isDarkMode ? Colors.white.withOpacity(.8) : Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: Image.asset(
                  controller.data[0],
                ),
              ),
            ),
          ),
          contentPadding: EdgeInsets.zero,
          title: Text(
            controller.data[2],
            style: context.subtitle2,
          ),
          subtitle: Text(
            controller.data[1],
            style: context.bodyText2.copyWith(
              fontSize: 13,
              overflow: TextOverflow.ellipsis,
              color: context.onSurface.withOpacity(.5),
            ),
            maxLines: 1,
          ),
          trailing: SizedBox(
            width: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Get.toNamed(Routes.cameraPage);
                  },
                  child: Icon(
                    CupertinoIcons.video_camera,
                    color: context.onSurface,
                    size: 35,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(Routes.cameraPage);
                  },
                  child: Icon(
                    CupertinoIcons.info_circle,
                    color: context.onSurface,
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
        ),
        titleSpacing: 0,
      ),
      body: Scaffold(
        bottomNavigationBar: const BottomMessageInput(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 30),
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: context.dividerColor, width: 1),
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        backgroundColor: Get.isDarkMode
                            ? Colors.white.withOpacity(.8)
                            : Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Image.asset(
                            controller.data[0],
                          ),
                        ),
                      ),
                    ),
                    Text(
                      controller.data[2],
                      style: context.subtitle2,
                    ),
                    Text(
                      "${controller.data[2]} . Instagram",
                      style: context.subtitle1.copyWith(
                        fontSize: 14,
                        color: context.onSurface.withOpacity(.6),
                      ),
                    ),
                    Text(
                      "50 Follower . 3 Post",
                      style: context.subtitle1.copyWith(
                        fontSize: 14,
                        color: context.onSurface.withOpacity(.6),
                      ),
                    ),
                    Text(
                      "You guys are following each other on Instagram",
                      style: context.subtitle1.copyWith(
                        fontSize: 14,
                        color: context.onSurface.withOpacity(.6),
                      ),
                    ),
                    Text(
                      "You two follow aa and 25 others",
                      style: context.subtitle1.copyWith(
                        fontSize: 14,
                        color: context.onSurface.withOpacity(.6),
                      ),
                    ),
                    AppButton(
                      "View Profile",
                      height: 25,
                      axisSize: MainAxisSize.min,
                      textColor: context.onSurface,
                      borderRadius: 5,
                      type: ButtonType.outline,
                      borderColor: context.onSurface,
                      onPressed: () {
                        Get.toNamed(Routes.profilePage);
                      },
                    ),
                  ],
                ),
              ),
              Center(
                child: Text(
                  "19:04, 6 May",
                  style: context.bodyText1.copyWith(
                    fontSize: 12,
                    color: context.onSurface.withOpacity(.4),
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: chatMessages.length,
                itemBuilder: (context, index) => MessageWidget(
                  chatMessage: chatMessages[index],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BottomMessageInput extends StatelessWidget {
  const BottomMessageInput({
    Key? key,
  }) : super(key: key);

  ChatDetailPageController get controller => Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: context.mediaQueryViewPadding.bottom > 0 ? 20 : 0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: InputCustom(
          controller: controller.textCtr,
          isShowBorder: true,
          isShowPrefixIcon: true,
          isShowSuffixIcon: true,
          radius: 30,
          hintText: "Message.....",
          hintStyle: context.bodyText2.copyWith(
            fontSize: 15,
            color: context.onSurface.withOpacity(.5),
          ),
          borderSide: BorderSide(
            color: context.onSurface.withOpacity(.5),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
          constraintPrefixWidth: 50,
          prefixIcon: Obx(
            () => controller.checkEmpty.value
                ? const Icon(
                    CupertinoIcons.search_circle_fill,
                    size: 35,
                  )
                : SvgPicture.asset(
                    AppImage.iconTakePicture,
                    fit: BoxFit.fitHeight,
                    color: context.primary,
                  ),
          ),
          onChanged: controller.onChange,
          suffixIcon: Obx(
            () => controller.checkEmpty.value
                ? InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Text(
                        "Send",
                        style: context.bodyText1.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: context.primary),
                      ),
                    ),
                  )
                : Row(
                    children: [
                      Icon(
                        CupertinoIcons.mic,
                        size: 25,
                        color: context.onSurface,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(
                          Icons.image_outlined,
                          size: 25,
                          color: context.onSurface,
                        ),
                      ),
                      Icon(
                        CupertinoIcons.smiley,
                        size: 25,
                        color: context.onSurface,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

class MessageWidget extends StatelessWidget {
  const MessageWidget({
    Key? key,
    required this.chatMessage,
  }) : super(key: key);
  final ChatMessage chatMessage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: chatMessage.isSender
            ? MainAxisAlignment.start
            : MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          chatMessage.isSender
              ? Container(
                  width: 30.0,
                  height: 30.0,
                  margin: const EdgeInsets.only(right: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: context.dividerColor, width: 1),
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    backgroundColor: Get.isDarkMode
                        ? Colors.white.withOpacity(.8)
                        : Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Image.asset(chatMessage.avtUrl),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: chatMessage.isSender
                  ? context.onSurface.withOpacity(.1)
                  : context.primary,
            ),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width / 1.5,
            ),
            child: Text(
              chatMessage.content,
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
