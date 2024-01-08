
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:learn_local_storage/shared_preference/service/db_service.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 0;

  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<void> getData() async {
    counter = await DBService.getCounter() ?? 0;
    setState(() {});
  }

  void plus(){
    setState(() {
      counter++;
    });
  }

  void minus(){
    setState(() {
      counter--;
    });
  }

  void clear(){
    counter = 0;
   DBService.deleteCounter();
   setState(() {});
  }

  Future<void> save(int value) async{
    bool result = await DBService.setCounter(value);
    log('message : $result');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(counter.toString(), style: const TextStyle(fontSize: 30),),
          const SizedBox(height: 100,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [
             ElevatedButton(
               onPressed: (){
                 minus();
               },
               child: const Text('-'),
             ),
             ElevatedButton(
               onPressed: (){
                 clear();
               },
               child: const Text('Clear'),
             ),
             ElevatedButton(
               onPressed: (){
                 plus();
               },
               child: Text('+'),
             ),
           ],
          ),

          ElevatedButton(
            onPressed: (){
              save(counter);
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }
}
