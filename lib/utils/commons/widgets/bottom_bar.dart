// ignore_for_file: unused_import
import 'package:auto_route/auto_route.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../../configs/routes/app_router.dart';
import '../../constants/asset_constant.dart';

class CustomBottomBar extends HookWidget {
  const CustomBottomBar({
    super.key,
    required this.tabsRouter,
  });
  final TabsRouter tabsRouter;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return CupertinoTabBar(
      currentIndex: tabsRouter.activeIndex,
      onTap: tabsRouter.setActiveIndex,
      height: size.height * 0.07,
      backgroundColor: AssetsConstants.whiteColor,
      items: [
        BottomNavigationBarItem(
          icon: Container(
            margin: const EdgeInsets.only(
              top: AssetsConstants.defaultMargin - 6.0,
            ),
            width: size.width * 0.09,
            height: size.width * 0.08,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                AssetsConstants.defaultBorder,
              ),
              color: tabsRouter.activeIndex == 0
                  ? AssetsConstants.primaryLight
                  : AssetsConstants.whiteColor,
            ),
            child: Icon(
              Icons.home,
              color: tabsRouter.activeIndex == 0
                  ? Colors.white // Change icon to white when selected
                  : AssetsConstants.primaryDark,
              size: AssetsConstants.defaultFontSize - 6.0,
            ),
          ),
          label: 'Trang chủ', // Text label
        ),
        BottomNavigationBarItem(
          icon: Container(
            margin: const EdgeInsets.only(
              top: AssetsConstants.defaultMargin - 6.0,
            ),
            width: size.width * 0.09,
            height: size.width * 0.08,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                AssetsConstants.defaultBorder,
              ),
              color: tabsRouter.activeIndex == 1
                  ? AssetsConstants.primaryLight
                  : AssetsConstants.whiteColor,
            ),
            child: Image.asset(
              "assets/icons/truck2.png",
              color: tabsRouter.activeIndex == 1
                  ? Colors.white
                  : AssetsConstants
                      .primaryDark, // Optional: different color when inactive
              width: size.width * 0.6, // Adjust the icon size as needed
              height: size.width * 0.6, // Adjust the icon size as needed
              fit: BoxFit.scaleDown,
            ),
          ),
          label: 'Đặt xe của tôi', // Text label
        ),
        BottomNavigationBarItem(
          icon: Container(
            margin: const EdgeInsets.only(
              top: AssetsConstants.defaultMargin - 6.0,
            ),
            width: size.width * 0.09,
            height: size.width * 0.08,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                AssetsConstants.defaultBorder,
              ),
              color: tabsRouter.activeIndex == 2
                  ? AssetsConstants.primaryLight
                  : AssetsConstants.whiteColor,
            ),
            child: Center(
              child: Image.asset(
                "assets/icons/discount.png",
                color: tabsRouter.activeIndex == 2
                    ? Colors.white
                    : AssetsConstants
                        .primaryDark, // Optional: different color when inactive
                width: size.width * 0.6, // Adjust the icon size as needed
                height: size.width * 0.6, // Adjust the icon size as needed
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          label: 'Gói dịch vụ', // Text label
        ),
        BottomNavigationBarItem(
          icon: Container(
            margin: const EdgeInsets.only(
              top: AssetsConstants.defaultMargin - 6.0,
            ),
            width: size.width * 0.09,
            height: size.width * 0.08,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                AssetsConstants.defaultBorder,
              ),
              color: tabsRouter.activeIndex == 3
                  ? AssetsConstants.primaryLight
                  : AssetsConstants.whiteColor,
            ),
            child: Icon(
              Icons.account_box,
              color: tabsRouter.activeIndex == 3
                  ? Colors.white // Change icon to white when selected
                  : AssetsConstants.primaryDark,
              size: AssetsConstants.defaultFontSize - 6.0,
            ),
          ),
          label: 'Tài khoản', // Text label
        ),
      ],
    );
  }
}
