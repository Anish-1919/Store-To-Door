import 'package:flutter/material.dart';
import 'package:store/final.dart';
import '../globals.dart' as globals;

class FrenchDoor extends StatefulWidget {
  const FrenchDoor({Key? key}) : super(key: key);

  @override
  State<FrenchDoor> createState() => _FrenchDoorState();
}

class _FrenchDoorState extends State<FrenchDoor> {

  List<int> val=[0,0,0,0,0,0,0,0,0,0];
  int total=0;
  List<String> images = [
    "assets/campari.jpg",
    "assets/Akhtari.jpg",
    "assets/Pukhtaini.jfif",
    "assets/LachhaRoti.jpg",
    "assets/SubzGulzarBiriyani.jfif",
    "assets/Tarkari pulao.jpeg",
    "assets/SafedBasmatiRice.jpg",
    "assets/NalliNihari.jpg",
    "assets/JuliThaal.jpg",
    "assets/SamundariRatan.jpg",
  ];
  List<String> text = [
    "Campari ",
    "Akhtari Murgh ",
    "Nalli Nihari",
    "Pukhtaini Murgh ",
    "Lachha Roti",
    "Subz Gulzar Biriyani ",
    "Tarkari pulao",
    "Safed Basmati Rice",
    "Juli Thaal",
    "Samundari Ratan",
  ];
  List<String> price = [
    "Rs.525",
    "Rs.350",
    "Rs.250",
    "Rs.875",
    "Rs.500",
    "Rs.550",
    "Rs.425",
    "Rs.950",
    "Rs.1850",
    "Rs.1300",
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