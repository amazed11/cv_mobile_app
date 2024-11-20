import 'package:cv_mobile_app/screens/state_management/state_mgmt_screen.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CartController extends GetxController {
  List<Cart> carts = [];

  void addToCart(Cart cart) async {
    if (checkAlreadyItemOnCart(cart)) {
      return;
    }
    carts.add(cart);
    update();
  }

  bool checkAlreadyItemOnCart(Cart cart) {
    for (var element in carts) {
      if (element.id == cart.id) {
        return true;
      }
    }
    return false;
  }
}
