import 'package:flutter/material.dart';
import 'package:learn_local_storage/hive/pages/login_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'hive/boxes/box.dart';
import 'hive/models/person.dart';
import 'shared_preference/home_page.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(PersonAdapter());
  boxPerson = await Hive.openBox<Person>('users');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

