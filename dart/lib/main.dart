// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const ChuvaDart());
}

class ChuvaDart extends StatelessWidget {
  const ChuvaDart({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const Calendar(),
    );
  }
}

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime _currentDate = DateTime(2023, 11, 26);
  bool _clicked = false;

  void _changeDate(DateTime newDate) {
    setState(() {
      _currentDate = newDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 69, 97, 135),
        title: const Text(
          'Chuva 💜 Flutter',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Color.fromARGB(255, 69, 97, 135),
              alignment: Alignment.topCenter,
              child: Text(
                'Programação',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Container(
              height: 60,
              color: Color.fromARGB(255, 69, 97, 135),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.calendar_month,
                        color: Colors.black,
                      ),
                      label: Text(
                        'Exibindo todas atividades',
                        style: (TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w400)),
                      ),
                    ),
                  ]),
            ),
            Container(
              color: Color.fromARGB(255, 48, 109, 195),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 60,
                    color: Colors.white,
                    child: const Text(
                      'Nov\n2023',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        OutlinedButton(
                            style: TextButton.styleFrom(
                                side: BorderSide(
                                    color: Color.fromARGB(255, 48, 109, 195))),
                            onPressed: () {
                              _changeDate(DateTime(2023, 11, 26));
                            },
                            child: Text(
                              '26',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.white60),
                            )),
                        OutlinedButton(
                          style: TextButton.styleFrom(
                              side: BorderSide(
                                  color: Color.fromARGB(255, 48, 109, 195))),
                          onPressed: () {
                            _changeDate(DateTime(2023, 11, 27));
                          },
                          child: Text(
                            '27',
                            style:
                                TextStyle(fontSize: 15, color: Colors.white60),
                          ),
                        ),
                        OutlinedButton(
                          style: TextButton.styleFrom(
                              side: BorderSide(
                                  color: Color.fromARGB(255, 48, 109, 195))),
                          onPressed: () {
                            _changeDate(DateTime(2023, 11, 28));
                          },
                          child: Text(
                            '28',
                            style:
                                TextStyle(fontSize: 15, color: Colors.white60),
                          ),
                        ),
                        OutlinedButton(
                          style: TextButton.styleFrom(
                              side: BorderSide(
                                  color: Color.fromARGB(255, 48, 109, 195))),
                          onPressed: () {
                            _changeDate(DateTime(2023, 11, 29));
                          },
                          child: Text(
                            '29',
                            style:
                                TextStyle(fontSize: 15, color: Colors.white60),
                          ),
                        ),
                        OutlinedButton(
                          style: TextButton.styleFrom(
                              side: BorderSide(
                                  color: Color.fromARGB(255, 48, 109, 195))),
                          onPressed: () {
                            _changeDate(DateTime(
                              2023,
                              11,
                            ));
                          },
                          child: Text(
                            '30',
                            style:
                                TextStyle(fontSize: 15, color: Colors.white60),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            if (_currentDate.day == 26)
              OutlinedButton(
                  onPressed: () {
                    setState(() {
                      _clicked = true;
                    });
                  },
                  child: const Text('Mesa redonda de 07:00 até 08:00')),
            if (_currentDate.day == 28)
              OutlinedButton(
                  onPressed: () {
                    setState(() {
                      _clicked = true;
                    });
                  },
                  child: const Text('Palestra de 09:30 até 10:00')),
            if (_currentDate.day == 26 && _clicked) const Activity(),
          ],
        ),
      ),
    );
  }
}

class Activity extends StatefulWidget {
  const Activity({super.key});

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  bool _favorited = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.inversePrimary,
      child: Column(children: [
        Text(
          'Activity title',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const Text('A Física dos Buracos Negros Supermassivos'),
        const Text('Mesa redonda'),
        const Text('Domingo 07:00h - 08:00h'),
        const Text('Sthepen William Hawking'),
        const Text('Maputo'),
        const Text('Astrofísica e Cosmologia'),
        ElevatedButton.icon(
          onPressed: () {
            setState(() {
              _favorited = !_favorited;
            });
          },
          icon: _favorited
              ? const Icon(Icons.star)
              : const Icon(Icons.star_outline),
          label: Text(
              _favorited ? 'Remover da sua agenda' : 'Adicionar à sua agenda'),
        )
      ]),
    );
  }
}
