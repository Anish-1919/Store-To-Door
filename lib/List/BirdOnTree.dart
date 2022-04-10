import 'package:flutter/material.dart';
import 'package:store/final.dart';
import '../globals.dart' as globals;

class BirdOnTree extends StatefulWidget {
  const BirdOnTree({Key? key}) : super(key: key);

  @override
  State<BirdOnTree> createState() => _BirdOnTreeState();
}


class _BirdOnTreeState extends State<BirdOnTree> {

  List<int> val=[0,0,0,0,0,0,0,0,0,0,0];
  int total=0;

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
    "Rs.85",
  ];
  List<String> images = [
    "assets/VegSizzler.jpg",
    "assets/PaneerSizzler.jpg",
    "assets/ChickenSizzler.jpg",
    "assets/FishSizzler.jpg",
    "assets/VegSizzler.jpg",
    "assets/HotpepperMushroom.jpg",
    "assets/MushroomManchurian.jpg",
    "assets/CreamSoup.jpg",
    "assets/CeasarSalad.jpg",
    "assets/BabyCornCigar.jpg",
    "assets/ChillyParotta.jpg",
  ];
  List<String> text = [
    "Veg Sizzler ",
    "Paneer Sizzler ",
    "Chicken Sizzler ",
    "Fish Sizzler",
    "Sea Food Sizzler ",
    "Hot pepper Mushroom",
    "Mushroom Manchurian",
    "Cream Soup",
    "Ceasar Salad",
    "Baby Corn Cigar",
    "Chilly Parotta",
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

