import 'package:get/get.dart';
import 'package:simple_todo/view/splash/splash_binding.dart';
import 'package:simple_todo/view/splash/splash_screen.dart';

const splashRoute = '/splash';
const loginRoute = '/login';

// region dashboard
const homeRoute = '/dashboard/home';
const createTodoRoute = '/dashboard/create_task';
const aboutMeRoute = '/dashboard/about_me';
// endregion

var route = [
  GetPage(
    name: splashRoute,
    page: () => SplashScreen(),
    binding: SplashBinding(),
  ),
];
