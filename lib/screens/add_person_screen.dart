import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPersonScreen extends StatefulWidget {
  @override
  _AddPersonScreenState createState() => _AddPersonScreenState();
}

class _AddPersonScreenState extends State<AddPersonScreen> {
  final TextEditingController _nameController = TextEditingController();
  File? _image;

  Future _getImage() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _savePerson() {
    if (_nameController.text.isNotEmpty && _image != null) {
      // Salve no Back4App o path da imagem e o nome
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Pessoa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            const SizedBox(height: 20),
            _image == null
                ? const Text('Nenhuma imagem selecionada.')
                : Image.file(_image!),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _getImage(),
              child: const Text('Selecionar Imagem'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _savePerson(),
              child: const Text('Salvar Pessoa'),
            ),
          ],
        ),
      ),
    );
  }
}
