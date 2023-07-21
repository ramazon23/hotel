class Room {
  final int roomNumber;
  final int personCount;
  final double roomPrice;
  bool isBusy;
  final bool isLux;

  Room({
    required this.roomNumber,
    required this.personCount,
    required this.roomPrice,
    required this.isBusy,
    required this.isLux,
  });

  String info() => "$roomNumber\tPerson Count: $personCount\tprice: $roomPrice\tLux: $isLux\tBusy: $isBusy";
}
