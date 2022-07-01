import 'package:get/get.dart';

import '../../core/styles/style.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar(
    this.imageUrl, {
    Key? key,
    this.radius = 20,
    this.onTap,
  }) : super(key: key);

  final String imageUrl;
  final double radius;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: radius * 2.3,
        height: radius * 2.3,
        decoration: BoxDecoration(
          border: Border.all(color: context.dividerColor, width: 1),
          shape: BoxShape.circle,
        ),
        child: CircleAvatar(
          backgroundColor:
              Get.isDarkMode ? Colors.white.withOpacity(.8) : Colors.white,
          child: CircleAvatar(
            radius: radius,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage(
              imageUrl,
            ),
          ),
        ),
      ),
    );
  }
}
