import 'package:bmi_calculation/app/data/firebase_auth.dart';
import 'package:bmi_calculation/app/models/response_handler_model.dart';
import 'package:bmi_calculation/utilities/components/alerts/toast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'states.dart';

class SiginInCubit extends Cubit<SinginInState> {
  SiginInCubit() : super(InitialSinginInState());

  static SiginInCubit get(context) => BlocProvider.of(context);

  ResponseHandlerClass? signInAnonymouslyResponce;
  signInAnonymouslyFun() async {
    signInAnonymouslyResponce = null;
    emit(SignInAnonymouslyLoadingState());
    signInAnonymouslyResponce =
        await FirebaseAuthentication.signInAnonymously();
    if (signInAnonymouslyResponce!.errorFlag == false) {
      emit(SignInAnonymouslySuccessState());
    } else {
      showToast(
        msg: signInAnonymouslyResponce!.errorMessage!,
        state: ToastStates.ERROR,
      );
      emit(SignInAnonymouslyErrorState());
    }
  }
}
