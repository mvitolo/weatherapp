import 'package:equatable/equatable.dart';
import 'package:weatherapp/model/city.dart';

class CityState extends Equatable {
  CityState(this.cities);

  final List<City> cities;

  @override
  List<Object> get props => [cities];
}

class CityEmpty extends CityState {
  CityEmpty() : super([]);

  @override
  List<Object> get props => [];
}
