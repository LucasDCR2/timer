// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TimerController on _TimerController, Store {
  late final _$isRunningAtom =
      Atom(name: '_TimerController.isRunning', context: context);

  @override
  bool get isRunning {
    _$isRunningAtom.reportRead();
    return super.isRunning;
  }

  @override
  set isRunning(bool value) {
    _$isRunningAtom.reportWrite(value, super.isRunning, () {
      super.isRunning = value;
    });
  }

  late final _$marcadorAtom =
      Atom(name: '_TimerController.marcador', context: context);

  @override
  ObservableList<String> get marcador {
    _$marcadorAtom.reportRead();
    return super.marcador;
  }

  @override
  set marcador(ObservableList<String> value) {
    _$marcadorAtom.reportWrite(value, super.marcador, () {
      super.marcador = value;
    });
  }

  late final _$tempoContadoAtom =
      Atom(name: '_TimerController.tempoContado', context: context);

  @override
  int get tempoContado {
    _$tempoContadoAtom.reportRead();
    return super.tempoContado;
  }

  @override
  set tempoContado(int value) {
    _$tempoContadoAtom.reportWrite(value, super.tempoContado, () {
      super.tempoContado = value;
    });
  }

  late final _$isProgressiveAtom =
      Atom(name: '_TimerController.isProgressive', context: context);

  @override
  bool get isProgressive {
    _$isProgressiveAtom.reportRead();
    return super.isProgressive;
  }

  @override
  set isProgressive(bool value) {
    _$isProgressiveAtom.reportWrite(value, super.isProgressive, () {
      super.isProgressive = value;
    });
  }

  late final _$themeModeAtom =
      Atom(name: '_TimerController.themeMode', context: context);

  @override
  ThemeMode get themeMode {
    _$themeModeAtom.reportRead();
    return super.themeMode;
  }

  @override
  set themeMode(ThemeMode value) {
    _$themeModeAtom.reportWrite(value, super.themeMode, () {
      super.themeMode = value;
    });
  }

  late final _$currentRouteAtom =
      Atom(name: '_TimerController.currentRoute', context: context);

  @override
  String get currentRoute {
    _$currentRouteAtom.reportRead();
    return super.currentRoute;
  }

  @override
  set currentRoute(String value) {
    _$currentRouteAtom.reportWrite(value, super.currentRoute, () {
      super.currentRoute = value;
    });
  }

  late final _$countdownValueAtom =
      Atom(name: '_TimerController.countdownValue', context: context);

  @override
  int get countdownValue {
    _$countdownValueAtom.reportRead();
    return super.countdownValue;
  }

  @override
  set countdownValue(int value) {
    _$countdownValueAtom.reportWrite(value, super.countdownValue, () {
      super.countdownValue = value;
    });
  }

  late final _$_TimerControllerActionController =
      ActionController(name: '_TimerController', context: context);

  @override
  void start() {
    final _$actionInfo = _$_TimerControllerActionController.startAction(
        name: '_TimerController.start');
    try {
      return super.start();
    } finally {
      _$_TimerControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stop() {
    final _$actionInfo = _$_TimerControllerActionController.startAction(
        name: '_TimerController.stop');
    try {
      return super.stop();
    } finally {
      _$_TimerControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void marcar() {
    final _$actionInfo = _$_TimerControllerActionController.startAction(
        name: '_TimerController.marcar');
    try {
      return super.marcar();
    } finally {
      _$_TimerControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clear() {
    final _$actionInfo = _$_TimerControllerActionController.startAction(
        name: '_TimerController.clear');
    try {
      return super.clear();
    } finally {
      _$_TimerControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void trocarProgressive() {
    final _$actionInfo = _$_TimerControllerActionController.startAction(
        name: '_TimerController.trocarProgressive');
    try {
      return super.trocarProgressive();
    } finally {
      _$_TimerControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void trocarTheme() {
    final _$actionInfo = _$_TimerControllerActionController.startAction(
        name: '_TimerController.trocarTheme');
    try {
      return super.trocarTheme();
    } finally {
      _$_TimerControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void navigateTo(String route) {
    final _$actionInfo = _$_TimerControllerActionController.startAction(
        name: '_TimerController.navigateTo');
    try {
      return super.navigateTo(route);
    } finally {
      _$_TimerControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void startCountdown() {
    final _$actionInfo = _$_TimerControllerActionController.startAction(
        name: '_TimerController.startCountdown');
    try {
      return super.startCountdown();
    } finally {
      _$_TimerControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stopCountdown() {
    final _$actionInfo = _$_TimerControllerActionController.startAction(
        name: '_TimerController.stopCountdown');
    try {
      return super.stopCountdown();
    } finally {
      _$_TimerControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCountdownValue(int value) {
    final _$actionInfo = _$_TimerControllerActionController.startAction(
        name: '_TimerController.setCountdownValue');
    try {
      return super.setCountdownValue(value);
    } finally {
      _$_TimerControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isRunning: ${isRunning},
marcador: ${marcador},
tempoContado: ${tempoContado},
isProgressive: ${isProgressive},
themeMode: ${themeMode},
currentRoute: ${currentRoute},
countdownValue: ${countdownValue}
    ''';
  }
}
