// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'timer_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final TimerController _cronometer = TimerController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Timer',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _cronometer.themeMode,
      home: Observer(
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Timer'),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: Icon(Icons.brightness_4),
                  onPressed: _cronometer.trocarTheme,
                ),
              ],
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Observer(
                        builder: (_) {
                          return Text(
                            _cronometer.formatTime(_cronometer.tempoContado),
                            style: TextStyle(fontSize: 80),
                          );
                        },
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Observer(
                        builder: (_) {
                          if (_cronometer.isRunning) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: _cronometer.stop,
                                  child: Text('PARAR'),
                                ),
                                SizedBox(width: 10),
                                ElevatedButton(
                                  onPressed: _cronometer.marcar,
                                  child: Text('MARCAR'),
                                ),
                              ],
                            );
                          } else {
                            return ElevatedButton(
                              onPressed: _cronometer.start,
                              child: Text('INICIAR'),
                            );
                          }
                        },
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: _cronometer.clear,
                        child: Text('LIMPAR'),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    flex: 1,
                    child: Observer(
                      builder: (_) {
                        return ListView.builder(
                          itemCount: _cronometer.marcador.length,
                          itemBuilder: (_, index) {
                            return ListTile(
                              title: Text(_cronometer.marcador[index]),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
