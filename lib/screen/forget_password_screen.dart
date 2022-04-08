import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../terrariumspiders/widget.dart';

class Forget_password extends StatefulWidget {
  const Forget_password({Key? key}) : super(key: key);

  @override
  _Forget_password createState() => _Forget_password();
}

class _Forget_password extends State<Forget_password> {

  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _emailTextController = TextEditingController();

  final _formKey=GlobalKey<FormState>();
  String email='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Forget password",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                //logoWidget("assets/images/logo1.png"),
                // const SizedBox(
                //   height: 30,
                // ),

                Text_TextField("Enter Email", Icons.person_outline, false, _emailTextController),
                const SizedBox(
                  height: 20,
                ),

                Button(title: 'Sign In', onPress: () {
                    try{
                      _auth.sendPasswordResetEmail(email: _emailTextController.text.toString()).then((value){

                      }).onError((error, stackTrace){

                      });
                    }catch(e){

                    }
                }),

                //  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));


              ],
            ),
          ),
        ),
      ),
    );
  }
}