import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:base/utils/constants/asset_constant.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            AssetsConstants.spashImage,
            fit: BoxFit.cover,
          ),
          Center(
            child: Container(
              width: 350,
              height: 600,
              decoration: BoxDecoration(
                color: AssetsConstants.primaryMain,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AssetsConstants.spashLogo,
                    width: 60,
                    height: 60,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    AssetsConstants.appTitle,
                    style: AssetsConstants.appFont,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}





// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:movemate/utils/constants/asset_constant.dart';
// import 'package:movemate/configs/routes/app_router.dart'; // Đảm bảo import này đúng

// @RoutePage()
// class SplashScreen extends HookConsumerWidget {
//   const SplashScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final animationController = useAnimationController(
//       duration: const Duration(milliseconds: 2000),
//     );

//     final opacityAnimation = useAnimation(
//       Tween<double>(begin: 1.0, end: 0.0).animate(animationController),
//     );

//     useEffect(() {
//       Future.delayed(const Duration(seconds: 2), () {
//         animationController.forward().then((_) {
//           ref.watch(appRouterProvider).config();
//         });
//       });
//       return animationController.dispose;
//     }, []);

//     return Scaffold(
//       body: Opacity(
//         opacity: opacityAnimation,
//         child: Stack(
//           fit: StackFit.expand,
//           children: [
//             Image.asset(
//               AssetsConstants.spashImage,
//               fit: BoxFit.cover,
//             ),
//             Center(
//               child: Container(
//                 width: 350,
//                 height: 600,
//                 decoration: BoxDecoration(
//                   color: AssetsConstants.primaryMain,
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Image.asset(
//                       AssetsConstants.spashLogo,
//                       width: 60,
//                       height: 60,
//                     ),
//                     const SizedBox(width: 10),
//                     const Text(
//                       AssetsConstants.appTitle,
//                       style: AssetsConstants.appFont,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
