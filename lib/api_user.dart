// import 'dart:convert';

// Card cardFromJson(String str) => Card.fromJson(json.decode(str));

// String cardToJson(Card data) => json.encode(data.toJson());

// class Card {
//     Card({
//         required this.status,
//         required this.data,
//         required this.message,
//     });

//     String status;
//     List<Datum> data;
//     String message;

//     factory Card.fromJson(Map<String, dynamic> json) => Card(
//         status: json["status"],
//         data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//         message: json["message"],
//     );

//     Map<String, dynamic> toJson() => {
//         "status": status,
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//         "message": message,
//     };
// }

// class Datum {
//     Datum({
//         required this.id,
//         required this.bookingStatus,
//         required this.address,
//         required this.notes,
//         required this.employee,
//         required this.bookingAt,
//         required this.startAt,
//         required this.endAt,
//         required this.createdAt,
//     });

//     int id;
//     String bookingStatus;
//     String address;
//     String notes;
//     String employee;
//     String bookingAt;
//     String startAt;
//     String endAt;
//     DateTime createdAt;

//     factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         id: json["id"],
//         bookingStatus: json["booking_status"],
//         address: json["address"],
//         notes: json["notes"],
//         employee: json["employee"],
//         bookingAt: json["booking_at"],
//         startAt: json["start_at"],
//         endAt: json["end_at"],
//         createdAt: DateTime.parse(json["created_at"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "booking_status": bookingStatus,
//         "address": address,
//         "notes": notes,
//         "employee": employee,
//         "booking_at": bookingAt,
//         "start_at": startAt,
//         "end_at": endAt,
//         "created_at": createdAt.toIso8601String(),
//     };
// }// To parse this JSON data, do
//
//     final apiuser = apiuserFromJson(jsonString);

import 'dart:convert';

Apiuser apiuserFromJson(String str) => Apiuser.fromJson(json.decode(str));

String apiuserToJson(Apiuser data) => json.encode(data.toJson());

class Apiuser {
    Apiuser({
        required this.status,
        required this.data,
        required this.message,
    });

    String status;
    List<Datum> data;
    String message;

    factory Apiuser.fromJson(Map<String, dynamic> json) => Apiuser(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
    };
}

class Datum {
    Datum({
        required this.id,
        required this.bookingStatus,
        required this.address,
        required this.notes,
        required this.employee,
        required this.bookingAt,
        required this.startAt,
        required this.endAt,
        required this.createdAt,
    });

    int id;
    String bookingStatus;
    String address;
    String notes;
    String employee;
    String bookingAt;
    String startAt;
    String endAt;
    DateTime createdAt;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        bookingStatus: json["booking_status"],
        address: json["address"],
        notes: json["notes"],
        employee: json["employee"],
        bookingAt: json["booking_at"],
        startAt: json["start_at"],
        endAt: json["end_at"],
        createdAt: DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "booking_status": bookingStatus,
        "address": address,
        "notes": notes,
        "employee": employee,
        "booking_at": bookingAt,
        "start_at": startAt,
        "end_at": endAt,
        "created_at": createdAt.toIso8601String(),
    };
}


