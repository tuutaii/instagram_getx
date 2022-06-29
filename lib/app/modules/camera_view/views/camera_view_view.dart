import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:instagram/app/core/styles/style.dart';

import '../../../core/utilities/image.dart';
import '../controllers/camera_view_controller.dart';

class CameraViewView extends GetView<CameraViewController> {
  const CameraViewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17.0),
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    // Center(
                    //   child: Image.asset(
                    //     AppImage.neymarStory,
                    //     fit: BoxFit.fitWidth,
                    //   ),
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(AppImage.iconSetting),
                        ),
                        IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: SvgPicture.asset(AppImage.iconBack),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 24.5,
                            width: 24.5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                            child: Image.asset(AppImage.imagePost),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(AppImage.iconFlash),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(.2),
                                shape: BoxShape.circle),
                            child: const Padding(
                              padding: EdgeInsets.all(6.0),
                              child: Icon(
                                Icons.circle,
                                color: Colors.white,
                                size: 60,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(AppImage.iconSwitch),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(AppImage.iconFilter),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: SizedBox(
                  height: 50,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    padding: const EdgeInsets.only(left: 50),
                    itemBuilder: (BuildContext context, int index) => Padding(
                      padding: const EdgeInsets.only(right: 17.0),
                      child: Center(
                        child: Text(
                          "Camera",
                          style:
                              context.subtitle1.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
