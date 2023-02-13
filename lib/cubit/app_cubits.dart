import 'package:travelling_app/services/data_model.dart';

import '../services/data_services.dart';
import 'app_cubit_state.dart';
import 'package:bloc/bloc.dart';

class AppCubits extends Cubit<Cubitstate> {
  final Dataservices data;
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }
  late final places;
  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    } catch (e) {}
  }

  detailpage(DataModel data) {
    emit(DetailState(data));
  }

  gohome() {
    emit(LoadedState(places));
  }
}
