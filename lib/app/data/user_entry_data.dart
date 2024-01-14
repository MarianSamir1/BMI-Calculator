import 'dart:developer';

import 'package:bmi_calculation/app/models/user_entry_model.dart';
import 'package:bmi_calculation/network/shared_preferences/cash_helper.dart';
import 'package:bmi_calculation/utilities/constants/chash_keys.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/response_handler_model.dart';

class UserData {
  static CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');
  static String userId = ChachHelper.getData(key: CasheKeys.uid);

  //=========================== add New Entry ===========================
  static Future<ResponseHandlerClass> addNewEntry(
      {required UserEntryModel newEntry}) async {
    try {
      // If the document doesn't exist, create a new one
      await usersCollection
          .doc(userId)
          .collection("entries")
          .doc(newEntry.currentDate.toString())
          .set(newEntry.toJson());
      return ResponseHandlerClass(errorFlag: false);
    } catch (e) {
      log("================= addNewEntry throw Exception ${e.toString()} =============");
      return ResponseHandlerClass(
        errorFlag: true,
        errorMessage: e.toString(),
      );
    }
  }

  //=========================== update Entry ===========================
  static Future<ResponseHandlerClass> updateSpecificEntry(
      {required UserEntryModel newEntry, required String entryId}) async {
    try {
      // Update the document with the modified list
      DocumentReference entryReference = FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .collection("entries")
          .doc(entryId);

      await entryReference.update(newEntry.toJson());
      return ResponseHandlerClass(errorFlag: false);
    } catch (e) {
      log("================= updateSpecificEntry throw Exception ${e.toString()} =============");
      return ResponseHandlerClass(
        errorFlag: true,
        errorMessage: e.toString(),
      );
    }
  }

  //=========================== delete Entry ===============================
  static Future<ResponseHandlerClass> deleteSpecificEntry(
      String entryId) async {
    try {
      log("entryId : $entryId");
      DocumentReference entryReference = FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .collection("entries")
          .doc(entryId);

      await entryReference.delete();
      return ResponseHandlerClass(errorFlag: false);
    } catch (e) {
      log("================= deleteSpecificEntry throw Exception ${e.toString()} =============");
      return ResponseHandlerClass(errorFlag: true);
    }
  }

  //=========================== delet All Entries ===========================
  static Future<void> deleteAllEntries() async {
    try {
      CollectionReference entriesCollection = FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .collection("entries");

      QuerySnapshot entriesSnapshot = await entriesCollection.get();

      for (QueryDocumentSnapshot entryDocument in entriesSnapshot.docs) {
        await entryDocument.reference.delete();
      }
    } catch (e) {
      log("================= deleteAllEntries throw Exception ${e.toString()} =============");
    }
  }
}
