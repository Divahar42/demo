import 'package:demo/name.dart';
import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  List a =["assets/1.jpg"];
  String? selectedCountryName;
  void _showCountryPicker(){
    showCountryPicker(context: context,showPhoneCode: true, onSelect: (Country country){
      setState(() {
        selectedCountryName = "${country.flagEmoji}${country.name}(${country.phoneCode})";
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(onPressed: (){
        Navigator.pop(context);
      }, icon: Icon(Icons.arrow_back)),),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: RichText(text: TextSpan(children: [
            TextSpan(text: "Welcome To         ",style: TextStyle(fontSize: 40,color: Colors.green)),
            TextSpan(text: "Chitsoft",style: TextStyle(fontSize: 40,color: Colors.green,fontWeight: FontWeight.bold))
          ])),
        ),
        Container(height: 150,width:300,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("1.jpg"),fit: BoxFit.fill),
          ),),
        SizedBox(height:10),
        Text("Login",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            decoration: InputDecoration(
                hintText: "Enter Chit ID",
                border: OutlineInputBorder()
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            decoration: InputDecoration(
                hintText: "Enter Password",
                border: OutlineInputBorder()
            ),
            obscureText: true,
          ),
        ),Padding(
          padding: const EdgeInsets.only(left:200),
          child: Text("Forget password?",style: TextStyle(fontSize: 20,color: Colors.green),),
        ),

        SizedBox(height:10),
        SizedBox(height: 40,width: 300,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            onPressed: () {},
            child: Text("Login", style: TextStyle(fontSize: 20, color: Colors.white)),
          ),
        ),
        SizedBox(height: 10),
        Text("(or) login with",style: TextStyle(fontSize:20),),
        SizedBox(height: 10),
        SizedBox(height: 40,width: 300,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const home()),
              );
            },
            child: Text("Mobile Number", style: TextStyle(fontSize: 20, color: Colors.green)),
          ),
        ),
        SizedBox(height: 10),
        SizedBox(height:40,width: 300,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),onPressed: _showCountryPicker, child: Text("Pick Your County",style: TextStyle(fontSize: 20, color: Colors.green)))),
        SizedBox(height: 10),
        Container(child:
        Text(selectedCountryName??"No country selected",style: TextStyle(fontSize: 18),),),
        Padding(
          padding: const EdgeInsets.only(left:135,top:100),
          child: Row(
            children: [
              Text("Guest Mode",style: TextStyle(fontSize: 20),),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
        )
      ],),
    );
  }
}