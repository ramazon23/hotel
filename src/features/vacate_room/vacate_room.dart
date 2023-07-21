import '../../common/controller/logic_controller.dart';
import '../../common/services/io_service.dart';
import '../../common/widget/widget.dart';

class VacateRoom extends Widget {
  final IOService io;
  final BLController controller;

  VacateRoom(this.io, this.controller);

  @override
  void build() {
    io.clear();

    int result = io.wrInt("Topshirmoqchi bo'lgan xonaning raqamini kiriting");

    result = _isValidInput(result, start: 1, end: 10);

    controller.changeOccupancy(result);

    io.w("Sizning xonangiz bo'shatildi");

    io.stop();

    navigator.pop();
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
