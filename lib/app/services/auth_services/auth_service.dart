import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:instagram/app/data/models/user_model.dart';

import '../../core/utilities/app_utils.dart';
import '../../routes/app_pages.dart';

class AuthService extends GetxService {
  final _isAuth = false.obs;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  bool get isAuth => _isAuth.value;
  User? user;
  Rxn<UserModel>? _currentUser;
  UserModel? get currentUser => _currentUser?.value;

  Future<AuthService> init() async {
    _firebaseAuth.authStateChanges().listen((event) {
      if (event != null) {
        _isAuth(true);
        user = event;
      }
    });
    return this;
  }

  void getUser() {
    user = _firebaseAuth.currentUser;
  }

  void login(String email, password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      AppUtils.toast("Login Success");
      user = _firebaseAuth.currentUser;
    } catch (e) {
      AppUtils.toast("Fail to login");
    }
  }

  void singUp(String email, password, name) async {
    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then(
            (value) => UserModel(
                id: value.user!.uid,
                email: value.user!.email!,
                firstName: name,
                imageUrl: '',
                lastName: ''),
          );
    } catch (e) {
      AppUtils.toast("Fail to create account");
    }
  }

  void logOut() async {
    await _firebaseAuth.signOut();
    Get.offAllNamed(Routes.login);
  }
}
