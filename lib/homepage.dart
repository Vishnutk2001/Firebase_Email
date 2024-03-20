import 'package:firebase_email/Loginpage.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>login()), (route) => false);
        },),
        title: Text("HomePage"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 300),
            child: Center(child: Text("Welcome to GT Academy",style: TextStyle(color: Colors.black,fontSize: 30),)),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: ElevatedButton(onPressed: (){
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>login()), (route) => false);
            }, child: Text("Logout")),
          )
        ],
      ),

    );
  }
}
