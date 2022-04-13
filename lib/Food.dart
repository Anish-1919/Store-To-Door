import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Food extends StatefulWidget {
  const Food({Key? key}) : super(key: key);

  @override
  State<Food> createState() => _FoodState();
}

class _FoodState extends State<Food> {

  String url='https://foodish-api.herokuapp.com/api/';
  late Map map;

  Future<void> fetchData() async{
    var response=await http.get(Uri.parse(url));
    var json=jsonDecode(response.body);

    if(response.statusCode==200){
      setState(() {
        map=json;
      });
    }
  }
  @override
  void initState(){
    map = {"image":"assets/loading.gif"};
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Container(
          decoration:const BoxDecoration(
            gradient:LinearGradient(
              begin:Alignment.bottomRight,
              end:Alignment.bottomLeft,
              colors:[
                Colors.yellow,
                Colors.orangeAccent,
              ]
            ),
          ),
          child:const Text('STD Dish of the day  '),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle:true,
      ),
      body: Container(
        child: Center(
          child: Container(
            height:MediaQuery.of(context).size.height,
            width:MediaQuery.of(context).size.width,
            child: Image.network(
                map["image"],
                //fit: BoxFit.cover,
            ),
          ),
        )
      ),
    );
  }
}
