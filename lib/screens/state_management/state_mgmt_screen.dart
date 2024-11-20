import 'package:cached_network_image/cached_network_image.dart';
import 'package:cv_mobile_app/controller/cart_controller.dart';
import 'package:cv_mobile_app/models/fashion/fashion_response_model.dart';
import 'package:cv_mobile_app/screens/state_management/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;

class StateMgmtScreen extends StatefulWidget {
  const StateMgmtScreen({super.key});

  @override
  State<StateMgmtScreen> createState() => _StateMgmtScreenState();
}

class _StateMgmtScreenState extends State<StateMgmtScreen> {
  bool isLoading = true;
  List<FashionResponseModel> data = [];
  void getFashions() async {
    try {
      setState(() {
        isLoading = true;
      });
      var response =
          await http.get(Uri.parse("https://api.escuelajs.co/api/v1/products"));
      if (response.statusCode == 200) {
        setState(() {
          data = fashionResponseModelFromJson(response.body);
          isLoading = false;
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getFashions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (cart) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("State Management"),
          ),
          floatingActionButton: Stack(
            children: [
              FloatingActionButton(
                onPressed: () {
                  //naviagte to cart screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartScreen(),
                    ),
                  );
                },
                child: const Icon(Icons.add_shopping_cart_outlined),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 10,
                  child: Text(
                    cart.carts.length.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
              )
            ],
          ),
          body: isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : RefreshIndicator(
                  onRefresh: () async {
                    getFashions();
                  },
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                    padding: const EdgeInsets.all(20),
                    itemCount: data.length ?? 0,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.shade300,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          isThreeLine: true,
                          leading: CircleAvatar(
                            backgroundImage: CachedNetworkImageProvider(
                                data[index].images?[0] ?? ""),
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  "${data[index].category?.name}",
                                  style: const TextStyle(
                                    fontSize: 8,
                                  ),
                                ),
                              ),
                              Text(
                                data[index].title ?? 'No title',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Rs.${data[index].price}",
                                style: const TextStyle(
                                  fontSize: 17,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              OutlinedButton(
                                  onPressed: () {
                                    cart.addToCart(
                                      Cart(
                                          id: data[index].id,
                                          data: data[index],
                                          quantity: 1),
                                    );
                                  },
                                  child: const Text("Add to cart"))
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
        );
      },
    );
  }
}

class Product {
  final int id;
  final String name;
  final double price;
  final String image;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });
}

class Cart {
  final dynamic id;
  final FashionResponseModel data;
  final int quantity;

  Cart({required this.id, required this.data, required this.quantity});
}
