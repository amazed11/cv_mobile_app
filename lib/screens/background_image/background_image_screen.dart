import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BackgroundImageScreen extends StatelessWidget {
  const BackgroundImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: ColorFiltered(
              colorFilter:
                  const ColorFilter.mode(Colors.black12, BlendMode.colorBurn),
              child: CachedNetworkImage(
                imageUrl:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUXo-mEdWf26-8LO6OfhZ4v6QjUO2Gvyc3ow&s",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                Text(
                  "Mesmerising Nature",
                  style: GoogleFonts.afacad(
                    fontSize: 30,
                    letterSpacing: 1.6,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.underline,
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton.filledTonal(
                      onPressed: () {},
                      icon: const Icon(Icons.facebook),
                    ),
                    IconButton.filledTonal(
                      onPressed: () {},
                      icon: const Icon(Icons.wechat_sharp),
                    ),
                    IconButton.filledTonal(
                      onPressed: () {},
                      icon: const Icon(Icons.whatshot_sharp),
                    ),
                    IconButton.filledTonal(
                      onPressed: () {},
                      icon: const Icon(Icons.tiktok),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.redAccent, Colors.black],
                    ),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Center(
                    child: Text(
                      "Explore More",
                      style: GoogleFonts.afacad(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
