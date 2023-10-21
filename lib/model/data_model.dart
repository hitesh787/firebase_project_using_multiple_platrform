import 'package:cloud_firestore/cloud_firestore.dart';


class CustomData {
  String? uid;
  String? name;
  String? phoneNumber;
  String? address;
  DateTime? createAtTime;
  DateTime? updateAtTime;
  dynamic timestamp;


  CustomData({
    this.uid,
    this.name,
    this.phoneNumber,
    this.address,
    this.createAtTime,
    this.updateAtTime,
    this.timestamp
  });




  /// *******************************  Get To data for firebase fire store in Screen Ui ******************************* ///
  factory CustomData.fromFireStore(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    print("Date time :: ${data?['createAtTime']}");
    return CustomData(
      uid: snapshot.id,
      name: data?['name'],
      phoneNumber: data?['phoneNumber'],
      address: data?['address'],
      createAtTime: DateTime.fromMicrosecondsSinceEpoch(data?['createAtTime'].millisecondsSinceEpoch * 1000),
      updateAtTime: data?['updateAtTime'] != null ? DateTime.fromMicrosecondsSinceEpoch(data?['updateAtTime'].millisecondsSinceEpoch*1000) : data?['updateAtTime'],
      timestamp: data?['timestamp'] != null ? DateTime.fromMicrosecondsSinceEpoch(data?['timestamp'].millisecondsSinceEpoch*1000): data?['timestamp'],
    );
  }




  /// *******************************  Store To data for firebase fire store  ******************************* ///
  Map<String, dynamic> toFireStore() {
    return {
      if (name != null) "name": name,
      if (phoneNumber != null) "phoneNumber": phoneNumber,
      if (address != null) "address": address,
      if (createAtTime != null) "createAtTime": createAtTime,
      if (updateAtTime != null) "updateAtTime": updateAtTime,
      if (timestamp != null) "timestamp": timestamp,
    };
  }

}
