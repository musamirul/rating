import 'package:flutter/material.dart';
import 'package:rating/dog_card.dart';

import 'dog_model.dart';

class DogList extends StatelessWidget{
  final List<Dog> doggos;
  DogList(this.doggos, {super.key});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _BuildList(context);
  }

  ListView _BuildList(context){
    return ListView.builder(itemCount: doggos.length, itemBuilder: (context,int){
      return DogCard(doggos[int]);
    });
  }

}