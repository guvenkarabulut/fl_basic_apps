import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _text = '';

  void _onPressed(String text) {
    setState(() {
      _text += text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(children: <Widget>[
        Row(children: <Widget>[
          Container(
            alignment: Alignment.bottomRight,
            width: 390,
            height: 300,
            color: Colors.lightBlue,
            child: Text(_text,
                style: const TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                )),
          ),
        ]),
        Row(children: <Widget>[
          Container(
            width: 98,
            height: 80,
            color: Colors.grey,
            child: ElevatedButton(
              onPressed: () => {
                setState(() {
                  _text = '';
                })
              },
              child: const Text('C'),
            ),
          ),
          Container(
            width: 98,
            height: 75,
            color: Colors.grey,
            child: ElevatedButton(
              onPressed: () => {
                setState(() {
                  _text = _text.substring(0, _text.length - 1);
                })
              },
              child: Icon(Icons.backspace),
            ),
          ),
          Container(
            width: 98,
            height: 75,
            color: Colors.grey,
            child: ElevatedButton(
              onPressed: () => _onPressed('%'),
              child: const Text('%'),
            ),
          ),
          Container(
            width: 98,
            height: 75,
            color: Colors.grey,
            child: ElevatedButton(
              onPressed: () => {},
              child: Icon(Icons.backup_rounded),
            ),
          ),
        ]),
        Row(children: <Widget>[
          Container(
            width: 98,
            height: 75,
            color: Colors.grey,
            child: ElevatedButton(
              onPressed: () => _onPressed('7'),
              child: const Text('7'),
            ),
          ),
          Container(
            width: 98,
            height: 75,
            color: Colors.grey,
            child: ElevatedButton(
              onPressed: () => _onPressed('8'),
              child: const Text('8'),
            ),
          ),
          Container(
            width: 98,
            height: 75,
            color: Colors.grey,
            child: ElevatedButton(
              onPressed: () => _onPressed('9'),
              child: const Text('9'),
            ),
          ),
          Container(
            width: 98,
            height: 75,
            color: Colors.grey,
            child: ElevatedButton(
              onPressed: () => _onPressed('/'),
              child: const Text('/'),
            ),
          ),
        ]),
        Row(children: <Widget>[
          Container(
            width: 98,
            height: 75,
            color: Colors.grey,
            child: ElevatedButton(
              onPressed: () => _onPressed('4'),
              child: const Text('4'),
            ),
          ),
          Container(
            width: 98,
            height: 75,
            color: Colors.grey,
            child: ElevatedButton(
              onPressed: () => _onPressed('5'),
              child: const Text('5'),
            ),
          ),
          Container(
            width: 98,
            height: 75,
            color: Colors.grey,
            child: ElevatedButton(
              onPressed: () => _onPressed('6'),
              child: const Text('6'),
            ),
          ),
          Container(
            width: 98,
            height: 75,
            color: Colors.grey,
            child: ElevatedButton(
              onPressed: () => _onPressed('*'),
              child: const Text('*'),
            ),
          ),
        ]),
        Row(children: <Widget>[
          Container(
            width: 98,
            height: 75,
            color: Colors.grey,
            child: ElevatedButton(
              onPressed: () => _onPressed('1'),
              child: const Text('1'),
            ),
          ),
          Container(
            width: 98,
            height: 75,
            color: Colors.grey,
            child: ElevatedButton(
              onPressed: () => _onPressed('2'),
              child: const Text('2'),
            ),
          ),
          Container(
            width: 98,
            height: 75,
            color: Colors.grey,
            child: ElevatedButton(
              onPressed: () => _onPressed('3'),
              child: const Text('3'),
            ),
          ),
          Container(
            width: 98,
            height: 75,
            color: Colors.grey,
            child: ElevatedButton(
              onPressed: () => _onPressed('+'),
              child: const Text('+'),
            ),
          ),
        ]),
        Row(children: <Widget>[
          Container(
            width: 98,
            height: 75,
            color: Colors.grey,
            child: ElevatedButton(
              onPressed: () => _onPressed('0'),
              child: const Text('0'),
            ),
          ),
          Container(
            width: 98,
            height: 75,
            color: Colors.grey,
            child: ElevatedButton(
              onPressed: () => _onPressed('.'),
              child: const Text('.'),
            ),
          ),
          Container(
            width: 98,
            height: 75,
            color: Colors.grey,
            child: ElevatedButton(
              onPressed: () => {
                setState(() {
                  int result = 0;
                  int integer = 0;
                  for (int i = 0; i < _text.length; i++) {
                    if (_text[i] == '+') {
                      result = int.parse(_text.substring(0, i)) +
                          int.parse(_text.substring(i + 1, _text.length));
                    } else if (_text[i] == '-') {
                      result = int.parse(_text.substring(0, i)) -
                          int.parse(_text.substring(i + 1, _text.length));
                    } else if (_text[i] == '*') {
                      result = int.parse(_text.substring(0, i)) *
                          int.parse(_text.substring(i + 1, _text.length));
                    } else if (_text[i] == '/') {
                      result = int.parse(_text.substring(0, i)) ~/
                          int.parse(_text.substring(i + 1, _text.length));
                    }
                  }
                  _text = result.toString();
                })
              },
              child: const Text('='),
            ),
          ),
          Container(
            width: 98,
            height: 75,
            color: Colors.grey,
            child: ElevatedButton(
              onPressed: () => _onPressed('-'),
              child: const Text('-'),
            ),
          ),
        ]),
      ]),
    );
  }
}
