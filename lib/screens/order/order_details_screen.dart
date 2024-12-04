import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Hero(
            tag: "order_details",
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              width: double.infinity,
              alignment: Alignment.bottomCenter,
              height: 400,
              imageUrl:
                  "https://www.shutterstock.com/image-photo/mojito-sangria-alcoholic-cocktail-drink-600nw-2332681655.jpg",
            ),
          ),

          //description for blackberry
          const Text(
            """
The blackberry is an edible fruit produced by many species in the genus Rubus in the family Rosaceae, hybrids among these species within the subgenus Rubus, and hybrids between the subgenera Rubus and Idaeobatus. The taxonomy of blackberries has historically been confused because of hybridization and apomixis, so that species have often been grouped together and called species aggregates.

Blackberry fruit production is abundant with annual volumes of 20,000 pounds (9,100 kg) per 1 acre (0.40 ha) possible, making this plant commercially attractive.[1]

Rubus armeniacus ("Himalayan" blackberry) is considered a noxious weed and invasive species in many regions of the Pacific Northwest of Canada and the United States, where it grows out of control in urban and suburban parks and woodlands.[2][3]
""",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
