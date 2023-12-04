import 'dart:io';

import 'package:flutter/material.dart';
import '../models/person.dart';

class PersonListScreen extends StatelessWidget {
  final List<Person> people;

  PersonListScreen({required this.people});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Pessoas'),
      ),
      body: ListView.builder(
        itemCount: people.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(people[index].name),
            leading: CircleAvatar(
              backgroundImage: FileImage(File(people[index].imagePath)),
            ),
          );
        },
      ),
    );
  }
}
