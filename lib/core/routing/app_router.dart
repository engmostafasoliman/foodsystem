import 'package:foodsystem/core/DI/dependency_injection.dart';
import 'package:foodsystem/core/routing/routes.dart';
import 'package:foodsystem/features/home/ui/home_screen.dart';
import 'package:foodsystem/features/login/logic/cubit/login_cubit.dart';
import 'package:foodsystem/features/login/ui/login_screen.dart';
import 'package:foodsystem/features/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import '../../features/signup/logic/sign_up_cubit.dart';
import '../../features/signup/ui/sign_up_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(
          builder: (_) {
            FlutterNativeSplash.remove();
            return OnBoardingScreen();
          },
        );
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.signup:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignUpCubit>(),
            child: const SignUpScreen(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('No Route Found'))),
        );
    }
  }
}
