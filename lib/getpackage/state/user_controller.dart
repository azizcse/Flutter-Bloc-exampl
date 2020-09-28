import 'package:flutter_widgets/getpackage/state/user.dart';
import 'package:get/get.dart';

class UserController extends GetxController{
  final user = User().obs;
  updateUser(int count){
    user.update((val) {
      val.name = "Aziz";
      val.count = count;
    });
  }
}