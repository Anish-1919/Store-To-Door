import 'package:flutter/material.dart';
import 'package:store/final.dart';
import '../globals.dart' as globals;
import 'package:collection/collection.dart';

class Kanakathara extends StatefulWidget {
  const Kanakathara({Key? key}) : super(key: key);

  @override
  State<Kanakathara> createState() => _KanakatharaState();
}

class _KanakatharaState extends State<Kanakathara> {
  List<int> val=[0,0,0,0,0,0,0,0,0,0];
  int total=0;
  List<String> images = [
    "assets/JeeraRice.jpg",
    "assets/ShanghaiVegRice.jpg",
    "assets/EggNoodles.jpg",
    "assets/Roti.jpg",
    "assets/ButterRoti.jpg",
    "assets/GarlicNaan.jpg",
    "assets/BunParotta.jpg",
    "assets/Phulka.jpg",
    "assets/eggKothuParotta.jpg",
    "assets/ChillyParotta.jpg",
  ];
  List<String> text = [
    "Jeera Rice ",
    "Shanghai Veg Rice ",
    "Egg Noodles ",
    "Roti",
    "Butter Roti ",
    "Garlic Naan",
    "Bun Parotta",
    "Phulka",
    "Egg Kothu Parotta",
    "Chilly Parotta",
  ];
  List<String> price = [
    "Rs.150",
    "Rs.179",
    "Rs.145",
    "Rs.35",
    "Rs.40",
    "Rs.50",
    "Rs.175",
    "Rs.225",
    "Rs.275",
    "Rs.85",
  ];
  List<int> rate=[];
  List<int> toPay=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Kanakathara"),
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
          onPressed: () => {toPay=[0,0,0,0,0,0,0,0,0,0],
            total=0,
            //print(val),
            globals.tot=sum(),
            //print(globals.tot),
            Navigator.push(context,MaterialPageRoute(builder: (context)=> finals())),
          }
      ),
    );

  }
  int sum(){
    for(var i in price){
      rate.add(int.parse(i.substring(3)));
    }

    for (var i=0;i<val.length;i++) {
      if(val[i]!=0 && val[i]>0){
        toPay.add(val[i]*rate[i]);
      }
    }
    total=toPay.sum;
    return total;
  }
}