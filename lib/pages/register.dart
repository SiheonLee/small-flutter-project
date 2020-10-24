import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final idController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 30,),
              Center(
                child: Text(
                    'Welcome to A2!!',
                    style: TextStyle(fontFamily: 'SFNS', fontSize: 38)),
              ),
              SizedBox(height: 60,),
              TextField(
                maxLength: 30,
                controller: idController,
                decoration: InputDecoration(
                  hintText: 'ID'
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: passwordController,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                  hintText: 'password'
                ),
              ),
              SizedBox(height: 30,),
              RaisedButton(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                onPressed: () {},
                color: Colors.blue[200],
                child: Text('Register', style: TextStyle(fontSize: 17),),
              )
            ],
          ),
        ),
      ),

    );

}
