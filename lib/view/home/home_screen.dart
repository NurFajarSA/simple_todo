import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_todo/common/constant.dart';
import 'package:simple_todo/view/home/controller/home_controller.dart';
import 'package:simple_todo/view/home/widgets/header.dart';
import 'package:simple_todo/view/home/widgets/section_task.dart';
import 'package:simple_todo/widgets/button/custom_fab.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final _controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kWhitebg,
      child: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
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
                    onPressed: () {},
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
                    Header(),
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
                _controller.createTask();
              },
            ),
          ),
        ),
      ),
    );
  }
}
