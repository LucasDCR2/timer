// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'dart:async';

import 'package:mobx/mobx.dart';
part 'timer_controller.g.dart';

class TimerController = _TimerController with _$TimerController;

abstract class _TimerController with Store {
  @observable
  bool isRunning = false;

  @observable
  ObservableList<String> marcador = ObservableList<String>();

  @observable
  int tempoContado = 0;

  @action
  void start() {
    isRunning = true;
    _startTimer();
  }

  @action
  void stop() {
    isRunning = false;
  }

  @action
  void marcar() {
    marcador.add(formatTime(tempoContado));
  }

  @action
  void clear() {
    tempoContado = 0;
    marcador.clear();
  }

  void _startTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (!isRunning) {
        timer.cancel();
        return;
      }
      tempoContado++;
    });
  }

  String formatTime(int time) {
    int seconds = time % 60;
    int minutes = (time ~/ 60) % 60;
    int hours = time ~/ 3600;
    return '$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
