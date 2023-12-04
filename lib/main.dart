import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'screens/add_person_screen.dart';
import 'screens/person_list_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Parse().initialize(
    'sfQfMxJ3ITyf2Wq2AAXtkSlzQtUxlfHiLr5BMMYv',
    'https://parseapi.back4app.com',
    clientKey: 'nsIx0z3VxSLs14PurmHJeIanBVRbNEtUU2jZw3ZF',
    autoSendSessionId: true,
    debug: true,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Back4App Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Back4App Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddPersonScreen()),
                );
              },
              child: const Text('Adicionar Pessoa'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PersonListScreen(people: [])),
                );
              },
              child: const Text('Lista de Pessoas'),
            ),
          ],
        ),
      ),
    );
  }
}
