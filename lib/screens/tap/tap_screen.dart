import 'package:cv_mobile_app/controller/tap_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TapScreen extends StatelessWidget {
  const TapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("i am rebiold");
    return Scaffold(
      appBar: AppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FloatingActionButton(
            onPressed: () {
              Get.find<TapController>().decrement();
            },
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () {
              Get.find<TapController>().increment();
            },
            child: const Icon(Icons.add),
          )
        ],
      ),
      body: Center(
        child: GetBuilder<TapController>(
          builder: (tap) {
            return Text(
              "${tap.value}",
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      ),
    );
  }
}
