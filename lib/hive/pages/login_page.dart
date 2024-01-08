import 'package:flutter/material.dart';
import 'package:learn_local_storage/hive/boxes/box.dart';
import 'package:learn_local_storage/hive/models/person.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const SizedBox(height: 200),

            // user name
            TextField(
              controller: nameController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                hintText: "User name",
              ),
            ),

            // user age
            TextField(
              keyboardType: TextInputType.number,
              controller: ageController,
              decoration: const InputDecoration(
                  hintText: "User age"
              ),
            ),

            // add button
            TextButton(
              onPressed: (){
                setState(() {});

                Person person = Person(name: nameController.text, age: int.tryParse(ageController.text) ?? 0);

                boxPerson.put("key_${nameController.text}",person);




                // if(person.age == 0){
                //   Scaffold.of(context).showBottomSheet((context) => null);
                // }

              },
              child: const Text("Add"),
            ),


            Expanded(
              child: ListView.builder(
                itemCount: boxPerson.length,
                itemBuilder: (context, index){
                  Person person = boxPerson.getAt(index);
                  return ListTile(
                    title: Text(person.name),
                    subtitle: Text(person.age.toString()),
                    trailing: IconButton(
                      onPressed: (){
                        setState(() {});
                        boxPerson.deleteAt(index);
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  );
                },
              ),
            )

          ],
        ),
      ),
    );
  }
}
