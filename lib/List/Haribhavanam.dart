import 'package:flutter/material.dart';
import 'package:store/final.dart';
import '../globals.dart' as globals;

class Haribhavanam extends StatefulWidget {
  const Haribhavanam({Key? key}) : super(key: key);

  @override
  State<Haribhavanam> createState() => _HaribhavanamState();
}

class _HaribhavanamState extends State<Haribhavanam> {
  List<int> val=[0,0,0,0,0,0,0,0,0,0];
  int total=0;
  List<String> images = [
    "assets/VegBiriyani.jpg",
    "assets/PaneerBiriyani.jpg",
    "assets/ChickenBiriyani.jpg",
    "assets/FishBiriyani.jpg",
    "assets/PrawnBiriyani.jpg",
    "assets/HotpepperMushroom.jpg",
    "assets/MushroomManchurian.jpg",
    "assets/CreamSoup.jpg",
    "assets/CeasarSalad.jpg",
    "assets/BabyCornCigar.jpg",
  ];
  List<String> text = [
    "Veg Biriyani ",
    "Paneer Biriyani ",
    "Chicken Biriyani ",
    "Fish Biriyani ",
    "Sea Food Biriyani ",
    "Hot pepper Mushroom",
    "Mushroom Manchurian",
    "Cream Soup",
    "Ceasar Salad",
    "Baby Corn Cigar",
  ];
  List<String> price = [
    "Rs.450",
    "Rs.475",
    "Rs.500",
    "Rs.525",
    "Rs.550",
    "Rs.650",
    "Rs.175",
    "Rs.225",
    "Rs.275",
    "Rs.300",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Bird on Tree"),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext, index){
          return ListTile(
            leading: CircleAvatar(backgroundImage: AssetImage(images[index]),),
            title: Text(text[index]),
            subtitle: Text(price[index]),
            trailing: SizedBox(
              width: 150,
              child: Row(
                children: [
                  IconButton(onPressed: (){setState(() => {val[index]++});}, icon:const Icon(Icons.favorite)),
                  Text(val[index].toString(),style: const TextStyle(fontSize: 20.0)),
                  IconButton(onPressed:(){setState(() => {if (val[index] != 0) val[index]--});} , icon:const Icon(Icons.delete)),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext,index)
        {
          return Divider(height: 1);
        },
        itemCount: images.length,
        shrinkWrap: true,
        padding: EdgeInsets.all(5),
        scrollDirection: Axis.vertical,
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.shopping_cart),
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          onPressed: () => {total=0,
            //print(sum()),
            globals.tot=sum(),
            //print(globals.tot),
            Navigator.push(context,MaterialPageRoute(builder: (context)=> finals())),
          }
      ),
    );

  }
  int sum(){
    int k=0;
    for (var v in val) {
      if(v!=0 && v>0){
        k=val.indexOf(v);
        total+= v * int.parse(price[k].substring(3));
      }
    }
    return total;
  }
}