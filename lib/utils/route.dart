import 'package:get/get.dart';
import 'package:simple_todo/view/home/home_binding.dart';
import 'package:simple_todo/view/home/home_screen.dart';
import 'package:simple_todo/view/splash/splash_binding.dart';
import 'package:simple_todo/view/splash/splash_screen.dart';

const splashRoute = '/splash';
const homeRoute = '/dashboard/home';
const createTodoRoute = '/dashboard/create_task';
const aboutMeRoute = '/dashboard/about_me';

var route = [
  GetPage(
    name: splashRoute,
    page: () => SplashScreen(),
    binding: SplashBinding(),
  ),
  GetPage(
      name: homeRoute, page: () => const HomeScreen(), binding: HomeBinding()),
];
