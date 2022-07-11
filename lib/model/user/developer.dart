import 'package:simple_todo/model/user/user.dart';

class Developer extends User {
  static const String _name = "Nur Fajar Sayyidul Ayyam";
  static const String _role = "Mobile Developer - UI/UX Designer";
  static const String _nickname = "Fajar";
  static const String _hobby = "Code";
  static const String _institution = "University of Indonesia";

  Developer() : super(name: _name);

  get role => _role;
  get nickname => _nickname;
  get hobby => _hobby;
  get institution => _institution;
}
