import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../controllers/intro_controller.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final IntroController _introController = Get.put(IntroController());
    return Scaffold(
      backgroundColor: const Color(0xff7265e2),
      body: Stack(
        children: [
          PageView.builder(
              controller: _introController.pageController,
              onPageChanged: _introController.selectedPage,
              itemCount: _introController.pages.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        _introController.pages[index].imageAsset,
                        width: 250,
                        height: 250,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        _introController.pages[index].title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Text(
                          _introController.pages[index].description,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 14, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                );
              }),
          Positioned(
            bottom: 20,
            right: 10,
            left: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => _introController.skipAction(),
                  child:const Text(
                    "Skip",
                    style: TextStyle(color: Colors.white,fontSize: 14),
                  ),
                ),
                Row(
                  children: List.generate(
                      _introController.pages.length,
                      (index) => Obx(() {
                            return Container(
                              width:
                                  _introController.selectedPage.value == index
                                      ? 38
                                      : 10,
                              height: 10,
                              margin:const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  color: _introController.selectedPage.value ==
                                          index
                                      ? Colors.white
                                      : const Color(0xff8e84e8),
                                  borderRadius: BorderRadius.circular(8)),
                            );
                          })),
                ),
                FloatingActionButton.small(
                  shape: const CircleBorder(),
                  elevation: 0,
                  child: const Icon(Icons.navigate_next ,color: Color(0xff8e84e8),),
                  onPressed: () => _introController.forwardAction(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
