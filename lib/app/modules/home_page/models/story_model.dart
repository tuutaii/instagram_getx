import '../../../core/utilities/image.dart';

class StoryModel {
  final String imgUrl;
  final String userName;
  final bool? isLive;

  StoryModel(this.imgUrl, this.userName, this.isLive);
}

List<StoryModel> listStoryData = [
  StoryModel(AppImage.avt, "neymar_jr", true),
  StoryModel(AppImage.avtNeymar1, "John", true),
  StoryModel(AppImage.avt2, "Cr7", false),
  StoryModel(AppImage.avt3, "Messi", true),
  StoryModel(AppImage.avt1, "tuutaii", false),
  StoryModel(AppImage.avt3, "David", false),
];
