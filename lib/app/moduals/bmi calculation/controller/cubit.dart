import 'dart:developer';

import 'package:bmi_calculation/app/data/bmi_calculation.dart';
import 'package:bmi_calculation/app/data/firebase_auth.dart';
import 'package:bmi_calculation/app/data/user_entry_data.dart';
import 'package:bmi_calculation/app/models/user_entry_model.dart';
import 'package:bmi_calculation/network/shared_preferences/cash_helper.dart';
import 'package:bmi_calculation/utilities/components/alerts/toast.dart';
import 'package:bmi_calculation/utilities/constants/chash_keys.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/response_handler_model.dart';
import 'states.dart';

class BMICalculationCubit extends Cubit<BMICalculationState> {
  BMICalculationCubit() : super(InitialBMICalculationState());

  static BMICalculationCubit get(context) => BlocProvider.of(context);

  TextEditingController ageController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  TextEditingController ageEditController = TextEditingController();
  TextEditingController heightEditController = TextEditingController();
  TextEditingController weightEditController = TextEditingController();
  GlobalKey<FormState> formKey =  GlobalKey<FormState>();
  GlobalKey<FormState> editFormKey =  GlobalKey<FormState>();

  signOutFun() async {
    emit(SiginOutLoadingState());
    bool siginOutResponce = await FirebaseAuthentication.signOut();
    if (siginOutResponce) {
      emit(SiginOutSuccessState());
    } else {
      emit(SiginOutErrorState());
    }
  }

  double bmi = 0;
  calculateBMIFun() async {
    bmi = BMICalculationData.calculateBMI(
      height: double.parse(heightController.text),
      weight: double.parse(weightController.text),
    );
    log("========== BMI Value = $bmi ================");
    log("========== BMI Status = ${BMICalculationData.getBMIStatus(bmi: bmi)} ================");

    emit(CalculateBMISuccessState());
    await addNewEntryFun();
  }

  ResponseHandlerClass? addNewUserEntryResponse;
  addNewEntryFun() async {
    addNewUserEntryResponse = null;
    emit(AddNewEntryLoadingState());
    addNewUserEntryResponse = await UserData.addNewEntry(
      newEntry: UserEntryModel(
        age: ageController.text,
        height: heightController.text,
        weight: weightController.text,
        bmiValue: bmi.toString(),
        bmiStatus: BMICalculationData.getBMIStatus(bmi: bmi),
        currentDate: DateTime.now(),
      ),
    );
    if (addNewUserEntryResponse!.errorFlag == false) {
      emit(AddNewEntrySuccessState());
    } else {
      showToast(
        msg: "Somethig Went wrong when add user entry",
        state: ToastStates.ERROR,
      );
      emit(AddNewEntryErrorState());
    }
  }

  List<UserEntryModel> userEntriesList = [];
  passEntriesToUserFromJsonFun({required List entriesList}) async {
    userEntriesList = [];
    log("$entriesList");
    for (var v in entriesList) {
      userEntriesList.add(UserEntryModel.fromJson(v));
    }
  }

  setNewEntriesEditController({required int index}) {
    ageEditController.text = userEntriesList[index].age!;
    heightEditController.text = userEntriesList[index].height!;
    weightEditController.text = userEntriesList[index].weight!;
    emit(SetEditControllerSuccessState());
  }

  ResponseHandlerClass? updateSpecificResponse;
  updateSpecificEntryFun({required int index ,required BuildContext context}) async {
    emit(UpdateSpecificLoadingState());
    double bmi = BMICalculationData.calculateBMI(
      height: double.parse(heightEditController.text),
      weight: double.parse(weightEditController.text),
    );
    updateSpecificResponse = await UserData.updateSpecificEntry(
      newEntry: UserEntryModel(
        age: ageEditController.text,
        height: heightEditController.text,
        weight: weightEditController.text,
        bmiValue: bmi.toString(),
        bmiStatus: BMICalculationData.getBMIStatus(bmi: bmi),
      ),
      entryId: userEntriesList[index].currentDate!.toString(),
    );
    if (updateSpecificResponse!.errorFlag == false) {
        Navigator.pop(context);
      emit(UpdateSpecificSuccessState());
    } else {
      emit(UpdateSpecificErrorState());
    }
  }

  DocumentSnapshot? lastDocument;
  void fetchNextPage() async {
    if (lastDocument != null) {
      QuerySnapshot nextPage = await FirebaseFirestore.instance
          .collection("users")
          .doc(ChachHelper.getData(key: CasheKeys.uid))
          .collection("entries")
          //  .orderBy("current_date", descending: true)
          .startAfterDocument(lastDocument!)
          .limit(10)
          .get();

      List<Object?> nextEntries =
          nextPage.docs.map((doc) => doc.data()).toList();
      passEntriesToUserFromJsonFun(entriesList: nextEntries);
      lastDocument = nextPage.docs.last;
      emit(GetNextEntriesSuccessState());
    }
  }

  ResponseHandlerClass? deleteSpecificResponse;
  deleteSpecificEntryFun({required int index}) async {
    deleteSpecificResponse = null;
    emit(DeleteSpecificEntryLoadingState());
    deleteSpecificResponse = await UserData.deleteSpecificEntry(
        userEntriesList[index].currentDate!.toString());

    if (deleteSpecificResponse!.errorFlag == false) {
      emit(DeleteSpecificEntrySuccessState());
    } else {
      showToast(
        msg: "Somethig Went wrong when delete this entry",
        state: ToastStates.ERROR,
      );
      emit(DeleteSpecificEntryErrorState());
    }
  }
}
