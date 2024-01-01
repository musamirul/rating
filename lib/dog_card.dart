import 'package:flutter/material.dart';
import 'package:rating/dog_detail_page.dart';

import 'dog_model.dart';

class DogCard extends StatefulWidget {
  final Dog dog;

  const DogCard(this.dog, {super.key});

  @override
  State<DogCard> createState() {
    return _DogCardState(dog);
  }
}

class _DogCardState extends State<DogCard> {
  Dog dog;

  _DogCardState(this.dog);

  late String renderUrl;

  Widget get dogImage {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(renderUrl ?? ''),
          )),
    );
  }

  Widget get dogCard {
    return SizedBox(
      width: 290,
      height: 115,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8, left: 64),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                widget.dog.name,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                widget.dog.location,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Row(
                children: [
                  Icon(Icons.star),
                  Text(': ${widget.dog.rating} / 10')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  // @override
  // void initState(){
  //   super.initState();
  //   renderDogPic();
  // }
  // void renderDogPic() async{
  //   await dog.getImageUrl();
  //   if(mounted){
  //     setState(() {
  //       renderUrl = dog.imageUrl;
  //     });
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    // return Text(widget.dog.name);
    return InkWell(
      onTap: showDogDetailPage,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: SizedBox(
          height: 115,
          child: Stack(
            children: [Positioned(left: 50, child: dogCard)],
          ),
        ),
      ),
    );
  }
  showDogDetailPage(){
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context){
          return DogDetailPage(dog: dog);
        })
    );
  }
}


