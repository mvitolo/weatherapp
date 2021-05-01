import 'package:equatable/equatable.dart';
import 'package:weatherapp/model/city.dart';

abstract class CityEvent extends Equatable {
  const CityEvent(this.cities);

  final List<City> cities;

  @override
  List<Object> get props => [];
}

class CityChanged extends CityEvent {
  const CityChanged(this.cities) : super(cities);

  final List<City> cities;

  @override
  List<Object> get props => [cities];
}

class CityLoading extends CityEvent {
  CityLoading() : super([]);

  final List<City> cities = [];

  @override
  List<Object> get props => [cities];
}
