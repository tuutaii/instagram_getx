import 'package:flutter/gestures.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:instagram/app/core/utilities/utils.dart';
import 'package:instagram/app/widgets/commons/input_custom.dart';

import '../../../core/styles/style.dart';
import '../controllers/story_detail_controller.dart';

class StoryDetailView extends GetView<StoryDetailController> {
  const StoryDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Center(
                  child: Image.asset(
                    AppImage.neymarStory,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: [
                      const TimeLineStory(),
                      ListTile(
                        horizontalTitleGap: 0,
                        leading: CircleAvatar(
                          radius: 16,
                          child: Image.asset(AppImage.avtNeymar1),
                        ),
                        title: RichText(
                          textAlign: TextAlign.start,
                          maxLines: 2,
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: "Neymar_Jr.",
                                style: context.subtitle2
                                    .copyWith(color: Colors.white),
                              ),
                              TextSpan(
                                text: ' 3d ',
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                              ),
                            ],
                          ),
                        ),
                        trailing: CloseButton(
                          color: Colors.white,
                          onPressed: () => Get.back(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: InputCustom(
                    isShowBorder: true,
                    isShowPrefixIcon: true,
                    radius: 30,
                    hintText: "Send Message",
                    hintStyle: context.bodyText2
                        .copyWith(fontSize: 15, color: Colors.white),
                    borderSide: const BorderSide(color: Colors.white),
                    constraintPrefixWidth: 50,
                    prefixIcon: SvgPicture.asset(
                      AppImage.iconTakePicture,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    AppImage.iconSend,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}

class TimeLineStory extends StatefulWidget {
  const TimeLineStory({
    Key? key,
  }) : super(key: key);

  @override
  State<TimeLineStory> createState() => _TimeLineStoryState();
}

class _TimeLineStoryState extends State<TimeLineStory>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> playedTime;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );
    animationController.addListener(() {
      setState(() {});
      if (playedTime.value == 1) {
        Get.back();
      }
    });
    playedTime = Tween<double>(begin: 0, end: 1).animate(animationController);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      animationController.forward();
    });
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Colors.white,
          Colors.white.withOpacity(0.36),
        ],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        stops: [playedTime.value, 1 - playedTime.value],
      )),
    );
  }
}
