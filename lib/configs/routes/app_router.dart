import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// guard
import 'guard/onboarding_guard.dart';

// screen-auth
import 'package:base/features/auth/presentation/screens/sign_in/sign_in_screen.dart';
import 'package:base/features/auth/presentation/screens/sign_up/sign_up_screen.dart';
import 'package:base/features/auth/presentation/screens/privacy_term/privacy_screen.dart';
import 'package:base/features/auth/presentation/screens/privacy_term/term_screen.dart';
import 'package:base/features/auth/presentation/screens/otp_verification/otp_verification_screen.dart';

// screen-home
import 'package:base/features/home/presentation/screens/home_screen/home_screen.dart';
import 'package:base/features/profile/presentation/screens/profile_screen/profile_screen.dart';


// screen-test
import 'package:base/features/test/presentation/screens/test_screen/test_screen.dart';

import 'package:base/splash_screen.dart';
import 'package:base/tab_screen.dart';
// import 'package:base/onboarding_screen.dart';

// model

// utils
import 'package:base/utils/enums/enums_export.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Route')
class AppRouter extends _$AppRouter {
  final Ref _ref;
  AppRouter({
    required Ref ref,
  }) : _ref = ref;

  @override
  List<AutoRoute> get routes => [
        // auth
        AutoRoute(
          page: SignInScreenRoute.page,
          initial: true
        ),
        AutoRoute(
          page: SignUpScreenRoute.page,
          // initial: true,
        ),
        AutoRoute(page: OTPVerificationScreenRoute.page),

        // Màn hình Onboarding
        // AutoRoute(page: OnboardingScreenRoute.page),

        // Màn hình chính
        AutoRoute(
          page: TabViewScreenRoute.page,
          // initial: true,
          guards: [
            // OnboardingGuard(ref: _ref),
            // AuthGuard(ref: _ref),
          ],
          children: [
            AutoRoute(page: HomeScreenRoute.page),
            // AutoRoute(page: OrderScreenRoute.page),
            // AutoRoute(page: PromotionScreenRoute.page),
            AutoRoute(page: ProfileScreenRoute.page),
            AutoRoute(page: TestScreenRoute.page),
          ],
        ),
        AutoRoute(
          page: HomeScreenRoute.page,
        ),

        AutoRoute(page: TestScreenRoute.page),
      ];
}

final appRouterProvider = Provider((ref) => AppRouter(ref: ref));
