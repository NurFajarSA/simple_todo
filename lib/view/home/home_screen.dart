import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:simple_todo/common/constant.dart';
import 'package:simple_todo/controller/stream_controller.dart';
import 'package:simple_todo/view/home/controller/home_controller.dart';
import 'package:simple_todo/view/home/widgets/header.dart';
import 'package:simple_todo/view/home/widgets/section_task.dart';
import 'package:simple_todo/view/widgets/button/custom_fab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = Get.find<HomeController>();
  final Stream stream = cardTaskStreamController.stream;

  @override
  void initState() {
    super.initState();
    stream.listen((data) {
      mySetState();
    });
  }

  void mySetState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kWhitebg,
      child: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: kPrimaryColor,
                statusBarBrightness: Brightness.light,
                statusBarIconBrightness: Brightness.light,
              ),
              shadowColor: Colors.transparent,
              backgroundColor: kPrimaryColor,
              title: Row(
                children: [
                  Image.asset('assets/icons/logo_icon.png'),
                  const SizedBox(width: kDefaultPadding / 2),
                  Text('Simple', style: kHeading.copyWith(color: kWhite)),
                  Text(
                    'Todo',
                    style: kHeading.copyWith(color: kSecondaryBlue),
                  ),
                ],
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding / 2),
                  child: IconButton(
                    icon: Image.asset('assets/icons/person_icon.png'),
                    color: kWhite,
                    onPressed: () {
                      _controller.gotoAboutDev();
                    },
                  ),
                ),
              ],
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(232),
                child: Column(
                  children: [
                    TabBar(
                      tabs: const [
                        Tab(text: 'To Do'),
                        Tab(text: 'In Progress'),
                        Tab(text: 'Complete'),
                      ],
                      indicator: const UnderlineTabIndicator(
                        borderSide: BorderSide(
                          color: kWhite,
                          width: 2,
                        ),
                        insets: EdgeInsets.symmetric(
                            horizontal: kDefaultPadding * 3,
                            vertical: kDefaultPadding / 2),
                      ),
                      labelColor: kWhite,
                      labelStyle:
                          kBodyPoppins.copyWith(fontFamily: 'poppins-semibold'),
                      unselectedLabelColor: kWhite.withOpacity(0.8),
                      unselectedLabelStyle: kBodyPoppins,
                      indicatorColor: kWhite,
                      indicatorWeight: 1.0,
                    ),
                    const Header(),
                  ],
                ),
              ),
            ),
            body: TabBarView(
              children: [
                SectionTask(section: kTodo),
                SectionTask(section: kInprogress),
                SectionTask(section: kComplete),
              ],
            ),
            floatingActionButton: CustomFab(
              title: 'Add task',
              icon: const Icon(
                Icons.add_circle_rounded,
                color: kWhite,
              ),
              onPressed: () {
                _controller.gotoCreateTask();
              },
            ),
          ),
        ),
      ),
    );
  }
}
