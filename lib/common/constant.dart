import 'dart:async';

import 'package:flutter/material.dart';

part 'color.dart';
part 'font.dart';

const kAppName = 'SimpleTodo';
const kNewUser = 'Nur Fajar';
const kDefaultPadding = 18.0;
const kTodo = 'TO DO';
const kInprogress = 'IN PROGRESS';
const kComplete = 'COMPLETE';

var kShadow = BoxShadow(
  color: const Color.fromARGB(255, 130, 115, 156).withOpacity(0.2),
  spreadRadius: kDefaultPadding / 4,
  blurRadius: kDefaultPadding / 3,
  offset: const Offset(0, kDefaultPadding / 5),
);

final StreamController streamController = StreamController();
