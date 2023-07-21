import '../../common/controller/logic_controller.dart';
import '../../common/models/room.dart';
import '../../common/services/io_service.dart';
import '../../common/widget/widget.dart';

class TakeRoom extends Widget {
  final IOService io;
  final BLController controller;

  late int dayCount;

  TakeRoom(this.io, this.controller);

  @override
  void build() {
    io.clear();

    int result = io.wrInt("""
Necha kishilik xona kerak?

1. Bir kishilik
2. Ikki kishilik
3. Uch kishilik
4. Lux

0. Ortga qaytish.
\n""");

    result = _isValidInput(result);

    dayCount = io.wrInt("Necha kun turmoqchisiz:");

    dayCount = _isValidInput(dayCount, start: 1, end: 100);

    switch (result) {
      case 1:
      case 2:
      case 3:
        forPersons(result);
      case 4:
        forPersons(result, isLux: true);
      case 0:
        navigator.pop();
    }
  }

  void forPersons(personCount, {bool isLux = false}) {
    Room? room = isLux ? controller.getFirstLuxRoom() : controller.getFirstNotBusyRoom(personCount);

    if (room != null) {
      io.w("""
Sizning xonangiz: ${room.roomNumber}
Xonaning narxi: ${room.roomPrice}
Umumiy summa: ${(room.roomPrice * dayCount).toStringAsFixed(2)}
""");

      io.stop();
      navigator.pop();
    } else {
      io.w("Sizning talabingizdagi honalar band");

      io.stop();

      navigator
        ..pop()
        ..push(
          TakeRoom(io, controller),
        );
    }
  }

  int _isValidInput(int result, {int start = 0, int end = 4}) {
    while (true) {
      if (result >= start && result <= end) {
        break;
      }
      result = io.wrInt("\nHato kiritildi boshqa raqam kiriting");
    }

    return result;
  }
}
