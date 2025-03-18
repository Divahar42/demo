import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  List a =[
    "assets/1.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 80,left: 30),
            child: Text("Welcome To",style: TextStyle(fontSize: 40,color: Colors.green),),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Text("Chitsoft",style: TextStyle(fontSize: 40,color: Colors.green,fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.all(40),
            child: Container(height: 200,width: 300,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("1.jpg"),fit: BoxFit.fill),
              ),),
          ),
          SizedBox(height: 10),
          SizedBox(height: 40,width: 300,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const home()),
                );
              },
              child: Text("Login", style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          SizedBox(height: 10),
          Text("(or)",style: TextStyle(fontSize:20),),
          SizedBox(height: 10),
          SizedBox(height: 40,width: 300,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              onPressed: () {},
              child: Text("Enquiry", style: TextStyle(fontSize: 20, color: Colors.green)),
            ),
          ),
        ],),
      ),
    );
  }
}
