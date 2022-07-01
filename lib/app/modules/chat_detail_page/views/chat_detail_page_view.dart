import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:instagram/app/modules/chat_detail_page/widgets/input_message_builder.dart';
import 'package:instagram/app/modules/chat_detail_page/widgets/message_item_builder.dart';
import '../../../core/styles/style.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/commons/circle_avatar.dart';
import '../controllers/chat_detail_page_controller.dart';
import '../widgets/message_header_builder.dart';

class ChatDetailPageView extends GetView<ChatDetailPageController> {
  const ChatDetailPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBarChatPage(
        avtUrl: controller.data[0],
        userName: controller.data[2],
        time: controller.data[1],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(height: 30),
          Expanded(
            child: ListView(
              reverse: true,
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                controller.obx(
                  (state) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state!.length,
                      itemBuilder: (context, index) => MessageItemBuilder(
                        chatMessage: state[index],
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 400,
                  child: MessageHeader(
                    userName: controller.data[2],
                    avt: controller.data[0],
                  ),
                ),
              ],
            ),
          ),
          const InputMessageBuilder(),
        ],
      ),
    );
  }
}

class _AppBarChatPage extends StatelessWidget with PreferredSizeWidget {
  const _AppBarChatPage({
    Key? key,
    required this.avtUrl,
    required this.userName,
    required this.time,
  }) : super(key: key);
  final String avtUrl, userName, time;

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
        horizontalTitleGap: 5,
        leading: CustomCircleAvatar(
          avtUrl,
          radius: 17,
        ),
        contentPadding: EdgeInsets.zero,
        title: Text(
          userName,
          style: context.subtitle2,
        ),
        subtitle: Text(
          time,
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
