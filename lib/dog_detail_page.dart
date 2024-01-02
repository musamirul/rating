import 'package:flutter/material.dart';

import 'dog_model.dart';

class DogDetailPage extends StatefulWidget {
  final Dog dog;

  const DogDetailPage({super.key, required this.dog});

  @override
  State<DogDetailPage> createState() {
    return _DogDetailPageState();
  }
}

class _DogDetailPageState extends State<DogDetailPage> {
  final double dogAvatarSize = 150;

  double _sliderValue = 10;

  Future<Null> _ratingErrorDialog() async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error'),
          content: const Text('Theyre good dogs, Bran'),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Try again'),
            )
          ],
        );
      },
    );
  }

  Widget get addYourRating {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 16.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Slider(
                  activeColor: Colors.indigoAccent,
                  min: 0.0,
                  max: 15.0,
                  onChanged: (newRating) {
                    setState(() => _sliderValue = newRating);
                  },
                  value: _sliderValue,
                ),
              ),
              Container(
                width: 50.0,
                alignment: Alignment.center,
                child: Text('${_sliderValue.toInt()}',
                    style: Theme.of(context).textTheme.displaySmall),
              ),
            ],
          ),
        ),
        submitRatingButton,
      ],
    );
  }

  Widget get submitRatingButton {
    return ElevatedButton(onPressed: updateRating, child: Text('Submit'));
  }

  void updateRating() {
    if(_sliderValue<10){
      _ratingErrorDialog();
    }else {
      setState(() {
        widget.dog.rating = _sliderValue.toInt();
      });
    }
  }

  Widget get rating {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.star,
          size: 40,
        ),
        Text(
          '${widget.dog.rating}/10',
          style: Theme.of(context).textTheme.displaySmall,
        )
      ],
    );
  }

  Widget get dogProfile {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 32),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [
            0.1,
            0.5,
            0.7,
            0.9
          ],
              colors: [
            Colors.indigo.shade800,
            Colors.indigo.shade700,
            Colors.indigo.shade600,
            Colors.indigo.shade400,
          ])),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '${widget.dog.name}',
            style: TextStyle(fontSize: 32),
          ),
          Text(
            '${widget.dog.location}',
            style: TextStyle(fontSize: 20),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: Text(widget.dog.description),
          ),
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
        body: ListView(
          children: [dogProfile, addYourRating],
        ));
  }
}
