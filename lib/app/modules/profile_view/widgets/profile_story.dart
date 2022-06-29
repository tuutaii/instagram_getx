import 'package:get/get.dart';

import '../../../core/styles/style.dart';
import '../models/profile_story.dart';

class ProfileStory extends StatelessWidget {
  const ProfileStory({
    Key? key,
    required this.profileStoryModel,
  }) : super(key: key);

  final ProfileStoryModel profileStoryModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  border: Border.all(color: context.dividerColor, width: 1),
                  shape: BoxShape.circle,
                ),
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                child: CircleAvatar(
                  backgroundColor: Get.isDarkMode
                      ? Colors.white.withOpacity(.8)
                      : Colors.white,
                  child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Image.asset(profileStoryModel.imgUrl)),
                ),
              ),
              Text(
                profileStoryModel.description,
                style: context.bodyText1.copyWith(fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
