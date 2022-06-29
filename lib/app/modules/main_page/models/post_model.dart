import 'package:get/get.dart';
import 'package:instagram/app/core/utilities/image.dart';

class PostModel extends GetxController {
  final String avtUrl, caption, userName, location;
  final List<String> imgUrl;
  final RxBool isLike;
  PostModel(this.avtUrl, this.userName, this.location, this.imgUrl,
      this.caption, this.isLike);
}

List<PostModel> listPost = [
  PostModel(
      AppImage.avt,
      "tuutaii",
      "HCM",
      [
        AppImage.neymar,
        AppImage.avtNeymar,
      ],
      " There are players that try to imitate others, but at free-kick time it is a personal thing",
      false.obs),
  PostModel(
      AppImage.avt1,
      "cotd_123",
      "HA NOI",
      [AppImage.neymar2],
      " There is no pressure when you are making a dream come true.",
      false.obs),
  PostModel(
      AppImage.avtNeymar1,
      "neymar_jr",
      "BRAZIL",
      [AppImage.neymar3],
      " The secret is to believe in your dreams; in your potential that you can be like your star, keep searching, keep believing and do not lose faith in yourself.",
      false.obs),
  PostModel(
      AppImage.avtNeymar1,
      "neymar_jr",
      "BRAZIL",
      [AppImage.neymarStory],
      " The secret is to believe in your dreams; in your potential that you can be like your star, keep searching, keep believing and do not lose faith in yourself.",
      false.obs),
];
