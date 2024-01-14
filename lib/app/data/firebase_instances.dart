import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseInstance {
  //instance for authintcations
  static FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  //instance for access cloud firestore database
  static FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
}
