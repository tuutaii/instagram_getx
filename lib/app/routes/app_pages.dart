import 'package:get/get.dart';
import 'package:instagram/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:instagram/app/modules/dashboard/views/dashboard_view.dart';

import '../modules/camera_view/bindings/camera_view_binding.dart';
import '../modules/camera_view/views/camera_view_view.dart';
import '../modules/chat_detail_page/bindings/chat_detail_page_binding.dart';
import '../modules/chat_detail_page/views/chat_detail_page_view.dart';
import '../modules/chat_page/bindings/chat_page_binding.dart';
import '../modules/chat_page/views/chat_page_view.dart';
import '../modules/edit_profile_view/bindings/edit_profile_view_binding.dart';
import '../modules/edit_profile_view/views/edit_profile_view_view.dart';
import '../modules/favorite_page/bindings/favorite_page_binding.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home_page/bindings/home_page_binding.dart';
import '../modules/login_page/bindings/login_page_binding.dart';
import '../modules/login_page/views/login_page_view.dart';
import '../modules/post_detail_view/bindings/post_detail_view_binding.dart';
import '../modules/post_detail_view/views/post_detail_view_view.dart';
import '../modules/profile_view/bindings/profile_view_binding.dart';
import '../modules/register_page/bindings/register_page_binding.dart';
import '../modules/register_page/views/register_page_view.dart';
import '../modules/search_view/bindings/search_view_binding.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/story_detail/bindings/story_detail_binding.dart';
import '../modules/story_detail/views/story_detail_view.dart';
import '../modules/watch_page/bindings/watch_page_binding.dart';
import '../modules/welcome_page/bindings/welcome_page_binding.dart';
import '../modules/welcome_page/views/welcome_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.profilePage;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.welcome,
      page: () => const WelcomePageView(),
      binding: WelcomePageBinding(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => const LoginPageView(),
      binding: LoginPageBinding(),
    ),
    GetPage(
      name: _Paths.dashBoard,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
      bindings: [
        HomePageBinding(),
        ProfileViewBinding(),
        SearchViewBinding(),
        FavoritePageBinding(),
        WatchPageBinding(),
      ],
    ),
    GetPage(
      name: _Paths.editProfilePage,
      page: () => const EditProfileViewView(),
      binding: EditProfileViewBinding(),
    ),
    GetPage(
      name: _Paths.storyDetail,
      page: () => const StoryDetailView(),
      binding: StoryDetailBinding(),
    ),
    GetPage(
      name: _Paths.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.chatPage,
      page: () => const ChatPageView(),
      binding: ChatPageBinding(),
    ),
    GetPage(
      name: _Paths.cameraPage,
      page: () => const CameraViewView(),
      binding: CameraViewBinding(),
    ),
    GetPage(
      name: _Paths.postDetailPage,
      page: () => const PostDetailViewView(),
      binding: PostDetailViewBinding(),
    ),
    GetPage(
      name: _Paths.chatDetailPage,
      page: () => const ChatDetailPageView(),
      binding: ChatDetailPageBinding(),
    ),
    GetPage(
      name: _Paths.registerPage,
      page: () => const RegisterPageView(),
      binding: RegisterPageBinding(),
    ),
  ];
}
