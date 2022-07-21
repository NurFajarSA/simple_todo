import 'package:get/get.dart';
import 'package:simple_todo/common/constant.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutDevController extends GetxController {
  gotoMoreAboutDev() async {
    if (!await launchUrl(Uri.parse(kDevUrl))) throw 'Could not launch to link';
  }
}
