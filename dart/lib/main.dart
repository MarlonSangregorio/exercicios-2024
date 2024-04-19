// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'dart:convert';
import 'dart:ui';

import 'package:chuva_dart/user_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import 'model.dart';

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

  late Future<List<Actvities>>
      _activitie; // Variável para armazenar os usuários

  @override
  void initState() {
    super.initState();
    _activitie =
        getActivitie(); // Carrega os usuários quando o widget é inicializado
  }

  // Future<List<User>> user = getUsers();

  // static Future<List<User>> getUsers() async {
  //   const url =
  //       'https://raw.githubusercontent.com/chuva-inc/exercicios-2023/master/dart/assets/activities.json';
  //   final response = await http.get(Uri.parse(url));

  //   final body = json.decode(response.body);
  //   return body.map<User>(User.fromJson).toList();
  // }

  void _changeDate(DateTime newDate) {
    setState(() {
      _currentDate = newDate;
    });
  }

  static Future<List<Actvities>> getActivitie() async {
    const url =
        'https://raw.githubusercontent.com/chuva-inc/exercicios-2023/master/dart/assets/activities.json';
    final response = await http.get(Uri.parse(url));

    //log(response.body);

    if (response.statusCode == 200) {
      dynamic responseBody = json.decode(response.body);
      dynamic body = responseBody['data'];

      if (body is List) {
        // Se o corpo for uma lista, mapeamos os dados para uma lista de usuários
        List<Actvities> users =
            body.map<Actvities>((item) => Actvities.fromJson(item)).toList();
        return users;
      } else {
        // Se o corpo não for uma lista, lança uma exceção
        throw Exception('O corpo da resposta não é uma lista');
      }
    } else {
      throw Exception('Falha ao carregar os usuários');
    }
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
              if (_currentDate.day == 28)
                OutlinedButton(
                    onPressed: () {
                      setState(() {
                        _clicked = true;
                      });
                    },
                    child: const Text('Palestra de 09:30 até 10:00')),
            if (_currentDate.day == 26 && _clicked) const Activity(),
            Expanded(
              child: FutureBuilder<List<Actvities>>(
                future: _activitie,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    Text("erro aqui");
                    return Center(child: Text('Error: ${snapshot.error}]'));
                  } else {
                    return buildUsers(snapshot.data!);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Método para construir a lista de usuários
  Widget buildUsers(List<Actvities> activitie) => ListView.builder(
        itemCount: activitie.length,
        itemBuilder: (context, index) {
          final user = activitie[index];

          return Card(
            child: ListTile(
                contentPadding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal:
                        16.0), // Adiciona espaço entre o texto e os limites do ListTile
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.typeTitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 1), // Espaçamento entre o texto e o título
                    Text(user.title,
                        style: TextStyle(fontWeight: FontWeight.w600))
                  ],
                ),
                subtitle: Text(user.authors),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => UserPage(user: user),
                  ));
                }),
          );
        },
      );
}

class Activity extends StatefulWidget {
  const Activity({super.key});

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  // ignore: unused_field
  bool _favorited = false;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
