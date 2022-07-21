import 'package:get/get.dart';
import 'package:simple_todo/controller/stream_controller.dart';
import 'package:simple_todo/view/about_dev/about_dev_binding.dart';
import 'package:simple_todo/view/about_dev/about_dev_screen.dart';
import 'package:simple_todo/view/create_task/create_task_binding.dart';
import 'package:simple_todo/view/create_task/create_task_screen.dart';
import 'package:simple_todo/view/home/home_binding.dart';
import 'package:simple_todo/view/home/home_screen.dart';
import 'package:simple_todo/view/splash/splash_binding.dart';
import 'package:simple_todo/view/splash/splash_screen.dart';

const splashRoute = '/splash';
const homeRoute = '/dashboard/home';
const createTaskRoute = '/dashboard/create_task';
const aboutDevRoute = '/dashboard/about_dev';

var route = [
  GetPage(
    name: splashRoute,
    page: () => const SplashScreen(),
    binding: SplashBinding(),
    transition: Transition.fade,
  ),
  GetPage(name: homeRoute, page: () => HomeScreen(), binding: HomeBinding()),
  GetPage(
    name: createTaskRoute,
    page: () => CreateTaskScreen(
      stream: createTaskStreamController.stream,
    ),
    binding: CreateTaskBinding(),
    transition: Transition.downToUp,
  ),
  GetPage(
      name: aboutDevRoute,
      page: () => AboutDevScreen(),
      binding: AboutDevBinding(),
      transition: Transition.rightToLeft),
];
