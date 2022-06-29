import 'package:instagram/app/core/utilities/image.dart';

enum ChatMessageType { text, audio, image, video }

enum MessageStatus { notView, viewed, notSend }

class ChatMessage {
  final String avtUrl, userName, content;
  final ChatMessageType messageType;
  final MessageStatus messageStatus;
  final bool isSender;
  ChatMessage(
    this.avtUrl,
    this.userName,
    this.content,
    this.messageType,
    this.messageStatus,
    this.isSender,
  );
}

List<ChatMessage> chatMessages = [
  ChatMessage(
    AppImage.avt,
    "neymar_JR",
    "Hello Bro, How are you to day",
    ChatMessageType.text,
    MessageStatus.notView,
    true,
  ),
  ChatMessage(
    AppImage.avt1,
    "leonel_Messi",
    "Hello Bro, I'm fine thanks, and you ?? Hello Bro, I'm fine thanks, and you ??  Hello Bro, I'm fine thanks, and you ??  Hello Bro, I'm fine thanks, and you ?? ",
    ChatMessageType.text,
    MessageStatus.notView,
    false,
  ),
  ChatMessage(
    AppImage.avt,
    "neymar_JR",
    "Hello Bro, How are you to day",
    ChatMessageType.text,
    MessageStatus.notView,
    true,
  ),
  ChatMessage(
    AppImage.avt,
    "neymar_JR",
    "Hello Bro, How are you to day",
    ChatMessageType.text,
    MessageStatus.notView,
    true,
  ),
  ChatMessage(
    AppImage.avt,
    "neymar_JR",
    "Hello Bro, How are you to day",
    ChatMessageType.text,
    MessageStatus.notView,
    true,
  ),
];
