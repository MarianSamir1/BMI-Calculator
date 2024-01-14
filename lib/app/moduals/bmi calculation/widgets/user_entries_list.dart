import 'package:bmi_calculation/app/moduals/bmi%20calculation/controller/cubit.dart';
import 'package:bmi_calculation/app/moduals/bmi%20calculation/widgets/edit_bottom_sheet.dart';
import 'package:bmi_calculation/utilities/components/other/circular_progress.dart';
import 'package:bmi_calculation/utilities/components/other/custom_text.dart';
import 'package:bmi_calculation/utilities/styles/colors.dart';
import 'package:bmi_calculation/utilities/styles/fonts.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculation/network/shared_preferences/cash_helper.dart';
import 'package:bmi_calculation/utilities/constants/chash_keys.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class UserEntriesList extends StatelessWidget {
  const UserEntriesList({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BMICalculationCubit.get(context);
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("users")
          .doc(ChachHelper.getData(key: CasheKeys.uid))
          .collection("entries")
          .limit(10)
          .snapshots(),
      builder: (context, snapshot) {
        //error
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          // While data is being fetched, you can show a loading indicator
          return const CustomCircularProgressIndicator();
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          // If there is no data, or the data is empty, show a message or widget
          return const Text('No data available');
        }
        //loading
        if (!snapshot.hasData) {
          return const Center(child: CustomCircularProgressIndicator());
        }

        //pass list of entries to fromJson
        cubit.passEntriesToUserFromJsonFun(
            entriesList: snapshot.data!.docs.map((doc) => doc.data()).toList());
        //sucess
        return Column(
          children: [
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              reverse: true,
              itemCount: cubit.userEntriesList.length,
              separatorBuilder: (context, index) => const Divider(
                color: ColorManager.grey828,
              ),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                      'BMI value: ${double.parse(cubit.userEntriesList[index].bmiValue!).toStringAsFixed(1)}'),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: 'Age ${cubit.userEntriesList[index].age}'
                            '\nHeight: ${cubit.userEntriesList[index].height}'
                            '\nWeight: ${cubit.userEntriesList[index].weight}'
                            '\nBMI Status: ${cubit.userEntriesList[index].bmiStatus}'
                            '\nDate: ${DateFormat('dd/MM/yyyy, hh:mm a').format(cubit.userEntriesList[index].currentDate!)}',
                        fontSize: FontManager.font14,
                        color: ColorManager.grey828,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              cubit.deleteSpecificEntryFun(index: index);
                            },
                            icon: Icon(
                              Icons.delete,
                              color: ColorManager.red.withOpacity(0.7),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              cubit.setNewEntriesEditController(index: index);
                              editBottomSheet(context: context, index: index);
                            },
                            icon: Icon(
                              Icons.edit,
                              color: ColorManager.grey828.withOpacity(0.7),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
            // ElevatedButton(
            //   onPressed: () => cubit.fetchNextPage(),
            //   child: const Text('Load More'),
            // ),
          ],
        );
      },
    );
  }
}
