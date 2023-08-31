// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // Aplicar o gradiente ao background
        scaffoldBackgroundColor: Colors.transparent,
      ),
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
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF333333), Color(0xFF000000)],
                  begin: FractionalOffset(0.5, 1),
                ),
              ),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Cronômetro'),
                          Switch(
                            value: cronometer.isProgressive,
                            onChanged: cronometer.trocarProgressive,
                          ),
                          Text('Countdown'),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: cronometer.isProgressive
                          ? progressiveLayout(cronometer)
                          : regressiveLayout(cronometer),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget progressiveLayout(TimerController cronometer) {
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
                return Container(
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: ListView.separated(
                    itemCount: cronometer.marcador.length,
                    separatorBuilder: (_, __) => Divider(
                      color: Colors.grey,
                      height: 1,
                    ),
                    itemBuilder: (_, index) {
                      return ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Flag ${index + 1}'),
                            Text(cronometer.marcador[index]),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget regressiveLayout(TimerController cronometer) {
    String newCountdownValue = '';
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: 50),
              child: TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  newCountdownValue = value;
                  cronometer.setCountdownValue(int.tryParse(newCountdownValue) ?? 0);
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.watch_later_outlined),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 200,
              height: 200,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CircularProgressIndicator(
                    value: cronometer.countdownValue /
                        cronometer.maxCountdownValue,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      cronometer.countdownValue <=
                              cronometer.maxCountdownValue * 0.25
                          ? Colors.red
                          : Colors.blue,
                    ),
                    backgroundColor: Colors.white,
                    strokeWidth: 12,
                  ),
                  Center(
                    child: Text(
                      '${cronometer.countdownValue}',
                      style: TextStyle(fontSize: 80),
                    ),
                  ),
                ],
              ),
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
          ],
        ),
      ),
    );
  }
}
