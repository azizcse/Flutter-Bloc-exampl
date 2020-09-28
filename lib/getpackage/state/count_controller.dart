import 'package:get/state_manager.dart';

class CountController extends GetxController {
  int count = 0;

  increment() {
    count++;
    update();
  }
}
