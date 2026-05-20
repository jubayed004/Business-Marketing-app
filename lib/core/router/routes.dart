import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:som_spot/core/router/route_path.dart';
import 'package:som_spot/features/auth/active/active_otp_screen.dart';
import 'package:som_spot/features/auth/forget_otp/forgetotp_screen.dart';
import 'package:som_spot/features/auth/forget/forget_password_screen.dart';
import 'package:som_spot/features/auth/login/login_screen.dart';
import 'package:som_spot/features/auth/reset/reset_password_screen.dart';
import 'package:som_spot/features/auth/sign_up/sign_up_screen.dart';
import 'package:som_spot/features/choose_language/view/choose_language_screen.dart';
import 'package:som_spot/features/nav/navigation_page.dart';
import 'package:som_spot/features/onboarding/onboarding_screen.dart';
import 'package:som_spot/features/splash/splash_screen.dart';
import 'package:som_spot/features/wellcome/view/welcome_screen.dart';
import 'package:som_spot/utils/extension/base_extension.dart';

// Feature screens imports
import 'package:som_spot/features/profile/view/edit_profile_screen.dart';
import 'package:som_spot/features/claims/view/claims_screen.dart';
import 'package:som_spot/features/other/view/help_and_support_screen.dart';
import 'package:som_spot/features/other/view/about_somsport_screen.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static final GoRouter initRoute = GoRouter(
    initialLocation: RoutePath.splashScreen.addBasePath,
    debugLogDiagnostics: true,
    navigatorKey: navigatorKey,
    routes: [
      ///======================= Initial Route =======================
      GoRoute(
        name: RoutePath.splashScreen,
        path: RoutePath.splashScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child: const SplashScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.chooseLanguageScreen,
        path: RoutePath.chooseLanguageScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child: ChooseLanguageScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.onboardingScreen,
        path: RoutePath.onboardingScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child: OnboardingScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.welcomeScreen,
        path: RoutePath.welcomeScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child: const WelcomeScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.loginScreen,
        path: RoutePath.loginScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child: const LoginScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.signUpScreen,
        path: RoutePath.signUpScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child: const SignUpScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.forgetPasswordScreen,
        path: RoutePath.forgetPasswordScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child: const ForgetPasswordScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.resetPasswordScreen,
        path: RoutePath.resetPasswordScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child: const ResetPasswordScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.activeOtpScreen,
        path: RoutePath.activeOtpScreen.addBasePath,
        pageBuilder: (context, state) {
          final email = state.extra as String?;
          return _buildPageWithAnimation(
            child: ActiveOtpScreen(email: email),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.forgetOtpScreen,
        path: RoutePath.forgetOtpScreen.addBasePath,
        pageBuilder: (context, state) {
          final email = state.extra as String?;
          return _buildPageWithAnimation(
            child: ForgetOtpScreen(email: email),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.navigationPages,
        path: RoutePath.navigationPages.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child: const NavigationPage(),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.editProfileScreen,
        path: RoutePath.editProfileScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child: const EditProfileScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.claimsScreen,
        path: RoutePath.claimsScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child: const ClaimsScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.helpAndSupportScreen,
        path: RoutePath.helpAndSupportScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child: const HelpAndSupportScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.aboutSomSpotScreen,
        path: RoutePath.aboutSomSpotScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child: const AboutSomSpotScreen(),
            state: state,
          );
        },
      ),
      // GoRoute(
      //   name: RoutePath.completeProfileScreen,
      //   path: RoutePath.completeProfileScreen.addBasePath,
      //   pageBuilder: (context, state) {
      //     return _buildPageWithAnimation(
      //       child: const CompleteProfileScreen(),
      //       state: state,
      //     );
      //   },
      // ),
      // GoRoute(
      //   name: RoutePath.chooseGenderScreen,
      //   path: RoutePath.chooseGenderScreen.addBasePath,
      //   pageBuilder: (context, state) {
      //     return _buildPageWithAnimation(
      //       child: const ChooseGenderScreen(),
      //       state: state,
      //     );
      //   },
      // ),
      // GoRoute(
      //   name: RoutePath.chooseHeightWeightScreen,
      //   path: RoutePath.chooseHeightWeightScreen.addBasePath,
      //   pageBuilder: (context, state) {
      //     return _buildPageWithAnimation(
      //       child: const ChooseHeightWeightScreen(),
      //       state: state,
      //     );
      //   },
      // ),
      // GoRoute(
      //   name: RoutePath.dateOfBirthScreen,
      //   path: RoutePath.dateOfBirthScreen.addBasePath,
      //   pageBuilder: (context, state) {
      //     return _buildPageWithAnimation(
      //       child: const DateOfBirthScreen(),
      //       state: state,
      //     );
      //   },
      // ),
      // GoRoute(
      //   name: RoutePath.thankYouScreen,
      //   path: RoutePath.thankYouScreen.addBasePath,
      //   pageBuilder: (context, state) {
      //     return _buildPageWithAnimation(
      //       child: const ThankYouScreen(),
      //       state: state,
      //     );
      //   },
      // ),
      // GoRoute(
      //   name: RoutePath.subscriptionScreen,
      //   path: RoutePath.subscriptionScreen.addBasePath,
      //   pageBuilder: (context, state) {
      //     return _buildPageWithAnimation(
      //       child: const SubscriptionScreen(),
      //       state: state,
      //     );
      //   },
      // ),
      // GoRoute(
      //   name: RoutePath.navigationPages,
      //   path: RoutePath.navigationPages.addBasePath,
      //   pageBuilder: (context, state) {
      //     return _buildPageWithAnimation(
      //       child: const NavigationPage(),
      //       state: state,
      //     );
      //   },
      // ),
      //
      // //=================Profile ===================
      // GoRoute(
      //   name: RoutePath.editProfileScreen,
      //   path: RoutePath.editProfileScreen.addBasePath,
      //   pageBuilder: (context, state) {
      //     return _buildPageWithAnimation(
      //       child: EditProfileScreen(),
      //       state: state,
      //     );
      //   },
      // ),
      //
      // //=============Setting==========
      // GoRoute(
      //   name: RoutePath.settingScreen,
      //   path: RoutePath.settingScreen.addBasePath,
      //   pageBuilder: (context, state) {
      //     return _buildPageWithAnimation(
      //       child: const SettingScreen(),
      //       state: state,
      //     );
      //   },
      // ),
      // GoRoute(
      //   name: RoutePath.changePasswordScreen,
      //   path: RoutePath.changePasswordScreen.addBasePath,
      //   pageBuilder: (context, state) {
      //     return _buildPageWithAnimation(
      //       child: ChangePasswordScreen(),
      //       state: state,
      //     );
      //   },
      // ),
      // GoRoute(
      //   name: RoutePath.contactAndSupportScreen,
      //   path: RoutePath.contactAndSupportScreen.addBasePath,
      //   pageBuilder: (context, state) {
      //     return _buildPageWithAnimation(
      //       child: const ContactAndSupportScreen(),
      //       state: state,
      //     );
      //   },
      // ),
      //
      // GoRoute(
      //   name: RoutePath.privacyPolicyScreen,
      //   path: RoutePath.privacyPolicyScreen.addBasePath,
      //   pageBuilder: (context, state) {
      //     return _buildPageWithAnimation(
      //       child: PrivacyPolicyScreen(),
      //       state: state,
      //     );
      //   },
      // ),
      // GoRoute(
      //   name: RoutePath.termsAndConditionsScreen,
      //   path: RoutePath.termsAndConditionsScreen.addBasePath,
      //   pageBuilder: (context, state) {
      //     return _buildPageWithAnimation(
      //       child: TermsAndConditionsScreen(),
      //       state: state,
      //     );
      //   },
      // ),
      //
      // GoRoute(
      //   name: RoutePath.healthTrackingScreen,
      //   path: RoutePath.healthTrackingScreen.addBasePath,
      //   pageBuilder: (context, state) {
      //     return _buildPageWithAnimation(
      //       child: const HealthTrackingScreen(),
      //       state: state,
      //     );
      //   },
      // ),
      // GoRoute(
      //   name: RoutePath.bookingsScreen,
      //   path: RoutePath.bookingsScreen.addBasePath,
      //   pageBuilder: (context, state) {
      //     return _buildPageWithAnimation(child: BookingsScreen(), state: state);
      //   },
      // ),
      /*GoRoute(
        name: RoutePath.categoryEventsScreen,
        path: RoutePath.categoryEventsScreen.addBasePath,
        pageBuilder: (context, state) {
          final extra = state.extra;
          final map = (extra is Map<String, dynamic>) ? extra : {};

          final id = map['id'] as String? ?? '';
          final title = map['title'] as String? ?? '';

          return _buildPageWithAnimation(
            child: CategoryEventsScreen(id: id, title: title),
            state: state,
          );
        },
      ),*/
    ],
  );

  static CustomTransitionPage _buildPageWithAnimation({
    required Widget child,
    required GoRouterState state,
  }) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionDuration: const Duration(milliseconds: 400),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        var tween = Tween(begin: begin, end: end);
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }

  static GoRouter get route => initRoute;
}
