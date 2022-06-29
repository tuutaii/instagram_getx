import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import 'app/core/styles/style.dart';
import 'app/core/utilities/utils.dart';
import 'app/services/auth_services/auth_service.dart';
import 'root.dart';

Future<void> initServices() async {
  Get.log('Starting services ...');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Preferences.setPreferences();
  await Get.putAsync(() => AuthService().init());
  Get.log('All services started...');
  return;
}

Future<void> main() async {
  await initServices();
  runApp(RootApp());
}
