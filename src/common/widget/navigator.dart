import 'widget.dart';

class Navigator {
  List<Widget> pages = [];

  void push(Widget page) {
    pages.add(page);
  }

  void pop() {
    pages.removeLast();
  }
}
