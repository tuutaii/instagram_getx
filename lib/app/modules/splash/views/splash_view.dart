import 'package:get/get.dart';
import 'package:instagram/app/core/styles/style.dart';
import 'package:instagram/app/core/utilities/image.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Shader linearGradient = const LinearGradient(
      colors: <Color>[
        Color(0xffFBAA47),
        Color(0xffD91A46),
        Color(0xffA60F93),
      ],
    ).createShader(const Rect.fromLTWH(30.0, 0.0, 400.0, 70.0));
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Image.asset(
            AppImage.instagram,
            scale: 1.5,
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
            bottom: context.mediaQueryViewPadding.bottom > 0 ? 20 : 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'from',
              style: context.subtitle1
                  .copyWith(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            Text(
              'FACEBOOK',
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()..shader = linearGradient),
            )
          ],
        ),
      ),
    );
  }
}
