import 'package:get/get.dart';

import 'app/core/styles/style.dart';
import 'app/routes/app_pages.dart';
import 'app/services/auth_services/auth_service.dart';
import 'app/widgets/animations/zoom_transition.dart';

class RootApp extends StatelessWidget {
  RootApp({Key? key}) : super(key: key ?? GlobalKey());
  AuthService get auth => Get.find();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        // title: AppConfig.instance.appName,
        // navigatorKey: AppConfig.navigatorKey,
        theme: AppTheme.getCollectionTheme(),
        customTransition: ZoomTransitions(),
        initialRoute: auth.isAuth ? Routes.welcome : Routes.login,
        getPages: AppPages.routes,
        routingCallback: (_) {
          WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
        },
      ),
      onTap: () {
        WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
      },
    );
  }
}
