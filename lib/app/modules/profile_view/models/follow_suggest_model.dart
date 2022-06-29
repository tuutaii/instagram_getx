import '../../../core/utilities/image.dart';

class FollowSuggestModels {
  final String imgUrl;
  final String userName, description;

  FollowSuggestModels(this.imgUrl, this.userName, this.description);
}

List<FollowSuggestModels> listFollowSuggestData = [
  FollowSuggestModels(
      AppImage.avt1, "Messi Leone", "neymar_jr and +8 others following "),
  FollowSuggestModels(
      AppImage.avt2, "Neymar JR", "messi_leo and +10 others following "),
  FollowSuggestModels(
      AppImage.avt3, "Ronaldo", "you and +20 others following "),
];
