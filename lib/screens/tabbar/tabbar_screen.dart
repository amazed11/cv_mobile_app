import 'package:flutter/material.dart';

class TabbarScreen extends StatelessWidget {
  const TabbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Tabbar"),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                icon: Icon(Icons.collections_bookmark_sharp),
                text: "Classic",
              ),
              Tab(
                icon: Icon(Icons.mode_edit_outline_sharp),
                text: "Modern",
              ),
              Tab(
                icon: Icon(Icons.art_track_outlined),
                text: "Artificial",
              ),
              Tab(
                icon: Icon(Icons.art_track_outlined),
                text: "Artificial",
              ),
              Tab(
                icon: Icon(Icons.art_track_outlined),
                text: "Artificial",
              ),
              Tab(
                icon: Icon(Icons.art_track_outlined),
                text: "Artificial",
              ),
              Tab(
                icon: Icon(Icons.art_track_outlined),
                text: "Artificial",
              ),
              Tab(
                icon: Icon(Icons.art_track_outlined),
                text: "Artificial",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Text("Classic"),
            Text("Modern"),
            Text("Artificial"),
            Text("Artificial"),
            Text("Artificial"),
            Text("Artificial"),
            Text("Artificial"),
            Text("Artificial"),
          ],
        ),
      ),
    );
  }
}
