import 'package:flutter/material.dart';

import 'dog_model.dart';

class DogDetailPage extends StatefulWidget{
  final Dog dog;

  const DogDetailPage({super.key, required this.dog});

  @override
  State<DogDetailPage> createState() {

    return _DogDetailPageState();
  }

}

class _DogDetailPageState extends State<DogDetailPage>{
  final double dogAvatarSize = 150;


  Widget get rating{
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.star,size: 40,),
        Text('${widget.dog.rating}/10',style: Theme.of(context).textTheme.displaySmall,)
      ],
    );
  }

  Widget get dogProfile{
    return Container(
      padding: EdgeInsets.symmetric(vertical: 32),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1,0.5,0.7,0.9],
          colors: [
            Colors.indigo.shade800,
            Colors.indigo.shade700,
            Colors.indigo.shade600,
            Colors.indigo.shade400,
          ]
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('${widget.dog.name}',style: TextStyle(fontSize: 32),),
          Text('${widget.dog.location}',style: TextStyle(fontSize: 20),),
          Padding(padding: EdgeInsets.symmetric(horizontal: 32,vertical: 16),
          child: Text(widget.dog.description),),
          rating
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('Meet ${widget.dog.name}'),
      ),
      body: dogProfile,
    );
  }
}