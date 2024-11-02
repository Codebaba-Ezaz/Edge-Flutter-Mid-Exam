
/*        Author: Ezaz Ahmed Sayem (Github: github.com/Codebaba-Ezaz       */

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Ezaz_Motions extends GetxController {
  var buttonClicked = false.obs;
  var menuClicked = false.obs;

  void toggleButton() {
    buttonClicked.value = !buttonClicked.value;
    if (buttonClicked.value) {
      menuClicked.value = false;
    }
  }

  void toggleMenu() {
    menuClicked.value = !menuClicked.value;
  }

  void resetButton() {
    buttonClicked.value = false;
  }
}

class EzazMid extends StatelessWidget {
  const EzazMid({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Ezaz_Motions());
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blueGrey,
              Colors.redAccent,
              Colors.tealAccent,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: size.width,
              height: size.height,
              child: Obx(() => Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    bottom: size.height * 0.15,
                    right: size.width * 0.5 - 115,
                    child: GestureDetector(
                      onTap: controller.toggleButton,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(36.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 15.0,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Text(
                          controller.buttonClicked.value ? "Collapse Circle" : "Expand Circle",
                          style: TextStyle(
                            fontSize: size.width * 0.05,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),

                  // First Circle
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    top: controller.buttonClicked.value
                        ? (controller.menuClicked.value ? size.width * .48 : size.width * .50)
                        : size.width * .46,

                    left: controller.buttonClicked.value
                        ? (controller.menuClicked.value ? size.width * .2 : null): null,

                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      width: controller.buttonClicked.value
                          ? (controller.menuClicked.value ? size.width * .3 : size.width * .80)
                          : size.width * .48,
                      height: controller.buttonClicked.value
                          ? (controller.menuClicked.value ? size.width * .8 : size.width * .80)
                          : size.width * .48,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: controller.buttonClicked.value
                              ? [Colors.greenAccent, Colors.blueAccent]
                              : [Colors.blueAccent, Colors.greenAccent],
                        ),
                        borderRadius: BorderRadius.circular(controller.buttonClicked.value ? 50 : 100),
                      ),
                      child: controller.buttonClicked.value
                          ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                      )
                          : const SizedBox(),
                    ),
                  ),

                  // Second Circle
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    top: controller.buttonClicked.value
                        ? (controller.menuClicked.value ? size.width * .55 : size.width * .65)
                        : (controller.menuClicked.value ? size.width * .521 : size.width * .521),
                    left: controller.buttonClicked.value
                        ? (controller.menuClicked.value ? size.width * .53 : size.width * .21)
                        : size.width * .266,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      width: controller.buttonClicked.value
                          ? (controller.menuClicked.value ? size.width * .23 : size.width * .50)
                          : size.width * .36,
                      height: controller.buttonClicked.value
                          ? (controller.menuClicked.value ? size.width * .30 : size.width * .50)
                          : size.width * .36,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(controller.buttonClicked.value
                            ? (controller.menuClicked.value ? 30 : 20)
                            : 100),
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ),

                  // Third Circle
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    top: controller.buttonClicked.value
                        ? (controller.menuClicked.value ? size.width * .87 : 190)
                        : (controller.menuClicked.value ? size.width * .566 : size.width * .566),
                    right: controller.buttonClicked.value
                        ? (controller.menuClicked.value ? size.width * .15 : size.width * .15)
                        : (controller.menuClicked.value ? size.width * .31 : size.width * .31),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      width: controller.buttonClicked.value
                          ? (controller.menuClicked.value ? size.width * .2 : size.width * .1)
                          : size.width * .27,
                      height: controller.buttonClicked.value
                          ? (controller.menuClicked.value ? size.width * .3 : size.width * .1)
                          : size.width * .27,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.orangeAccent,
                            Colors.redAccent,
                          ],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                        ),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: Opacity(
                          opacity: controller.buttonClicked.value ? 0 : 1,
                          child: Text(
                            "Let's go",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Menu Icon
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    top: 20, // Position at the top
                    right: 20, // Position at the right
                    child: GestureDetector(
                      onTap: controller.toggleMenu, // Toggle menu state on tap
                      child: AnimatedOpacity(
                        opacity: controller.buttonClicked.value ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 500),
                        child: Icon(
                          Icons.menu, // Menu icon
                          size: 32, // Adjust the size as needed
                          color: Colors.white, // Color of the icon
                        ),
                      ),
                    ),
                  ),
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(GetMaterialApp(home: EzazMid()));
}
