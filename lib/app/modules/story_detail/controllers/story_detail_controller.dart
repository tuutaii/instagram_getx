import 'package:get/get.dart';
import 'package:instagram/app/core/styles/style.dart';
import 'package:video_player/video_player.dart';

import '../models/story_model.dart';

class StoryDetailController extends GetxController
    with GetTickerProviderStateMixin {
  late PageController pageController;
  late AnimationController animController;
  VideoPlayerController? videoController;
  var currentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(keepPage: false);
    animController = AnimationController(vsync: this);

    final Story firstStory = stories.first;
    _loadStory(story: firstStory, animateToPage: false);

    animController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (currentIndex < stories.length - 1) {
          currentIndex++;
          _loadStory(story: stories[1]);
        } else {
          onCloseStory();
        }
      }
    });

    currentIndex.listen((_) {
      pageController.jumpToPage(currentIndex.value);
    });
  }

  void _loadStory({required Story story, bool animateToPage = true}) {
    animController.stop();
    animController.reset();
    animController.duration = story.duration;
    animController.forward();
  }

  void onCloseStory() {
    Get.back();
  }

  void onTapDown(TapDownDetails details, Story story) {
    final double dx = details.globalPosition.dx;
    if ((dx / Get.width) < .5) {
      if (currentIndex > 0) {
        currentIndex--;
        _loadStory(story: stories[currentIndex.value]);
      } else if (currentIndex.value == 0) {
        _loadStory(story: stories[0]);
      }
    } else {
      if (currentIndex < stories.length - 1) {
        currentIndex++;
        _loadStory(story: stories[currentIndex.value]);
      } else {
        onCloseStory();
      }
    }
  }

  @override
  void onClose() {
    animController.dispose();
    pageController.dispose();
    super.onClose();
  }
}
