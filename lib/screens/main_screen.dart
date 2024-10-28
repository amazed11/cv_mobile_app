import 'package:cv_mobile_app/screens/about/about_me_screen.dart';
import 'package:cv_mobile_app/screens/profile/profile_screen.dart';
import 'package:cv_mobile_app/screens/settings/setting_screen.dart';
import 'package:flutter/material.dart';

import 'home/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Color? currentColor;
  int? selectedNumber;
  List colors = [
    //colors
    Colors.red,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
    Colors.pink,
    Colors.orange,
    Colors.brown,
    Colors.blueGrey,
    Colors.cyan,
    Colors.teal,
  ];

  int? currentIndex;

  List<Widget> data = [
    const HomeScreen(),
    AboutScreen(),
    SettingScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('My CV'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                print("share cliked");
              },
              icon: const Icon(Icons.share),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          currentIndex: currentIndex ?? 0,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.category), label: "About"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_checkout_rounded),
                label: "Settings"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Person"),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: data[currentIndex ?? 0]),
        )

        // body: Column(
        //   children: [
        //     SingleChildScrollView(
        //       scrollDirection: Axis.horizontal,
        //       child: Row(
        //           children: List.generate(10, (index) {
        //         return Padding(
        //           padding: const EdgeInsets.all(10.0),
        //           child: GestureDetector(
        //             onTap: () {
        //               print("$index");

        //               setState(() {
        //                 currentColor = colors[index];
        //                 selectedNumber = index;
        //               });
        //               print(currentColor.toString());
        //             },
        //             child: CircleAvatar(
        //               backgroundColor: colors[index],
        //               child: Text("$index"),
        //             ),
        //           ),
        //         );
        //       })),
        //     ),
        //     Expanded(
        //       child: Center(
        //         child: Text(
        //           "${selectedNumber ?? "Please press a number"}",
        //           style: const TextStyle(
        //             fontSize: 80,
        //             fontWeight: FontWeight.w900,
        //           ),
        //         ),
        //       ),
        //     )
        //   ],
        // )

        // body: Column(
        //   children: [

        //   ],
        // ),
        // body: Padding(
        //   padding: const EdgeInsets.all(15.0),
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Container(
        //           padding: const EdgeInsets.all(5),
        //           decoration: BoxDecoration(
        //             border: Border.all(
        //               color: Colors.grey.shade300,
        //             ),
        //             borderRadius: BorderRadius.circular(8),
        //           ),
        //           width: MediaQuery.of(context).size.width,
        //           child: Row(
        //             children: [
        //               //image
        //               ClipRRect(
        //                 borderRadius: BorderRadius.circular(8),
        //                 child: Image.asset(
        //                   "assets/images/myphoto.jpg",
        //                   width: MediaQuery.of(context).size.width * 0.35,
        //                 ),
        //               ),

        //               const SizedBox(
        //                 width: 10,
        //               ),
        //               //dadta
        //               Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   const Text(
        //                     "Mr. Aashbin Sunar",
        //                     style: TextStyle(
        //                       fontWeight: FontWeight.bold,
        //                       fontSize: 18,
        //                     ),
        //                   ),
        //                   const SizedBox(
        //                     height: 5,
        //                   ),
        //                   const Text(
        //                     "Flutter Developer",
        //                     style: TextStyle(
        //                       fontWeight: FontWeight.w300,
        //                       fontSize: 14,
        //                       color: Colors.grey,
        //                     ),
        //                   ),
        //                   const SizedBox(
        //                     height: 5,
        //                   ),
        //                   const Row(
        //                     children: [
        //                       Icon(
        //                         Icons.star,
        //                         color: Colors.orange,
        //                         size: 16,
        //                       ),
        //                       SizedBox(
        //                         width: 5,
        //                       ),
        //                       Text(
        //                         "4.7",
        //                         style: TextStyle(
        //                           color: Colors.orange,
        //                         ),
        //                       ),
        //                     ],
        //                   ),
        //                   const SizedBox(
        //                     height: 5,
        //                   ),
        //                   const Row(
        //                     children: [
        //                       Icon(
        //                         Icons.location_on_outlined,
        //                         color: Color.fromARGB(255, 88, 88, 88),
        //                         size: 16,
        //                       ),
        //                       SizedBox(
        //                         width: 5,
        //                       ),
        //                       Text(
        //                         "Pokhara, Nepal",
        //                         style: TextStyle(
        //                           color: Color.fromARGB(255, 88, 88, 88),
        //                         ),
        //                       ),
        //                     ],
        //                   ),
        //                   const SizedBox(
        //                     height: 10,
        //                   ),
        //                   ElevatedButton.icon(
        //                     onPressed: () {},
        //                     icon: const Icon(Icons.call),
        //                     label: const Text("Contact Me"),
        //                   ),
        //                   const SizedBox(
        //                     height: 5,
        //                   ),
        //                 ],
        //               )
        //             ],
        //           )),
        //     ],
        //   ),
        // ),

        // body: Container(
        //   margin: const EdgeInsets.all(20),
        //   width: double.infinity,
        //   decoration: BoxDecoration(
        //       color: Colors.yellow,
        //       borderRadius: BorderRadius.circular(20),
        //       border: Border.all(
        //         color: Colors.black,
        //         width: 10,
        //       )),
        //   height: 200,
        //   child: Center(
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         const Text("This is my appx"),
        //         ElevatedButton(
        //             onPressed: () {
        //               print("sdfsdf");
        //             },
        //             child: const Text("Please click me"))
        //       ],
        //     ),
        //   ),
        // ),

        // body: SingleChildScrollView(
        //   padding: const EdgeInsets.all(16.0),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       // Profile photo, name, and designation
        //       Container(
        //         padding: const EdgeInsets.all(10),
        //         decoration: BoxDecoration(
        //           color: Theme.of(context).brightness == Brightness.light
        //               ? Colors.grey.shade200
        //               : Colors.grey.shade800,
        //           borderRadius: BorderRadius.circular(10),
        //         ),
        //         child: const Center(
        //           child: Column(
        //             children: [
        //               CircleAvatar(
        //                 radius: 60,
        //                 backgroundImage: AssetImage('assets/images/myphoto.jpg'),
        //               ),
        //               SizedBox(height: 16),
        //               Text(
        //                 'Aashbin Sunar',
        //                 style:
        //                     TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        //               ),
        //               Text(
        //                 'Software Engineer',
        //                 style: TextStyle(fontSize: 18, color: Colors.grey),
        //               ),
        //               SizedBox(height: 16),
        //             ],
        //           ),
        //         ),
        //       ),
        //       const SizedBox(
        //         height: 20,
        //       ),
        //       // Email and contact buttons
        //       ListTile(
        //         leading: const Icon(Icons.email),
        //         title: const Text('Email'),
        //         subtitle: const Text('john.doe@email.com'),
        //         trailing: IconButton(
        //           icon: const Icon(Icons.mail),
        //           onPressed: () {
        //             // Implement share function
        //           },
        //         ),
        //       ),
        //       ListTile(
        //         leading: const Icon(Icons.phone),
        //         title: const Text('Phone'),
        //         subtitle: const Text('+123456789'),
        //         trailing: IconButton(
        //           icon: const Icon(Icons.call),
        //           onPressed: () {
        //             // Implement call function
        //           },
        //         ),
        //       ),
        //       const Divider(),
        //       // Skills section
        //       const Text(
        //         'Skills',
        //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        //       ),
        //       const SizedBox(height: 8),
        //       const Wrap(
        //         spacing: 8,
        //         runSpacing: 8,
        //         children: [
        //           Chip(label: Text('Flutter')),
        //           Chip(label: Text('Dart')),
        //           Chip(label: Text('Firebase')),
        //           Chip(label: Text('Node.js')),
        //           Chip(label: Text('JavaScript')),
        //         ],
        //       ),
        //       const Divider(),
        //       // Qualification section
        //       const Text(
        //         'Qualifications',
        //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        //       ),
        //       const SizedBox(height: 8),
        //       const ListTile(
        //         leading: Icon(Icons.school),
        //         title: Text('Bachelor of Computer Science'),
        //         subtitle: Text('XYZ University, 2020'),
        //       ),
        //       const ListTile(
        //         leading: Icon(Icons.school),
        //         title: Text('Master of Computer Science'),
        //         subtitle: Text('ABC University, 2022'),
        //       ),
        //       const Divider(),
        //       // Projects section
        //       const Text(
        //         'Projects',
        //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        //       ),
        //       const SizedBox(height: 8),
        //       Card(
        //         child: ListTile(
        //           title: const Text('Project 1: My Portfolio'),
        //           subtitle: const Text(
        //               'A portfolio website built using Flutter and Firebase.'),
        //           trailing: IconButton(
        //             icon: const Icon(Icons.open_in_new),
        //             onPressed: () {
        //               // Implement link opening
        //             },
        //           ),
        //         ),
        //       ),
        //       Card(
        //         child: ListTile(
        //           title: const Text('Project 2: Task Manager App'),
        //           subtitle: const Text(
        //               'A task management app developed with Flutter and Node.js backend.'),
        //           trailing: IconButton(
        //             icon: const Icon(Icons.open_in_new),
        //             onPressed: () {
        //               // Implement link opening
        //             },
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        );
  }
}
