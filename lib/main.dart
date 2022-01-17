import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:scoped_model/scoped_model.dart';

import './BackgroundCollectedPage.dart';
import './BackgroundCollectingTask.dart';
import './ChatPage.dart';
import './DiscoveryPage.dart';
import './SelectBondedDevicePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),

        floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                child: Icon(
                    Icons.upload
                ),
                onPressed: () async {
                  try {
                    String data = "Dit is een ESP test";
                    String pillcaseAddress = "C8:C9:A3:CA:99:86"; //We should get this address from app settings

                    BluetoothConnection connection = await BluetoothConnection.toAddress(pillcaseAddress);
                    print('Connected to the pillcase');

                    connection.output.add(Uint8List.fromList(utf8.encode(data + "\r\n"))); // Sending data
                    //connection.output.add(Uint8List.fromList(utf8.encode(data2 + "\r\n"))); // Sending more data

                    connection.finish();
                    print('Connection stopped.');

                  }
                  catch (exception) {
                    //do something?
                    print('Cannot connect, exception occured');
                  }
                /*
                  // C8:C9:A3:CA:99:86 ESP address
                  String text = "ESP test message";
                  BluetoothConnection? connection;

                  BluetoothConnection.toAddress("C8:C9:A3:CA:99:86").then((_connection) { //use address from discovery page
                    print('Connected to the device');
                    connection = _connection;
                    setState(() {
                      //isConnecting = false;
                      //isDisconnecting = false;
                      connection!.output.add(Uint8List.fromList(utf8.encode(text + "\r\n")));
                    });
                  });*/
                },
                heroTag: null,
              ),
              SizedBox(
                height: 10,
              ),
              FloatingActionButton(
                child: Icon(
                    Icons.bluetooth
                ),
                onPressed: () async {
                  final BluetoothDevice? selectedDevice =
                  await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return DiscoveryPage();
                      },
                    ),
                  );

                  if (selectedDevice != null) {
                    print('Discovery -> selected ' + selectedDevice.address);
                  } else {
                    print('Discovery -> no device selected');
                  }
                },
                heroTag: null,
              ),
              SizedBox(
                height: 10,
              ),
              FloatingActionButton(
                child: Icon(
                    Icons.add
                ),
                onPressed: () => _incrementCounter(),
                heroTag: null,
              )
            ]
        )
    );
  }
}
