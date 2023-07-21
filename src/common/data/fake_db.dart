import '../models/room.dart';
import 'db_service.dart';

class FakeDB implements DBService {
  const FakeDB();

  @override
  List<Room> getAllRooms() => _fakeData;

  @override
  List<Room> getLuxRooms() => _fakeData.where((e) => e.isLux).toList();

  @override
  List<Room> getNotBusyRooms() => _fakeData.where((e) => !e.isBusy).toList();

  @override
  Room getRoom(int roomNumber) => _fakeData.firstWhere((e) => e.roomNumber == roomNumber);

  @override
  List<Room> getRoomFromPrice(int startPrice, int endPrice) => _fakeData
      .where(
        (e) => e.roomPrice >= startPrice && e.roomPrice <= endPrice,
      )
      .toList();

  @override
  void changeRoomOccupancy(int roomNumber) {
    final room = getRoom(roomNumber);

    room.isBusy = !room.isBusy;
  }
}

List<Room> _fakeData = [
  Room(roomNumber: 1, personCount: 1, roomPrice: 100, isBusy: false, isLux: false),
  Room(roomNumber: 2, personCount: 1, roomPrice: 100, isBusy: true, isLux: false),
  Room(roomNumber: 3, personCount: 1, roomPrice: 100, isBusy: false, isLux: false),
  Room(roomNumber: 4, personCount: 2, roomPrice: 150, isBusy: true, isLux: false),
  Room(roomNumber: 5, personCount: 2, roomPrice: 150, isBusy: false, isLux: false),
  Room(roomNumber: 6, personCount: 2, roomPrice: 150, isBusy: false, isLux: false),
  Room(roomNumber: 7, personCount: 3, roomPrice: 250, isBusy: false, isLux: false),
  Room(roomNumber: 8, personCount: 3, roomPrice: 250, isBusy: false, isLux: false),
  Room(roomNumber: 9, personCount: 4, roomPrice: 500, isBusy: false, isLux: true),
  Room(roomNumber: 10, personCount: 4, roomPrice: 500, isBusy: true, isLux: true),
];
