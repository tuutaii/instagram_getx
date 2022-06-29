import '../../../core/utilities/image.dart';

class ProfileStoryModel {
  final String imgUrl;
  final String description;

  ProfileStoryModel(this.imgUrl, this.description);
}

List<ProfileStoryModel> profileStory = [
  ProfileStoryModel(AppImage.str1, "Friends"),
  ProfileStoryModel(AppImage.str2, "Work"),
  ProfileStoryModel(AppImage.str3, "Sport"),
  ProfileStoryModel(AppImage.str4, "Game"),
  ProfileStoryModel(AppImage.str5, "Home"),
];
