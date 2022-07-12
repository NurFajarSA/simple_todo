import 'package:flutter/material.dart';
import 'package:simple_todo/common/constant.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Image.asset(
            'assets/images/empty_state.png',
            scale: 2.0,
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          Text("There are no tasks to complete",
              style: kSubHeading.copyWith(color: kPrimaryColor)),
          const SizedBox(
            height: 4,
          ),
          Text(
            "Start to create a new task",
            style: kBodyInter.copyWith(color: kDark),
          )
        ],
      ),
    );
  }
}
