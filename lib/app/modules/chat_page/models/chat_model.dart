import 'package:instagram/app/core/utilities/image.dart';

class ChatModel {
  final String avtUrl, userName, time, content;
  ChatModel(this.avtUrl, this.userName, this.time, this.content);
}

List<ChatModel> listChat = [
  ChatModel(AppImage.avt, "tuutaii", ".now",
      "There are players that try to imitate others, but at free-kick time it is a personal thing"),
  ChatModel(AppImage.avt1, "cotd_123", ".2h",
      "There is no pressure when you are making a dream come true."),
  ChatModel(AppImage.avtNeymar1, "neymar_jr", ".3h",
      "The secret is to believe in your dreams; in your potential that you can be like your star, keep searching, keep believing and do not lose faith in yourself."),
];
