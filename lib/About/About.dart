import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          width: 300,
          height: 200,
          color: Colors.pinkAccent,
          padding: const EdgeInsets.all(10.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Colors.greenAccent,
            elevation: 10,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Image.asset('assets/Store.jpg',width: 40 ,),
                const ListTile(
                  leading: Icon(Icons.album, size: 60),
                  title: Text(
                      'Store to door',
                      style: TextStyle(fontSize: 30.0)
                  ),
                  subtitle: Text(
                      'Love your Hunger:',
                      style: TextStyle(fontSize: 18.0)
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}