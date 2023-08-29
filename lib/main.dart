// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'timer_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final TimerController _controller = TimerController();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MobX Timer',
      home: Scaffold(
        appBar: AppBar(title: Text('MobX Timer')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Observer(
                builder: (_) {
                  return _controller.isRunning
                      ? Text(
                          _controller.formatTime(_controller.tempoContado),
                          style: TextStyle(fontSize: 40),
                        )
                      : ElevatedButton(
                          onPressed: _controller.start,
                          child: Text('INICIAR'),
                        );
                },
              ),
              SizedBox(height: 20),
              Observer(
                builder: (_) {
                  if (_controller.isRunning) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: _controller.stop,
                          child: Text('PARAR'),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: _controller.marcar,
                          child: Text('MARCAR'),
                        ),
                      ],
                    );
                  } else {
                    return ElevatedButton(
                      onPressed: _controller.clear,
                      child: Text('LIMPAR'),
                    );
                  }
                },
              ),
              SizedBox(height: 20),
              Expanded(
                child: Observer(
                  builder: (_) {
                    return ListView.builder(
                      itemCount: _controller.marcador.length,
                      itemBuilder: (_, index) {
                        return ListTile(
                          title: Text(_controller.marcador[index]),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
