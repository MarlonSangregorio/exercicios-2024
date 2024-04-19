import 'package:flutter/material.dart';
import 'package:chuva_dart/model.dart';

class AboutPage extends StatelessWidget {
  final Actvities user;

  const AboutPage({
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
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        user.people[0]['picture'],
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                        width:
                            20), // Adiciona espaçamento entre a imagem e o texto
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          user.people[0]['name'],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                            height:
                                5), // Adiciona espaçamento entre o nome e a instituição
                        Text(
                          user.people[0]['institution'],
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                    height: 20), // Adiciona espaçamento entre o nome e a bio
                const Text(
                  'Bio',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                    height:
                        5), // Adiciona espaçamento entre o título "Bio" e a bio
                Text(
                  user.people[0]['bio'],
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
