import 'package:flutter/material.dart';
import 'package:store/final.dart';
import '../globals.dart' as globals;
import 'package:collection/collection.dart';

class ItalianFood extends StatefulWidget {
  const ItalianFood({Key? key}) : super(key: key);

  @override
  State<ItalianFood> createState() => _ItalianFoodState();
}

class _ItalianFoodState extends State<ItalianFood> {
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
    "Pukhtaini Murgh ",
    "Lachha Roti",
    "Subz Gulzar Biriyani ",
    "Tarkari pulao",
    "Safed Basmati Rice",
    "Nalli Nihari",
    "Juli Thaal",
    "Samundari Ratan",
  ];
  List<String> price = [
    "Rs.425",
    "Rs.650",
    "Rs.650",
    "Rs.175",
    "Rs.500",
    "Rs.550",
    "Rs.725",
    "Rs.950",
    "Rs.1050",
    "Rs.1200",
  ];
  List<int> rate=[];
  List<int> toPay=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Italian Food "),
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