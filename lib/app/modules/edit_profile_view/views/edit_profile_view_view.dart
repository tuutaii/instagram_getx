import 'package:get/get.dart';
import 'package:instagram/app/routes/app_pages.dart';
import 'package:instagram/app/widgets/commons/app_button.dart';
import 'package:instagram/app/widgets/commons/input_custom.dart';

import '../../../core/styles/style.dart';
import '../../../core/utilities/image.dart';
import '../controllers/edit_profile_view_controller.dart';

class EditProfileViewView extends GetView<EditProfileViewController> {
  const EditProfileViewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.surface,
        elevation: 1,
        leadingWidth: 70,
        leading: Center(
          child: TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text(
              "Cancel",
              style: context.bodyText2.copyWith(fontSize: 16),
            ),
          ),
        ),
        title: Text(
          "Edit Profile",
          style: context.bodyText1
              .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          Center(
            child: TextButton(
              onPressed: () {
                Get.toNamed(Routes.profilePage);
              },
              child: Text(
                "Done",
                style: context.bodyText1.copyWith(
                    fontSize: 16,
                    color: context.primary,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 45,
                  child: Image.asset(AppImage.avt),
                ),
              ),
              Center(
                child: AppButton(
                  "Change Profile Photo",
                  type: ButtonType.text,
                  fontSize: 13,
                  textColor: context.primary,
                ),
              ),
              const Divider(),
              _FieldInformation(
                title: "Name",
                controller: controller.nameController,
              ),
              _FieldInformation(
                title: "UserName",
                controller: controller.userNameController,
              ),
              _FieldInformation(
                title: "Website",
                controller: controller.webController,
              ),
              _FieldInformation(
                title: "Bio",
                controller: controller.bioController,
                maxlines: 2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    "Switch to Professional Account",
                    style: context.bodyText2
                        .copyWith(fontSize: 15, color: context.primary),
                  ),
                ),
              ),
              Text(
                "Private Information",
                style: context.subtitle2.copyWith(fontSize: 15),
              ),
              const SizedBox(height: 30),
              _FieldInformation(
                title: "Email",
                controller: controller.emailController,
              ),
              _FieldInformation(
                title: "Phone",
                controller: controller.phoneController,
                typeInput: TextInputType.number,
              ),
              _FieldInformation(
                title: "Gender",
                controller: controller.genderController,
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}

class _FieldInformation extends StatelessWidget {
  const _FieldInformation({
    Key? key,
    required this.controller,
    this.title,
    this.typeInput,
    this.maxlines,
  }) : super(key: key);

  final TextEditingController controller;
  final String? title;
  final TextInputType? typeInput;
  final int? maxlines;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title ?? "Empty",
          style: context.bodyText2.copyWith(color: context.onSurface),
        ),
        SizedBox(
          width: 250,
          child: InputCustom(
            controller: controller,
            isUnderBorder: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 14),
            borderSide:
                BorderSide(color: context.onSurface.withOpacity(.5), width: .2),
            inputType: typeInput ?? TextInputType.none,
            maxLines: maxlines ?? 1,
          ),
        ),
      ],
    );
  }
}
