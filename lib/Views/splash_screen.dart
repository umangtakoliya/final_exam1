import 'package:flutter/material.dart';

import 'home_page.dart';

class Splash_screen extends StatefulWidget {
  const Splash_screen({super.key});

  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey,
              image: DecorationImage(
                image: NetworkImage("https://media.tenor.com/Vqi4WkobAHMAAAAd/the-bhagavad-gita-lord-krishna.gif"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
          top: 700,
            left: 200,
            child: GestureDetector(
              onTap: (){
                Navigator.of(context).pushNamed('home');
              },
              child: Container(
                height: 70,
                width: 200,
               decoration: BoxDecoration(
                 color: Colors.black38,
                 borderRadius: BorderRadius.circular(20)
               ),
                child: Center(
                  child: Text(
                    "Start",
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),

                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}


