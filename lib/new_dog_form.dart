import 'package:flutter/material.dart';
import 'package:rating/dog_model.dart';

class AddDogFormPage extends StatefulWidget {
  const AddDogFormPage({super.key});

  @override
  State<AddDogFormPage> createState() {
    return _AddDogFormPageState();
  }
}

class _AddDogFormPageState extends State<AddDogFormPage> {
  //One TextEditingController for each form input
  TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a new Dog'),
        backgroundColor: Colors.black87,
      ),
      body: Container(
        color: Colors.black54,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 32),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: TextField(
                  controller: nameController,
                  onChanged: (v)=>nameController.text = v,
                  decoration: const InputDecoration(
                    labelText: 'Name the pup',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: TextField(
                  controller: locationController,
                  onChanged: (v){ locationController.text =v; },
                  decoration: const InputDecoration(
                    labelText: 'Pup location',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: TextField(
                  controller: descriptionController,
                  onChanged: (v)=>descriptionController.text = v,
                  decoration: const InputDecoration(labelText: 'All about the pup'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Builder(builder: (context) {
                  return ElevatedButton(
                    onPressed: ()=> submitPup(context),
                    child: const Text('Submit Pup'),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }

  void submitPup(context){
    if(nameController.text.isEmpty){
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text('Pups neeed names!'),
          ),
      );
    }else{
      var newDog = Dog(nameController.text, locationController.text, descriptionController.text);
      Navigator.of(context).pop(newDog);
    }
  }
}
