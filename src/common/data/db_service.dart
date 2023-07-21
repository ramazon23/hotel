import '../models/room.dart';

abstract interface class DBService {
  List<Room> getRoomFromPrice(int startPrice, int endPrice);

  List<Room> getNotBusyRooms();

  List<Room> getAllRooms();

  List<Room> getLuxRooms();

  Room getRoom(int roomNumber);

  void changeRoomOccupancy(int roomNumber);
}
