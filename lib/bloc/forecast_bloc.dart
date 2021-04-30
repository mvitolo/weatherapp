import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/model/forecast.dart';
import 'package:weatherapp/repository/forecast_repository.dart';

import 'forecast_event.dart';
import 'forecast_state.dart';

class ForecastBloc extends Bloc<ForecastEvent, ForecastState> {
  ForecastRepository repository = ForecastRepository();
  late StreamSubscription<List<Forecast>> subscription;

  ForecastBloc() : super(ForecastEmpty()) {
    subscription = repository.forecast.listen((value) {
      add(ForecastChanged(value));
    });
  }

  @override
  Stream<ForecastState> mapEventToState(ForecastEvent event) async* {
    switch (event.runtimeType) {
      case ForecastChanged:
        yield ForecastState(event.forecast);
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
