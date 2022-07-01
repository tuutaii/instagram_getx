import 'package:get/get.dart';
import '../../../core/styles/style.dart';
import '../models/story_model.dart';

class MainStory extends StatelessWidget {
  const MainStory({
    Key? key,
    required this.storyModel,
  }) : super(key: key);

  final StoryModel storyModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            width: 70.0,
            height: 70.0,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                stops: [.2, .6, .2],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xffFBAA47),
                  Color(0xffD91A46),
                  Color(0xffA60F93),
                ],
              ),
              shape: BoxShape.circle,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            padding: const EdgeInsets.all(2),
            child: CircleAvatar(
              backgroundColor:
                  Get.isDarkMode ? Colors.white.withOpacity(.8) : Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: Image.asset(storyModel.imgUrl),
              ),
            ),
          ),
        ),
        storyModel.isLive == true
            ? Positioned(
                bottom: 15,
                child: Container(
                  height: 20,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Get.isDarkMode
                        ? Colors.white.withOpacity(.8)
                        : Colors.white,
                  ),
                  padding: const EdgeInsets.all(3),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      gradient: const LinearGradient(
                        stops: [.2, .6, .2],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xffC90083),
                          Color(0xffD22463),
                          Color(0xffE10038),
                        ],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "LIVE",
                        style: context.bodyText1
                            .copyWith(fontSize: 8, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              )
            : const SizedBox(),
        Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            storyModel.userName,
            style: context.bodyText1.copyWith(fontSize: 12),
          ),
        )
      ],
    );
  }
}
