import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techinal_practice/controller/blob/internet_event.dart';
import 'package:techinal_practice/controller/blob/internet_state.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  StreamSubscription? connectivitySubscription;

  Connectivity connectivity = Connectivity();

  InternetBloc() : super(InternetInitialState()) {
    on<InternetLostEvent>((event, emit) => emit(InternetLostState())); //function = emit

    on<InternetGainedEvent>((event, emit) => emit(InternetGainedState()));

    connectivitySubscription =
        connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        add(InternetGainedEvent());
      } else {
        add(InternetLostEvent());
      }
    });
  }

  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
}
