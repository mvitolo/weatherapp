import 'package:equatable/equatable.dart';
import 'package:weatherapp/model/city.dart';

abstract class CityEvent extends Equatable {
  const CityEvent();

  @override
  List<Object> get props => [];
}

class CityChanged extends CityEvent {
  const CityChanged(this.city) : super();

  final City city;

  @override
  List<Object> get props => [city.hashCode];
}

class CityLoading extends CityEvent {
  CityLoading() : super();

  @override
  List<Object> get props => [];
}
