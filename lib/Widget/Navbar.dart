import 'package:flutter/material.dart';
import 'package:store/Food.dart';
import 'package:store/Start/Start.dart';
import 'package:store/restaurants/Restaurant.dart';
import '../About/About.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;

  void onItemTapped(int _index) {
    setState(() {
      _selectedIndex = _index;
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[
    Start(),
    Restaurant(),
    Food(),
    About(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child :Align(
              alignment:Alignment.topLeft,
              child:_widgetOptions.elementAt(_selectedIndex),
            )
        ),
        bottomNavigationBar:Theme(
          data: Theme.of(context).copyWith(canvasColor: Colors.blueAccent,),
          child: BottomNavigationBar(
            items:const [
              BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.restaurant),label: 'Restaurant'),
              BottomNavigationBarItem(icon: Icon(Icons.fastfood),label: 'Dish Of the day'),
              BottomNavigationBarItem(icon:Icon(Icons.account_box_rounded),label: 'About')
            ],
            currentIndex: _selectedIndex,
            onTap: onItemTapped,
          ),
        ),
    );
  }
}