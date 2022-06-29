import 'package:flutter_svg/svg.dart';

import '../../../core/styles/style.dart';
import '../../../core/utilities/image.dart';
import '../../../widgets/commons/app_button.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        Center(
          child: Container(
            height: 5,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppButton(
                  "Setting",
                  icon: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: SvgPicture.asset(
                      AppImage.iconSetting,
                      color: context.onSurface,
                    ),
                  ),
                  type: ButtonType.text,
                  textColor: context.onSurface,
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
                AppButton(
                  "Storage",
                  icon: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: SvgPicture.asset(
                      AppImage.iconStorage,
                      color: context.onSurface,
                    ),
                  ),
                  type: ButtonType.text,
                  textColor: context.onSurface,
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
                AppButton(
                  "Your Activities",
                  icon: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: SvgPicture.asset(
                      AppImage.iconActi,
                      color: context.onSurface,
                    ),
                  ),
                  type: ButtonType.text,
                  textColor: context.onSurface,
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
                AppButton(
                  "QR code",
                  icon: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: SvgPicture.asset(
                      AppImage.iconGrid,
                      color: context.onSurface,
                    ),
                  ),
                  type: ButtonType.text,
                  textColor: context.onSurface,
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
                AppButton(
                  "Saved",
                  icon: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: SvgPicture.asset(
                      AppImage.iconSave,
                      color: context.onSurface,
                    ),
                  ),
                  type: ButtonType.text,
                  textColor: context.onSurface,
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
                AppButton(
                  "Best Friends",
                  icon: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: SvgPicture.asset(
                      AppImage.iconBestFr,
                      color: context.onSurface,
                    ),
                  ),
                  type: ButtonType.text,
                  textColor: context.onSurface,
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
                AppButton(
                  "Favorites",
                  icon: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: SvgPicture.asset(
                      AppImage.iconHeart,
                      color: context.onSurface,
                    ),
                  ),
                  type: ButtonType.text,
                  textColor: context.onSurface,
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
                AppButton(
                  "(COVID-19) Information Centre",
                  icon: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: SvgPicture.asset(
                      AppImage.iconSetting,
                      color: context.onSurface,
                    ),
                  ),
                  type: ButtonType.text,
                  textColor: context.onSurface,
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        )
      ],
    );
  }
}
