import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class GridScreen extends StatefulWidget {
  const GridScreen({super.key});

  @override
  State<GridScreen> createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {
  List<Student> students = [
    Student(
      name: "A",
      image:
          "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      percentage: 70,
    ),
    Student(
      name: "B",
      image:
          "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      percentage: 80,
    ),
    Student(
      name: "C",
      image:
          "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      percentage: 20,
    ),
    Student(
      percentage: 30,
      name: "D",
      image:
          "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    )
  ];

  List<Cat> cats = [
    Cat("htpss:skdjnfksd", "sdkfnksjdf", color: Colors.red),
    Cat("dfdfd", "sdkfnksjdf"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: students.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(context).size.width > 700
                ? 4
                : MediaQuery.of(context).size.width > 500
                    ? 3
                    : 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            var data = students[index];
            return ClipRRect(
              child: Banner(
                location: BannerLocation.topStart,
                message: "${index + 1} Rank",
                color: Colors.green,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black,
                      width: 0.2,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: CachedNetworkImageProvider(data.image),
                      ),
                      Text(
                        data.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      //percentage with big with fontsize color change
                      Text(
                        "${data.percentage}%",
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}

//car,bird,animal,fruits,vegetables,bike,school,stident,person,cafe,college,programmminglanguage,country
//String, int, bool, double, var, final and const
class Student {
  final String image;
  final String name;
  final double percentage;

  Student({required this.image, required this.name, required this.percentage});

  // Student({required this.name, required this.percentage, required this.image});
}

class Cat {
  //properties
  String? image;
  String? name;
  Color? color;

//constructor
  Cat(this.name, this.image, {this.color});

  Cat.ram(this.name, {this.image});

  //
}
