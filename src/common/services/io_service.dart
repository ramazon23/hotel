abstract interface class IOService {
  void w(String text);

  String r();

  String wr(String text);

  int wrInt(String text);

  void stop({int seconds});

  void clear();
}
