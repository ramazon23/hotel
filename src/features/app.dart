import '../common/controller/logic_controller.dart';
import '../common/models/room.dart';
import '../common/services/io_service.dart';
import '../common/widget/widget.dart';
import 'take_room/take_room.dart';
import 'vacate_room/vacate_room.dart';

class App extends Widget {
  final IOService io;
  final BLController controller;

  const App(this.io) : controller = const BLController();

  @override
  void build() {
    io.clear();
    int result = io.wrInt("""
\tHushkelibsiz!
1. Xona olish
2. Xonanani bo'shatish
3. Show Info
\n""");

    result = _isValidInput(result);

    switch (result) {
      case 1:
        navigator.push(TakeRoom(io, controller));
      case 2:
        navigator.push(VacateRoom(io, controller));
      case 3:
        {
          List<Room> rooms = controller.showDB();

          io.w("\n\n");

          for (var e in rooms) {
            io.w(e.info() + "\n");
          }

          io..stop(seconds: 4);

          navigator
            ..pop()
            ..push(App(io));
        }
    }
  }

  int _isValidInput(int result, {int start = 1, int end = 3}) {
    while (true) {
      if (result >= start && result <= end) {
        break;
      }
      result = io.wrInt("\nHato kiritildi boshqa raqam kiriting");
    }

    return result;
  }
}
