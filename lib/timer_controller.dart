// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'package:mobx/mobx.dart';
import 'dart:async';
import 'package:flutter/material.dart';

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


//=============================================< Extras >=======================================//

@observable
bool isProgressive = true;

@action
void trocarProgressive(bool newValue) {
  isProgressive = newValue;
  // Pode adicionar lógica adicional aqui, se necessário
}


  @observable
  ThemeMode themeMode = ThemeMode.dark;

  @action
  void trocarTheme() {
    themeMode = themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }

  @observable
  String currentRoute = 'main';

  @action
  void navigateTo(String route) {
    currentRoute = route;
  }

 // =====================< Cronômetro Regressivo >=====================

  @observable
  int countdownValue = 60;

  @observable
  int maxCountdownValue = 60;

  Timer? _countdownTimer;

  @action
  void startCountdown() {
    isRunning = true;
    _countdownTimer = Timer.periodic(Duration(seconds: 1), (_) {
      if (countdownValue > 0) {
        countdownValue--;
      } else {
        stopCountdown();
      }
    });
  }

  @action
  void stopCountdown() {
    isRunning = false;
    _countdownTimer?.cancel();
  }

  @action
  void setCountdownValue(int value) {
    countdownValue = value;
    maxCountdownValue = value;
  }

    @action
  void setMaxCountdownValue(int value) {
    maxCountdownValue = value;
  }
}

