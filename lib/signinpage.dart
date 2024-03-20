import 'package:firebase_email/Loginpage.dart';
import 'package:flutter/material.dart';

import 'auth_service.dart';
import 'homepage.dart';

class sign extends StatefulWidget {
  const sign({super.key});

  @override
  State<sign> createState() => _signState();
}

class _signState extends State<sign> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("signpage"),
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
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email),
                        label: Text("Enter email")),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock),
                          label: Text("Enter password")),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: ElevatedButton(
                        onPressed: () async {
                          final message = await AuthService().registration(
                            email: _emailController.text,
                            password: _passwordController.text,
                          );
                          if (message!.contains('Success')) {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const home()));
                          }
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(message),
                            ),
                          );
                        },
                        child: Text("Sign in")),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 100),
                child: Text("I Already have an account"),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: GestureDetector(
                    onTap: ()  {
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>login()), (route) => false);
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.blue),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
