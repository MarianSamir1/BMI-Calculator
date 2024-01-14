abstract class BMICalculationState {}

class InitialBMICalculationState extends BMICalculationState {}

class SiginOutLoadingState extends BMICalculationState {}

class SiginOutErrorState extends BMICalculationState {}

class SiginOutSuccessState extends BMICalculationState {}

class CalculateBMISuccessState extends BMICalculationState {}

class AddNewEntryLoadingState extends BMICalculationState {}

class AddNewEntryErrorState extends BMICalculationState {}

class AddNewEntrySuccessState extends BMICalculationState {}

class SetEditControllerSuccessState extends BMICalculationState {}

class UpdateSpecificLoadingState extends BMICalculationState {}

class UpdateSpecificErrorState extends BMICalculationState {}

class UpdateSpecificSuccessState extends BMICalculationState {}

class DeleteSpecificEntryLoadingState extends BMICalculationState {}

class DeleteSpecificEntryErrorState extends BMICalculationState {}

class DeleteSpecificEntrySuccessState extends BMICalculationState {}

class GetNextEntriesSuccessState extends BMICalculationState {}
