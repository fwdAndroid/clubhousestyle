import 'package:cloud_firestore/cloud_firestore.dart';

class RegistrationModel {
  String uid;
  String email;
  String fullname;
  String? contactno;
  String? address;
  String? photoUrl;

  RegistrationModel(
      {required this.uid,
      required this.email,
      required this.fullname,
      this.address,
      this.contactno,
      this.photoUrl});

  ///Converting OBject into Json Object
  Map<String, dynamic> toJson() => {
        'fullname': fullname,
        'uid': uid,
        'email': email,
        'contactno': contactno,
        'address': address,
        'photoUrl': photoUrl,
      };

  ///
  static RegistrationModel fromSnap(DocumentSnapshot snaps) {
    var snapshot = snaps.data() as Map<String, dynamic>;

    return RegistrationModel(
      uid: snapshot['uid'],
      email: snapshot['email'],
      fullname: snapshot['fullname'],
      contactno: snapshot['contactno'],
      address: snapshot['address'],
      photoUrl: snapshot['photoUrl'],
    );
  }
}
