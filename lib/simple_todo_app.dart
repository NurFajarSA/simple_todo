import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:simple_todo/common/constant.dart';
import 'package:simple_todo/utils/bindings.dart';
import 'package:simple_todo/utils/route.dart';

class SimpleTodoApp extends StatefulWidget {
  const SimpleTodoApp({Key? key}) : super(key: key);

  @override
  State<SimpleTodoApp> createState() => _SimpleTodoAppState();
}

class _SimpleTodoAppState extends State<SimpleTodoApp> {
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: kPrimaryColor,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return GetMaterialApp(
      title: "SimpleTodo",
      theme: Theme.of(context).copyWith(
          colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: kPrimaryColor,
        onPrimary: kWhite,
        secondary: kPrimaryColor,
        onSecondary: kDark,
        background: kWhitebg,
        onBackground: kDark,
        onSurface: kDark,
        surface: kWhite,
        error: kDanger,
        onError: kWhite,
      )),
      getPages: route,
      initialBinding: InitialBindings(),
      initialRoute: splashRoute,
    );
  }
}
