import 'package:instagram/app/widgets/commons/circle_avatar.dart';

import '../../../core/styles/style.dart';
import '../models/profile_story.dart';

class ProfileStory extends StatelessWidget {
  const ProfileStory({
    Key? key,
    required this.profileStoryModel,
    this.onTap,
  }) : super(key: key);

  final ProfileStoryModel profileStoryModel;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 80,
          child: Column(
            children: [
              CustomCircleAvatar(
                profileStoryModel.imgUrl,
                radius: 25,
              ),
              Text(
                profileStoryModel.description,
                style: context.bodyText1.copyWith(fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
