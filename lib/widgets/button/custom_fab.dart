import 'package:flutter/material.dart';
import 'package:simple_todo/common/constant.dart';

class CustomFab extends StatelessWidget {
  const CustomFab(
      {Key? key, this.title, required this.icon, required this.onPressed})
      : super(key: key);
  final title;
  final Icon icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: FloatingActionButton.extended(
        onPressed: onPressed,
        backgroundColor: kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kDefaultPadding / 3 * 2),
        ),
        label: Text(
          title ?? '',
          style: kSubHeading.copyWith(color: kWhite),
        ),
        icon: icon,
      ),
    );
  }
}
