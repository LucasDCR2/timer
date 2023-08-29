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
  String toString() {
    return '''
isRunning: ${isRunning},
marcador: ${marcador},
tempoContado: ${tempoContado}
    ''';
  }
}
