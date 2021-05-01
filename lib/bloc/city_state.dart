import 'package:equatable/equatable.dart';
import 'package:weatherapp/model/city.dart';

class CityState extends Equatable {
  CityState();

  @override
  List<Object> get props => [];
}

class CityValue extends CityState {
  CityValue(this.city);

  final City city;

  @override
  List<Object> get props => [city.hashCode];
}

class CityEmpty extends CityState {
  CityEmpty() : super();

  @override
  List<Object> get props => [];
}
