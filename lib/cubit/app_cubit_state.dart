import 'package:equatable/equatable.dart';
import 'package:travelling_app/services/data_model.dart';

abstract class Cubitstate extends Equatable {}

class InitialState extends Cubitstate {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class WelcomeState extends Cubitstate {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadingState extends Cubitstate {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadedState extends Cubitstate {
  @override
  final List<DataModel> places;
  LoadedState(this.places);
  // TODO: implement props
  @override
  List<Object?> get props => [places];
}

class DetailState extends Cubitstate {
  @override
  final DataModel place;
  DetailState(this.place);
  // TODO: implement props
  @override
  List<Object?> get props => [place];
}
