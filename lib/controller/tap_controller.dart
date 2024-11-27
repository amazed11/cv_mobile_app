import 'package:get/get_state_manager/get_state_manager.dart';

class TapController extends GetxController {
  int value = 0;

  void increment() {
    value++;
    update();
  }

  void decrement() {
    value--;
    update();
  }
}
