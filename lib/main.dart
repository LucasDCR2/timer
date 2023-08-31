// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'timer_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final TimerController cronometer = TimerController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Timer',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: cronometer.themeMode,
      home: Observer(
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Timer'),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: Icon(Icons.brightness_4),
                  onPressed: cronometer.trocarTheme,
                ),
              ],
            ),
            body: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Progressivo'),
                        Switch(
                          value: cronometer.isProgressive,
                          onChanged: cronometer.trocarProgressive,
                        ),
                        Text('Regressivo'),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: cronometer.isProgressive
                        ? _buildProgressiveLayout(cronometer)
                        : _buildRegressiveLayout(cronometer),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProgressiveLayout(TimerController cronometer) {
    return Container(
      margin: EdgeInsets.only(top: 180),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Observer(
            builder: (_) {
              return Text(
                cronometer.formatTime(cronometer.tempoContado),
                style: TextStyle(fontSize: 80),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Observer(
                builder: (_) {
                  if (cronometer.isRunning) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: cronometer.stop,
                          icon: Icon(Icons.stop),
                          label: Text('PARAR'),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton.icon(
                          onPressed: cronometer.marcar,
                          icon: Icon(Icons.location_on),
                          label: Text('MARCAR'),
                        ),
                      ],
                    );
                  } else {
                    return ElevatedButton.icon(
                      onPressed: cronometer.start,
                      icon: Icon(Icons.watch_later),
                      label: Text('INICIAR'),
                    );
                  }
                },
              ),
              SizedBox(width: 10),
              ElevatedButton.icon(
                onPressed: cronometer.clear,
                icon: Icon(Icons.delete),
                label: Text('LIMPAR'),
              ),
            ],
          ),
          SizedBox(height: 20),
          Expanded(
            child: Observer(
              builder: (_) {
                return ListView.builder(
                  itemCount: cronometer.marcador.length,
                  itemBuilder: (_, index) {
                    return ListTile(
                      title: Text(cronometer.marcador[index]),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRegressiveLayout(TimerController cronometer) {
    return Container(
      margin: EdgeInsets.only(bottom: 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '${cronometer.countdownValue}',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 20),
          Observer(
            builder: (_) {
              if (cronometer.isRunning) {
                return ElevatedButton.icon(
                  onPressed: cronometer.stopCountdown,
                  icon: Icon(Icons.stop),
                  label: Text('PARAR'),
                );
              } else {
                return ElevatedButton.icon(
                  onPressed: cronometer.startCountdown,
                  icon: Icon(Icons.watch_later),
                  label: Text('INICIAR'),
                );
              }
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Abra um diálogo ou uma tela para permitir que o usuário defina o valor inicial do cronômetro regressivo
              // e atualize cronometer.countdownValue com o valor definido.
            },
            child: Text('Definir valor inicial'),
          ),
        ],
      ),
    );
  }
}
