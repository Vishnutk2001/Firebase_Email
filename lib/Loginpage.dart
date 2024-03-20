import 'package:firebase_email/signinpage.dart';
import 'package:flutter/material.dart';

import 'auth_service.dart';
import 'homepage.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login page"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 180),
            child: Container(
              height: 250,
              width: 300,
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),prefixIcon: Icon(Icons.email),
                        label: Text("Enter email")
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),prefixIcon: Icon(Icons.lock),
                          label: Text("Enter password")
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: ElevatedButton(onPressed: () async {
                      final message = await AuthService().login(
                        email: _emailController.text,
                        password: _passwordController.text,
                      );
                      if (message!.contains('Success')) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const home(),
                          ),
                        );
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(message),
                        ),
                      );
                    }, child: Text("Login")),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 100),
                child: Text("Create a new account"),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: GestureDetector(onTap: (){
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context)=>sign()), (route) => false);

                },
                    child: Text("Sign in",style: TextStyle(color: Colors.blue),)),
              )
            ],
          ),
        ],
      ),
    );
  }
}
