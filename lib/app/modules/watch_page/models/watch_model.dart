import 'package:get/state_manager.dart';

import '../../../core/utilities/image.dart';

class WatchModel {
  final String avtUrl, imgUrl, userName, description, userNameTag;
  final RxInt likeCount, cmtCount;
  final RxBool isLike;

  WatchModel(this.avtUrl, this.imgUrl, this.userName, this.description,
      this.userNameTag, this.likeCount, this.cmtCount, this.isLike);
}

List<WatchModel> listWatchModel = [
  WatchModel(AppImage.avt, AppImage.watch1, "Messi Leonel ",
      "neymar_jr and +8 others following ", "", 0.obs, 0.obs, false.obs),
  WatchModel(
      AppImage.avt1,
      AppImage.watch2,
      "Neymar JR ",
      "messi_leo and +10 others following ",
      "neymar_jr",
      10.obs,
      10.obs,
      false.obs),
];
