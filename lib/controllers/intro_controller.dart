import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/intro_info.dart';

class IntroController extends GetxController{
    var selectedPage = 0.obs;

    var pageController = PageController();

    bool get isLastPage => selectedPage.value == pages.length-1;

    forwardAction(){
      if(isLastPage){
        //Todo
      }
      else{
        pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
      }
    }
    skipAction(){
      pageController.jumpToPage(pages.length);
    }

    List<IntroInfo> pages = [
      IntroInfo("lib/assets/images/image1.png", "Mental Health \n Service", "if you think that you or someone you know has a mental health problem, there are a number waysthat you can seek advice."),
      IntroInfo("lib/assets/images/image2.png", "Behavioral Health \n Service", "if you think that you or someone you know has a mental health problem, there are a number waysthat you can seek advice."),
      IntroInfo("lib/assets/images/image3.png", "Get Started", "Take the first step on your journey to better mental health, Get Started today!"),
    ];
}