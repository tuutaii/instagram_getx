import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:instagram/app/core/utilities/app_utils.dart';
import 'package:instagram/app/routes/app_pages.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
    } else {
      Get.offAllNamed(Routes.welcome, arguments: user.email);
    }
  }

  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      AppUtils.toast("Login Success");
    } catch (e) {
      AppUtils.toast("Fail to login");
    }
  }

  void singUp(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      AppUtils.toast("Fail to create account");
    }
  }

  void logOut() async {
    await auth.signOut();
    Get.offAndToNamed(Routes.login);
  }
}
