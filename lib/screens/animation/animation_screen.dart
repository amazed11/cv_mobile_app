import 'package:flutter/material.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;

  late AnimationController controller;

  double progress = 0.0;

  @override
  void initState() {
    // TODO: implement initState

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addListener(() {
        setState(() {
          progress = controller.value;
        });
      });
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);
    super.initState();
  }

  bool isCircle = true;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animations"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                if (controller.isCompleted) {
                  controller.reverse();
                } else {
                  controller.forward();
                }
              },
              child: AnimatedIcon(
                icon: AnimatedIcons.close_menu,
                progress: animation,
                size: 100,
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isCircle = !isCircle;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                height: 100,
                curve: Curves.easeInCubic,
                width: 100,
                decoration: BoxDecoration(
                  shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
                  color: isCircle ? Colors.red : Colors.yellow,
                ),
                child: Center(
                  child: Text("$progress"),
                ),
              ),
            ),
            AnimatedCrossFade(
              firstChild: Container(
                height: 100,
                width: 100,
                color: Colors.red,
              ),
              secondChild: Container(
                height: 100,
                width: 100,
                color: Colors.yellow,
              ),
              crossFadeState: progress > 0.5
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(seconds: 1),
            ),
          ],
        ),
      ),
    );
  }
}
