import 'package:cached_network_image/cached_network_image.dart';
import 'package:cv_mobile_app/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                Get.find<CartController>().clearAll();
              },
              child: const Text("Clear Cart"))
        ],
      ),
      body: GetBuilder<CartController>(
        builder: (cart) {
          if (cart.carts.isEmpty) {
            //no item found in cart
            return const Center(
              child: Text("No item on your cart"),
            );
          }
          return Column(
            children: [
              //items
              Expanded(
                child: ListView.builder(
                  itemCount: cart.carts.length ?? 0,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      isThreeLine: true,
                      title: Text(cart.carts[index].data.title ?? ''),
                      leading: CachedNetworkImage(
                        imageUrl: cart.carts[index].data.images?[0] ?? '',
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          cart.deleteCart(cart.carts[index]);
                        },
                        icon: const Icon(
                          Icons.delete_outline_rounded,
                          color: Colors.red,
                        ),
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //qty
                          Expanded(
                              child: Text("Qty:${cart.carts[index].quantity}")),

                          //price
                          Expanded(
                              child:
                                  Text("Rs.${cart.carts[index].data.price}")),
                        ],
                      ),
                    );
                  },
                ),
              ),
              //calculation - subtotal,discount, grand total
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Expanded(child: Text("Sub Total")),
                    Text("Rs.${cart.getTotalPrice().toString()}")
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                        child: RichText(
                      text: const TextSpan(
                          text: "Discount",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal),
                          children: [
                            TextSpan(
                                text: " (12%) 💰",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold))
                          ]),
                    )),
                    Text("Rs.${cart.getDiscountedPrice().round()}")
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Expanded(child: Text("Grand Total")),
                    Text("Rs.${cart.getGrandTotal().round()}")
                  ],
                ),
              ),

              const Divider(),

              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {},
                    child: const Text("Place Order"),
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),
              //checkout
            ],
          );
        },
      ),
    );
  }
}
