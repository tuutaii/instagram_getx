import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:instagram/app/services/auth_services/auth_controller.dart';

class AuthService extends GetxService {
  final _isAuth = false.obs;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  bool get isAuth => _isAuth.value;
  User? user;

  Future<AuthService> init() async {
    Get.put(AuthController());
    _isAuth(_firebaseAuth.currentUser != null);
    _firebaseAuth.authStateChanges().listen((event) {
      user = event;
    });
    return this;
  }
}
