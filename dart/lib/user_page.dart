import 'dart:ui';

import 'package:chuva_dart/about_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:html/parser.dart' as htmlParser;
import 'package:chuva_dart/model.dart';

class UserPage extends StatelessWidget {
  final Actvities user;

  const UserPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
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
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Column(
            children: <Widget>[
              Text(
                user.title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              Container(
                child: Row(
                  children: [
                    const Icon(
                      Icons.access_time,
                      color: Colors.blue,
                    ),
                    Text(
                      user.typeTitle,
                      style: TextStyle(),
                      textAlign: TextAlign.left,
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_pin,
                      color: Colors.blue,
                    ),
                    Text(user.location)
                  ],
                ),
              ),
              // ignore: avoid_unnecessary_containers
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 100,
                    horizontal: 5,
                  ),
                  child: FutureBuilder<String>(
                    future: _parseHtml(
                      user.description,
                    ),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(snapshot.data!);
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }
                      return const CircularProgressIndicator(
                        color: Colors.white10,
                      );
                    },
                  ),
                ),
              ),

              const Text(
                'Palestrante: ',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),

              Row(
                children: [
                  GestureDetector(
                      child: Text(user.authors),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AboutPage(user: user),
                        ));
                      }),
                ],
              )
            ],
          ),
        ),
      ));

  Future<String> _parseHtml(String htmlString) async {
    // Parse HTML string
    final document = htmlParser.parse(htmlString);

    // Extract text inside <p> tag
    final paragraphText = document.querySelector('p')!.text;

    return paragraphText;
  }
}
