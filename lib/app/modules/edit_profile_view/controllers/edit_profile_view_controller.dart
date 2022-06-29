import 'package:get/get.dart';

import '../../../core/styles/style.dart';

class EditProfileViewController extends GetxController {
  final nameController = TextEditingController(text: "tuutaii");
  final userNameController = TextEditingController(text: "COTD - on the mic");
  final webController = TextEditingController(text: "fb.com/tuutaii");
  final bioController = TextEditingController(
      text: "Digital goodies designer @pixsellz Everything is designed.");
  final emailController = TextEditingController(text: "tuutaii@gm.com");
  final phoneController = TextEditingController(text: "00112255");
  final genderController = TextEditingController(text: "Male");

  String get name => nameController.text;
  String get userName => userNameController.text;
  String get website => webController.text;
  String get bio => bioController.text;
  String get phone => phoneController.text;
  String get gender => genderController.text;
  String get email => emailController.text;
}
