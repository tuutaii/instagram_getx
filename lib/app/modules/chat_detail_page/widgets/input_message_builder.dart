import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/styles/style.dart';
import '../../../core/utilities/image.dart';
import '../../../widgets/commons/input_custom.dart';
import '../controllers/chat_detail_page_controller.dart';

class InputMessageBuilder extends StatelessWidget {
  const InputMessageBuilder({
    Key? key,
  }) : super(key: key);

  ChatDetailPageController get controller => Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InputCustom(
        controller: controller.textCtr,
        isShowBorder: true,
        isShowPrefixIcon: true,
        isShowSuffixIcon: true,
        radius: 30,
        hintText: "Message.....",
        hintStyle: context.bodyText2.copyWith(
          fontSize: 15,
          color: context.onSurface.withOpacity(.5),
        ),
        borderSide: BorderSide(
          color: context.onSurface.withOpacity(.5),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
        constraintPrefixWidth: 50,
        prefixIcon: Obx(
          () => controller.checkEmpty.value
              ? const Icon(
                  CupertinoIcons.search_circle_fill,
                  size: 35,
                )
              : SvgPicture.asset(
                  AppImage.iconTakePicture,
                  fit: BoxFit.fitHeight,
                  color: context.primary,
                ),
        ),
        onChanged: controller.onChange,
        suffixIcon: Obx(
          () => controller.checkEmpty.value
              ? InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Text(
                      "Send",
                      style: context.bodyText1.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: context.primary),
                    ),
                  ),
                )
              : Row(
                  children: [
                    Icon(
                      CupertinoIcons.mic,
                      size: 25,
                      color: context.onSurface,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(
                        Icons.image_outlined,
                        size: 25,
                        color: context.onSurface,
                      ),
                    ),
                    Icon(
                      CupertinoIcons.smiley,
                      size: 25,
                      color: context.onSurface,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
