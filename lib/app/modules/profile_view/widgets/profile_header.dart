import 'package:get/get.dart';
import 'package:instagram/app/modules/main_page/models/post_model.dart';
import 'package:instagram/app/modules/profile_view/controllers/profile_view_controller.dart';
import 'package:instagram/app/routes/app_pages.dart';

import '../../../core/styles/style.dart';
import '../../../core/utilities/image.dart';
import '../../../widgets/commons/app_button.dart';

class ProfileHeader extends GetView<ProfileViewController> {
  const ProfileHeader({
    Key? key,
    this.userName,
    this.alias,
    this.imgUrl,
  }) : super(key: key);
  final String? userName, alias, imgUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 35,
              child: Image.asset(imgUrl ?? AppImage.avt1),
            ),
            Column(
              children: [
                Text(
                  listPost.length.toString(),
                  style:
                      context.subtitle1.copyWith(fontWeight: FontWeight.w600),
                ),
                Text("Posts", style: context.bodyText2)
              ],
            ),
            Column(
              children: [
                Text(
                  "1k",
                  style:
                      context.subtitle1.copyWith(fontWeight: FontWeight.w600),
                ),
                Text("Followers", style: context.bodyText2)
              ],
            ),
            Column(
              children: [
                Text(
                  "2k",
                  style:
                      context.subtitle1.copyWith(fontWeight: FontWeight.w600),
                ),
                Text("Following", style: context.bodyText2)
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Get.arguments ?? "Tài Tàii",
                style: context.subtitle2,
              ),
              Text(alias ?? "my name"),
              Row(
                children: [
                  Expanded(
                    child: AppButton(
                      "Edit Profile",
                      height: 30,
                      axisSize: MainAxisSize.max,
                      textColor: context.onSurface,
                      borderRadius: 5,
                      type: ButtonType.outline,
                      borderColor: context.onSurface,
                      onPressed: () {
                        Get.toNamed(Routes.editProfilePage);
                      },
                    ),
                  ),
                  Obx(
                    () => IconButton(
                      padding: EdgeInsets.zero,
                      splashRadius: 20,
                      onPressed: () {
                        controller.isVisibility.toggle();
                      },
                      icon: controller.isVisibility.isTrue
                          ? const Icon(
                              Icons.person_add_alt_rounded,
                            )
                          : const Icon(Icons.person_add_alt_outlined),
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
