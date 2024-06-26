// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:on_air/constants/Constantcolors.dart';
import 'package:on_air/services/FirebaseOperations.dart';
import 'package:provider/provider.dart';

class HomepageHelper with ChangeNotifier {
  ConstantColors constantColors = ConstantColors();
  Widget bottomNavBar(
      BuildContext context, int index, PageController pageController) {
    return CustomNavigationBar(
        currentIndex: index,
        bubbleCurve: Curves.bounceIn,
        scaleCurve: Curves.decelerate,
        selectedColor: constantColors.blueColor,
        unSelectedColor: constantColors.whiteColor,
        strokeColor: constantColors.blueColor,
        scaleFactor: 0.5,
        iconSize: 30.0,
        onTap: (val) {
          index = val;
          pageController.jumpToPage(val);
          notifyListeners();
        },
        backgroundColor: Color(0xff040307),
        items: [
          CustomNavigationBarItem(icon: Icon(EvaIcons.home)),
          CustomNavigationBarItem(icon: Icon(Icons.message_rounded)),
          CustomNavigationBarItem(
              icon: CircleAvatar(
            radius: 35.0,
            backgroundColor: constantColors.blueGreyColor,
            backgroundImage: NetworkImage(
                Provider.of<FirebaseOperations>(context, listen: false)
                    .getInitUserImage),
          )),
        ]);
  }
}
