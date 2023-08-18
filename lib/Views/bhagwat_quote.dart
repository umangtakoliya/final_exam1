import 'dart:math';

import 'package:flutter/material.dart';
import '../Components/Utils/global.dart';
import '../Components/Utils/list.dart';
import '../Model/bhagwatgeeta_model.dart';

class All_Quotes extends StatefulWidget {
  const All_Quotes({super.key});

  @override
  State<All_Quotes> createState() => _All_QuotesState();
}

class _All_QuotesState extends State<All_Quotes> {
  bool isToggled = true;
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
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    int RandomIndex = random.nextInt(Global.QuotsData.length);
    Posts quotes = Global.QuotsData[RandomIndex];

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isToggled = !isToggled;
          });
        },
        child: Icon(
          (isToggled == true) ? Icons.grid_3x3 : Icons.list,
          color: Colors.black.withOpacity(.8),
        ),
        backgroundColor: Color(0xffebcecc).withOpacity(.74),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Bhagwat Geeta",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.grey,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    elevation: 5,
                    title: Text("${quotes.shloka}"),
                    content: Text("- ${quotes.translation}"),
                  ),
                );
              });
            },
            icon: const Icon(
              Icons.refresh,
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
              image: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQWqr9yrSIR5nh__2DT3RqrcC6ZStjyUzQGA&usqp=CAU"),
              fit: BoxFit.cover,
            )),
          ),
          (isToggled == true)
              ? Scrollbar(
                  child: ListView.builder(
                    itemCount: Global.QuotsData.length,
                    itemBuilder: (BuildContext context, int i) => Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "details_page",
                              arguments: Global.QuotsData[i]);
                        },
                        child: Container(
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
                                  "${Global.QuotsData[i].shloka}",
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
                                "- ${Global.QuotsData[i].translation}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : Scrollbar(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: Global.QuotsData.length,
                    itemBuilder: (BuildContext context, int i) =>
                        GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "details_page",
                            arguments: Global.QuotsData[i]);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvBBR2TBeSL4SPt8M-Zl10Q0_io7Rp77Krxg&usqp=CAU",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  height: 90,
                                  child: SingleChildScrollView(
                                    child: Text(
                                      "${Global.QuotsData[i].shloka}",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "- ${Global.QuotsData[i].translation}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      overflow: TextOverflow.ellipsis
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
