import 'package:cloud_firestore/cloud_firestore.dart';

class BookingSectionModel {
  final String hotelId;
  final String bookId;
  final String roomId;
  final int age;
  final String name;
  final int numberOfAdults;
  final int numberOfChilds;
  final String userId;
  final DateTime startdate;
  final DateTime enddate;
  final double paidAmount;

  BookingSectionModel({
    required this.hotelId,
    required this.bookId,
    required this.roomId,
    required this.age,
    required this.name,
    required this.numberOfAdults,
    required this.numberOfChilds,
    required this.userId,
    required this.startdate,
    required this.enddate,
    required this.paidAmount,
  });

  factory BookingSectionModel.fromMap(
    Map<String, dynamic> map,
  ) {
    final res = map['bookingDetails'];
    return BookingSectionModel(
      hotelId: map['hotelId'] ?? '',
      bookId: map['bookingId'] ?? '',
      roomId: res['cuid'] ?? '',
      age: res['age'] ?? 0,
      name: res['name'] ?? '',
      numberOfAdults: res['noa'] ?? 0,
      numberOfChilds: res['noc'] ?? 0,
      userId: res['userId'] ?? '',
      paidAmount: res['paidAmount'] ?? 0,
      // startdate: (res['startdate']) ?? DateTime.now(),
      // enddate: (res['enddate']) ?? DateTime.now(),
      startdate: (res['startdate'] != null && res['startdate'] is Timestamp)
          ? (res['startdate'] as Timestamp).toDate()
          : DateTime.now(),
      enddate: (res['enddate'] != null && res['enddate'] is Timestamp)
          ? (res['enddate'] as Timestamp).toDate()
          : DateTime.now(),
    );
  }
}
