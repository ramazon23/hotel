import 'navigator.dart';

Navigator navigator = Navigator();

abstract class Widget {
  const Widget();

  void build();
}

void runApp(Widget app) {
  navigator.push(app);

  while (navigator.pages.isNotEmpty) {
    navigator.pages.last.build();
  }
}
