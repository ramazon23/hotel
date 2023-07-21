import '../data/db_service.dart';
import '../data/fake_db.dart';
import '../models/room.dart';

class BLController {
  final DBService db;

  const BLController() : db = const FakeDB();

  Room? getFirstNotBusyRoom(int personCount) => _getRoom((e) => e.personCount == personCount);

  Room? getFirstLuxRoom() => _getRoom((e) => e.isLux);

  Room? _getRoom(bool Function(Room e) filter) {
    List<Room> rooms = db.getAllRooms();

    List<Room> result = rooms.where(filter).toList();

    Room? room;

    for (var e in result) {
      if (!e.isBusy) {
        room = e;
        break;
      }
    }

    if (room != null) {
      room.isBusy = true;
    }

    return room;
  }

  void changeOccupancy(int roomNumber) {
    db.changeRoomOccupancy(roomNumber);
  }

  List<Room> showDB() => db.getAllRooms();
}
