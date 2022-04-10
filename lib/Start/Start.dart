import 'package:flutter/material.dart';
import 'package:store/Food.dart';

import 'package:store/restaurants/Restaurant.dart';

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    final title = 'Store to door';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              margin:EdgeInsets.all(6.0),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: InkWell(
                  onTap: () => {
                    Navigator.push(context,MaterialPageRoute(builder: (context)=> const Restaurant()))
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,  // add this
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(6.0),
                          topRight: Radius.circular(6.0),
                        ),
                        child: Image.network(
                            'assets/1.jpg',
                            width: 150,
                            height: 250,
                            fit:BoxFit.fill

                        ),
                      ),
                      ListTile(
                        title: Text('Restaurants'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin:EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: InkWell(
                  onTap: () => {
                    Navigator.push(context,MaterialPageRoute(builder: (context)=> const Food()))
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                        child: Image.network(
                            'assets/2.jpg',
                            // width: 300,
                            height: 250,
                            fit:BoxFit.fill

                        ),
                      ),
                      const ListTile(
                        title: Text('Dish of the day'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
