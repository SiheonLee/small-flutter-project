import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Security extends StatefulWidget {
  @override
  _SecurityState createState() => _SecurityState();
}

class _SecurityState extends State<Security> {

  final codeController = TextEditingController();
  FirebaseFirestore db;

  validate({String input}){
    Future<DocumentSnapshot> result = getCode();
    result.then((value) =>value.get('code') == codeController.text ? Navigator.pushReplacementNamed(context, '/home') : showAlertDialog(context));
  }

  Future<DocumentSnapshot> getCode() async {
    await Firebase.initializeApp();
    db = FirebaseFirestore.instance;
    return await db.collection('SecurityCode').doc('doc_code').get();
  }

  @override
  void dispose() {
    codeController.dispose();
    super.dispose();
  }

  showAlertDialog(BuildContext context) {
    Widget okButton = FlatButton(onPressed: () {Navigator.pop(context);}, child: Text("OK"));

    AlertDialog alert = AlertDialog(
      title: Text('Error'),
      content: Text('The given code doesn\'t match, please try again'),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: codeController,
                decoration: InputDecoration(
                  hintText: 'Enter the security code'
                ),
              ),
              RaisedButton.icon(
                  onPressed: () {
                    validate(input: codeController.text);
                  },
                  icon: Icon(
                    Icons.send
                  ),
                  label: Text('Submit', style: TextStyle(fontFamily: 'SFNS'),))
            ],
          )
        ),
      ),

    );
  }

}
