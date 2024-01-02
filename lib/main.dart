import 'package:flutter/material.dart';
import 'package:rating/dog_card.dart';
import 'package:rating/dog_list.dart';
import 'package:rating/dog_model.dart';
import 'package:rating/new_dog_form.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const MaterialApp(
      title: 'We Rate Dogs',
      home: MyHomePage('We Rate Dogs',),
    );
  }
}

class MyHomePage extends StatefulWidget{
  final String title;
  const MyHomePage(this.title,{super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage>{
  List<Dog> initialDoggos = [Dog('Ruby', 'Portland', 'Ruby is a very good girl'), Dog('Rex', 'Seatle', 'Best in Show 1999'), Dog('Razzi', 'Wasshington', 'Best in Performance 2020')];
  @override
  Widget build(context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: const TextStyle(color: Colors.white),),
        backgroundColor: Colors.black87,
        actions: [
          IconButton(onPressed: _showNewDogForm
          , icon: const Icon(Icons.add, color: Colors.white,size: 40,))
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: const [0.1,0.5,0.7,0.9],
            colors: [
              Colors.indigo.shade800,
              Colors.indigo.shade700,
              Colors.indigo.shade600,
              Colors.indigo.shade400,
            ],

          )
        ),
        child: Center(
          child: DogList(initialDoggos),
        ),
      ),
    );
  }

  Future _showNewDogForm() async{
    Dog newDog = await Navigator.of(context).push(
      MaterialPageRoute(builder: (context){
        return AddDogFormPage();
      })
    );
    if (newDog != null){
      setState(() {
        initialDoggos.add(newDog);
      });
    }
  }
}