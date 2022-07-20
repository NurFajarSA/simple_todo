import 'package:flutter/material.dart';
import 'package:simple_todo/common/constant.dart';
import 'package:simple_todo/controller/stream_controller.dart';
import 'package:simple_todo/view/home/widgets/card_header.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 180,
        color: kWhitebg,
        child: Stack(children: [
          Image.asset(
            'assets/images/header_bg.png',
            width: MediaQuery.of(context).size.width,
          ),
          Positioned(
              top: kDefaultPadding * 3 / 2,
              width: MediaQuery.of(context).size.width,
              child: CardHeader(
                stream: headerStreamController.stream,
              )),
        ]));
  }
}
