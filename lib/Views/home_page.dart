 import 'dart:math';

import 'package:festival_post/Components/Utils/list.dart';
import 'package:flutter/material.dart';

import '../Components/Utils/global.dart';
import '../Model/bhagwatgeeta_model.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  Random random = Random();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Global.QuotsData =
        bhagwatgeeta.map((e) => Posts.fromMap(Data: e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    int RandomIndex = random.nextInt(Global.QuotsData.length);
    Posts quotes = Global.QuotsData[RandomIndex];
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Bhagwat Geeta",
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.grey,
        elevation: 2,
        shadowColor: Colors.grey,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.account_circle_outlined,
              color: Colors.black,
            ),
          )
        ],

      ),

      body: Stack(
        children: [

          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
              image:NetworkImage
                ("https://w0.peakpx.com/wallpaper/566/260/HD-wallpaper-shree-krishna-govardhan-hill-lord-god-kanha.jpg"),
              fit: BoxFit.cover,
            )),
          ),SizedBox(
            height: 100,
          ),

          Container(

            padding: EdgeInsets.only(
              top: 18,
              left: 18,
              right: 18,
            ),
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Center(

                    child: Container(



                      height: h * .3,
                      width: w * .9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,

                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ...BhagwatGeetaImageList.map(
                              (e) => Container(
                                height: h * .3,
                                width: w * .9,
                                decoration: BoxDecoration(
                                  // borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: NetworkImage("${e['post_image']}",),
                                    fit: BoxFit.cover
                                  ),
                                ),
                              ),
                            ).toList(),
                          ],
                        ),
                      ),
                    ),
                  ),


                  SizedBox(
                    height: 200,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "all_Quotes");
                    },
                    child: Container(
                      height: h * .08,
                      width: w * .9,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xffd1eadd).withOpacity(.4),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "...All Sholk...",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),


                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
