import 'dart:math';

import 'package:flutter/material.dart';

import '../Components/Utils/global.dart';
import '../Components/Utils/list.dart';
import '../Model/bhagwatgeeta_model.dart';

class geetagyan extends StatefulWidget {
  const geetagyan({super.key});

  @override
  State<geetagyan> createState() => _geetagyanState();
}

class _geetagyanState extends State<geetagyan> {
  Random random = Random();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Global.Geetaadhyay =
        bhagwatgeeta.map((e) => Posts.fromMap(Data: e)).toList();
  }
  Widget build(BuildContext context) {

    int RandomIndex = random.nextInt(Global.Geetaadhyay.length);
    Posts quotes = Global.Geetaadhyay[RandomIndex];
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    var i;
    return Scaffold(
      body: Container(
        height: h * .3,
        decoration: BoxDecoration(
        image: DecorationImage(
        image: NetworkImage(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoNuFrsKcG5zMLRUDpWGaxCWR5rC8VifM86A&usqp=CAU",
    ),
    fit: BoxFit.cover,
    ),
    borderRadius: BorderRadius.circular(20),
      ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "${Global.Geetaadhyay[i].shloka}",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "- ${Global.Geetaadhyay[i].translation}",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
