import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CourseDesignScreen extends StatefulWidget {
  const CourseDesignScreen({super.key});

  @override
  State<CourseDesignScreen> createState() => _CourseDesignScreenState();
}

class _CourseDesignScreenState extends State<CourseDesignScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: SingleChildScrollView(
          child: Column(
            children: [
              //first section
              Container(
                padding: const EdgeInsets.only(
                  top: 30,
                  bottom: 10,
                  left: 10,
                ),
                height: 80,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10,
                      )
                    ]),
                child: const Text(
                  "Courses",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),

              // second section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(40),
                        bottomLeft: Radius.circular(10),
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade100,
                        offset: const Offset(0, 3),
                        blurRadius: 10,
                        spreadRadius: 10,
                      )
                    ]),
                child: Column(
                  children: [
                    //stattistics
                    Row(
                      children: [
                        Expanded(
                          child: Column(children: [
                            ListTile(
                              minLeadingWidth: 0,
                              contentPadding: EdgeInsets.zero,
                              leading: Container(
                                height: 30,
                                width: 3,
                                color: Colors.blue,
                              ),
                              dense: true,
                              title: const Text('Overall'),
                              subtitle: const Row(
                                children: [
                                  Icon(
                                    Icons.chair_alt_rounded,
                                    color: Colors.blue,
                                  ),
                                  Text.rich(TextSpan(
                                      text: "2129th",
                                      style: TextStyle(fontSize: 20),
                                      children: [
                                        TextSpan(
                                            text: " in total",
                                            style: TextStyle(fontSize: 12)),
                                      ])),
                                ],
                              ),
                            ),
                            ListTile(
                              minLeadingWidth: 0,
                              contentPadding: EdgeInsets.zero,
                              leading: Container(
                                height: 30,
                                width: 3,
                                color: Colors.red,
                              ),
                              dense: true,
                              title: const Text('Overall'),
                              subtitle: const Row(
                                children: [
                                  Icon(
                                    Icons.fire_extinguisher,
                                    color: Colors.red,
                                  ),
                                  Text.rich(TextSpan(
                                      text: "50th",
                                      style: TextStyle(fontSize: 20),
                                      children: [
                                        TextSpan(
                                            text: " of the week",
                                            style: TextStyle(fontSize: 12)),
                                      ])),
                                ],
                              ),
                            )
                          ]),
                        ),
                        Stack(
                          children: [
                            SizedBox(
                              height: 80,
                              width: 80,
                              child: CircularProgressIndicator(
                                  value: 0.35,
                                  backgroundColor: Colors.grey.shade100,
                                  strokeWidth: 10,
                                  color: Colors.green,
                                  strokeCap: StrokeCap.round),
                            ),
                            const Positioned.fill(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('650',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                    ' levelof 180',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),

                    //separator
                    const Divider(),

                    //person list
                    const SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          PersonAvatar(),
                          PersonAvatar(),
                          PersonAvatar(
                            isHighLigted: true,
                          ),
                          PersonAvatar(),
                          PersonAvatar(),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              //third section
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    //breadcrummb or title
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Courses"),
                        TextButton.icon(
                          onPressed: () {},
                          icon: const Text("View All"),
                          label: const Icon(
                            Icons.arrow_forward,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                    //tabbar
                    const TabBar(
                      tabs: [
                        Tab(
                          child: Text("My Courses"),
                        ),
                        Tab(
                          child: Text("All Courses"),
                        ),
                      ],
                    ),

                    Container()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PersonAvatar extends StatelessWidget {
  const PersonAvatar({
    super.key,
    this.isHighLigted = false,
  });

  final bool? isHighLigted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: isHighLigted == true ? 30 : 25,
            backgroundImage: const CachedNetworkImageProvider(
                "https://cdni.iconscout.com/illustration/premium/thumb/female-profile-illustration-download-in-svg-png-gif-file-formats--young-woman-girl-avatar-portraits-pack-people-illustrations-6590623.png"),
          ),
          Text(
            isHighLigted == true ? "You" : "${Random().nextInt(100) + 100}",
            style: TextStyle(
                fontWeight:
                    isHighLigted == true ? FontWeight.bold : FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
