import 'package:get/get.dart';

import '../../../core/styles/style.dart';
import '../models/content_chat_detail.dart';

class MessageItemBuilder extends StatelessWidget {
  const MessageItemBuilder({
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
