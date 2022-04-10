import 'package:flutter/material.dart';
import 'package:store/Widget/Navbar.dart';
import 'globals.dart' as globals;

class finals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Payable '),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 30,
          width: MediaQuery.of(context).size.width * 50,
          decoration: const BoxDecoration(
            image: DecorationImage(
                //scale:2,
                image: NetworkImage('assets/bill.jpg')
            ),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.blue,
                  Colors.red,
                ],
              )
          ),
            child: Text(
              'Your Payable Amount is : '+(globals.tot).toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.done),
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          onPressed: () => {
            Navigator.push(context,MaterialPageRoute(builder: (context)=>const Navbar())),
          },
      ),
    );
  }
}