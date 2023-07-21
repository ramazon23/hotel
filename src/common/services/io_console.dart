import 'dart:io';

import 'io_service.dart';

class IOConsole implements IOService {
  @override
  void w(String text) => stdout.write(text);

  @override
  String r() => stdin.readLineSync() ?? '';

  @override
  String wr(String text) {
    w("$text :");
    return stdin.readLineSync() ?? '';
  }

  @override
  int wrInt(String text) {
    w("$text :");
    return int.parse(stdin.readLineSync() ?? '0');
  }

  @override
  void clear() => stdout.write("\x1B[2J\x1B[0;0H");

  @override
  void stop({int seconds = 2}) => sleep(Duration(seconds: seconds));
}
