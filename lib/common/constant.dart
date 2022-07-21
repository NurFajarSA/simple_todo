import 'package:flutter/material.dart';

part 'color.dart';
part 'font.dart';

const kAppName = 'SimpleTodo';
const kDevName = 'Nur Fajar Sayyidul Ayyam';
const kDevRole = 'Mobile Developer - UI/UX Designer';
const kDevDesc =
    'An Information systems student at Universitas Indonesia is entering the third semester, a person who never stops learning about technology, structured, trying new things, improving themselves in challenges, taking opportunities that come, and always trying to exceed boundaries.';
const kDevUrl = 'https://biolinky.co/nfajarsa';
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
