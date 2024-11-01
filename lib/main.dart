import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Ezaz_Motions extends GetxController {
  var buttonClicked = false.obs;

  void toggleButton() {
    buttonClicked.value = !buttonClicked.value;
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
                    top: controller.buttonClicked.value ? size.width * .50 : size.width * .46,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      width: controller.buttonClicked.value ? size.width * .80 : size.width * .48,
                      height: controller.buttonClicked.value ? size.width * .80 : size.width * .48,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: controller.buttonClicked.value
                              ? [Colors.greenAccent, Colors.blueAccent]
                              : [Colors.blueAccent, Colors.greenAccent],
                        ),
                        borderRadius: BorderRadius.circular(controller.buttonClicked.value ? 60 : 100),
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
                    top: controller.buttonClicked.value ? size.width * .65 : size.width * .521,
                    left: controller.buttonClicked.value ? size.width * .21 : size.width * .2749,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,

                      width: controller.buttonClicked.value ? size.width * .50 : size.width * .36,
                      height: controller.buttonClicked.value ? size.width * .50 : size.width * .36,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(controller.buttonClicked.value ? 20 : 100), // Change to square
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ),


                  // Third Circle
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    top: controller.buttonClicked.value ? 220 : size.width * .566,
                    right:controller.buttonClicked.value ?size.width * .15 :size.width * .31,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      width: controller.buttonClicked.value ? size.width * .1 : size.width * .27,
                      height: controller.buttonClicked.value ? size.width * .1 : size.width * .27,
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
