import 'package:flutter/material.dart';

class PollInsights extends StatefulWidget {
  const PollInsights({super.key});

  @override
  State<PollInsights> createState() => _PollInsightsState();
}

class _PollInsightsState extends State<PollInsights> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        toolbarHeight: 65,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Poll Insights",
          style: TextStyle(
            color: Color.fromARGB(255, 40, 40, 40),
            fontWeight: FontWeight.normal,
            fontFamily: 'Lato-Black',
            fontSize: 18,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width,
        color: Colors.lightBlueAccent,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
              side: BorderSide(
                  color: Color.fromARGB(255, 237, 238, 255)
              )
          ),
          shadowColor: Color.fromRGBO(45, 47, 116, 0.4),
          elevation: 8,
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [

                  ],
                ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}
