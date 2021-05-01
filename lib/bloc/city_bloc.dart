import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/bloc/city_event.dart';
import 'package:weatherapp/bloc/city_state.dart';
import 'package:weatherapp/model/city.dart';
import 'package:weatherapp/repository/city_repository.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  CityRepository repository = CityRepository();
  late StreamSubscription<City> subscription;
  StreamController<String> choosenCity;

  CityBloc(this.choosenCity) : super(CityEmpty()) {
    subscription = repository.cities.listen((value) {
      add(CityChanged(value));
    });
  }

  @override
  Stream<CityState> mapEventToState(CityEvent event) async* {
    switch (event.runtimeType) {
      case CityChanged:
        yield CityValue((event as CityChanged).city);
        break;
      default:
        yield CityEmpty();
        break;
    }
  }

  @override
  Future<void> close() {
    subscription.cancel();
    repository.dispose();
    return super.close();
  }
}
