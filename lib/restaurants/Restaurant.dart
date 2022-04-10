import 'package:flutter/material.dart';
import 'package:store/List/Cockaraco.dart';
import 'package:store/List/Onthego.dart';
import '../List/Afghan.dart';
import '../List/BirdOnTree.dart';
import '../List/Denmarrk.dart';
import '../List/FrenchDoor.dart';
import '../List/Haribhavanam.dart';
import '../List/HiddenFork.dart';
import '../List/ItalianFood.dart';
import '../List/Kanakathara.dart';
import '../List/Kannappa.dart';
import '../List/RedPearl.dart';

class Restaurant extends StatefulWidget {
  const Restaurant({Key? key}) : super(key: key);

  @override
  State<Restaurant> createState() => _RestaurantState();
}

class _RestaurantState extends State<Restaurant> {
  List<String> images = [
    "assets/Afghan.jpg",
    "assets/Bird.jpg",
    "assets/Cockraco.jfif",
    "assets/French.jpg",
    "assets/Hari.jpg",
    "assets/Hidden.jpg",
    "assets/Italian.jpg",
    "assets/Kanak.jpg",
    "assets/Onthego.jpg",
    "assets/Red Pearl.jpg",
    "assets/Kannappa.jpg",
    "assets/Denmarrk.jpg",
  ];
  List<String> list = [
    "Afghan Restaurant",
    "Bird On Tree",
    "Cockaraco ",
    "French Door ",
    "Haribhavanam ",
    "Hidden Fork ",
    "Italian Food ",
    "Kanakathara ",
    "On The Go",
    "Red Pearl ",
    "Kannappa ",
    "Denmarrk ",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Restaurants"),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext ctx, int index) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Card(
              shape:Border.all(width: 5, ),
              elevation: 20,
              color: Colors.black,
              child: InkWell(
              onTap: () => {
                if (index==0)
                  Navigator.push(context,MaterialPageRoute(builder: (context)=> const Afghan())),
                if (index==1)
                  Navigator.push(context,MaterialPageRoute(builder: (context)=> const BirdOnTree())),
                if (index==2)
                  Navigator.push(context,MaterialPageRoute(builder: (context)=> const Cockaraco())),
                if (index==3)
                  Navigator.push(context,MaterialPageRoute(builder: (context)=> const FrenchDoor())),
                if (index==4)
                  Navigator.push(context,MaterialPageRoute(builder: (context)=> const Haribhavanam())),
                if (index==5)
                  Navigator.push(context,MaterialPageRoute(builder: (context)=> const HiddenFork ())),
                if (index==6)
                  Navigator.push(context,MaterialPageRoute(builder: (context)=> const ItalianFood())),
                if (index==7)
                  Navigator.push(context,MaterialPageRoute(builder: (context)=> const Kanakathara())),
                if (index==8)
                  Navigator.push(context,MaterialPageRoute(builder: (context)=> const Onthego())),
                if (index==9)
                  Navigator.push(context,MaterialPageRoute(builder: (context)=> const RedPearl())),
                if (index==10)
                  Navigator.push(context,MaterialPageRoute(builder: (context)=> const Kannappa())),
                if (index==11)
                  Navigator.push(context,MaterialPageRoute(builder: (context)=> const Denmarrk())),
              },
              child: Column(
                children: <Widget>[
                  Image.network(images[index]),
                  const SizedBox(height: 10,),
                  Text(list[index], style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 25,
                      fontWeight: FontWeight.bold
                  ), ),
                ],
              ),
            ),
            ),
          );
        },
        itemCount: images.length,
      ),
    );
  }
}