
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../terrariumspiders/model.dart';
import 'edit_animal_screen.dart';

class SpiderScreen extends StatefulWidget {
  const SpiderScreen({required this.m,Key? key,}) : super(key: key);
  final Map m;

  @override
  _SpiderScreen createState() => _SpiderScreen();
}

class _SpiderScreen extends State<SpiderScreen> {

  final dbRef=FirebaseDatabase.instance.reference().child('Spiders');
  FirebaseAuth _auth = FirebaseAuth.instance;
  Color _getColorFromHex(String hexColor) {
    hexColor = hexColor.replaceAll("#", "");
    return Color(int.parse("$hexColor"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spider'),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: (){
              final User? user = _auth.currentUser;
              if(user?.email==widget.m['Email']||user?.email=='wrona64@vp.pl'){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Edit_Spider(
                      Id: int.parse('${widget.m['Id']}'),
                      Description: widget.m['Spider_Description'],
                      Name: widget.m['Spider_Name'],
                      head_2: widget.m['Spider_head_2'],
                      head_3: widget.m['Spider_head_3'],
                      body_2: widget.m['Spider_body_2'],
                      body_3: widget.m['Spider_body_3'],
                      legs_2: widget.m['Spider_legs_2'],
                      legs_3: widget.m['Spider_legs_3'],
                      chelicer_2: widget.m['Spider_chelicer_2'],
                      chelicer_3: widget.m['Spider_chelicer_3'],
                      venom: widget.m['Spider_venom'],
                      speed: widget.m['Spider_speed'],
                      temperament: widget.m['Spider_temperament'],
                      mode: widget.m['Spider_mode'],
                      hair: widget.m['Spider_hair'],
                      blFemale: double.parse('${widget.m['Spider_blFemale']}'),
                      blMale: double.parse('${widget.m['Spider_blMale']}'),
                      blCocoon: double.parse('${widget.m['Spider_blCocoon']}'),
                      head_Color: _getColorFromHex(widget.m['Spider_head_Color']),
                      head_2_Color: _getColorFromHex(widget.m['Spider_head_2_Color']),
                      head_3_Color: _getColorFromHex(widget.m['Spider_head_3_Color']),
                      body_Color: _getColorFromHex(widget.m['Spider_body_Color']),
                      body_2_Color: _getColorFromHex(widget.m['Spider_body_2_Color']),
                      body_3_Color: _getColorFromHex(widget.m['Spider_body_3_Color']),
                      legs_Color: _getColorFromHex(widget.m['Spider_legs_Color']),
                      legs_2_Color: _getColorFromHex(widget.m['Spider_legs_2_Color']),
                      legs_3_Color: _getColorFromHex(widget.m['Spider_legs_3_Color']),
                      chelicer_Color: _getColorFromHex(widget.m['Spider_chelicer_Color']),
                      chelicer_2_Color: _getColorFromHex(widget.m['Spider_chelicer_2_Color']),
                      chelicer_3_Color: _getColorFromHex(widget.m['Spider_chelicer_3_Color']),
                    )));
              }
            },
            child: Icon(Icons.create),),
          SizedBox(width: 10,),
          InkWell(
            onTap: (){
              // final User? user = _auth.currentUser;
              // if(user?.email==widget.m['Email']){
              // }
              dbRef.child("Spiders List/${widget.m['Id']}").remove();
              Navigator.of(context).pop();
            },
            child: Icon(Icons.delete),),
          SizedBox(width: 10,),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.only(top: 16,right: 16,left: 16),
              child: Center(child: Text('${widget.m['Spider_Name']}',
                style: TextStyle(fontSize: 25),textAlign: TextAlign.center,)),
            ),

            Center(
              child:Animal(
                animal_Size: MediaQuery.of(context).size.width/1.5,
                animal_head_Color: widget.m['Spider_head_Color'],
                animal_body_Color: widget.m['Spider_body_Color'],
                animal_legs_Color: widget.m['Spider_legs_Color'],
                animal_chelicer_Color: widget.m['Spider_chelicer_Color'],
                animal_head_2: widget.m['Spider_head_2'],animal_head_2_Color: widget.m['Spider_head_2_Color'],
                animal_head_3: widget.m['Spider_head_3'],animal_head_3_Color: widget.m['Spider_head_3_Color'],
                animal_body_2: widget.m['Spider_body_2'],animal_body_2_Color: widget.m['Spider_body_2_Color'],
                animal_body_3: widget.m['Spider_body_3'],animal_body_3_Color: widget.m['Spider_body_3_Color'],
                animal_legs_2: widget.m['Spider_legs_2'],animal_legs_2_Color: widget.m['Spider_legs_2_Color'],
                animal_legs_3: widget.m['Spider_legs_3'],animal_legs_3_Color: widget.m['Spider_legs_3_Color'],
                animal_chelicer_2: widget.m['Spider_chelicer_2'],animal_chelicer_2_Color: widget.m['Spider_chelicer_2_Color'],
                animal_chelicer_3: widget.m['Spider_chelicer_3'],animal_chelicer_3_Color: widget.m['Spider_chelicer_3_Color'],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width/3,
                    child: LinearProgressIndicator(
                      value: widget.m['Spider_venom']/4,
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    ),
                  ),
                  Container(
                      width: 40,
                      height: 40,
                      child: Image.asset('assets/attributevenom.png',)
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width/3,
                    child: LinearProgressIndicator(
                      value: widget.m['Spider_speed']/4,
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow),
                    ),
                  ),
                  Container(
                      width: 40,
                      height: 40,
                      child: Image.asset('assets/attributespeed.png',)
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width/3,
                    child: LinearProgressIndicator(
                      value: widget.m['Spider_temperament']/4,
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                    ),
                  ),
                  Container(
                      width: 40,
                      height: 40,
                      child: Image.asset('assets/attributetemperament.png',)
                  ),
                ],
              ),
            ],),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(children: [
                    Container(
                        width: 40,
                        height: 40,
                        child: Image.asset('assets/gender2.png',)
                    ),
                    Text('${widget.m['Spider_blFemale']} cm',
                      style: TextStyle(fontSize: 20),),
                  ],),
                  Row(children: [
                    Container(
                        width: 40,
                        height: 40,
                        child: Image.asset('assets/cocoon.png',)
                    ),
                    Text('${widget.m['Spider_blCocoon']} cm+',
                      style: TextStyle(fontSize: 20),),
                  ],),
                  Row(children: [
                    Container(
                        width: 40,
                        height: 40,
                        child: Image.asset('assets/gender1.png',)
                    ),
                    Text('${widget.m['Spider_blMale']} cm',
                      style: TextStyle(fontSize: 20),),
                  ],),
                ],),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        width: 64,
                        height: 64,
                        child: Image.asset('assets/mode${widget.m['Spider_mode']}.png',)
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(children: [
                      Container(
                          width: 64,
                          height: 64,
                          child: Image.asset('assets/shadow_body.png',)
                      ),
                      Container(
                          width: 64,
                          height: 64,
                          child: Image.asset('assets/shadow_head.png',)
                      ),
                      Container(
                          width: 64,
                          height: 64,
                          child: Image.asset('assets/shadow_legs.png',)
                      ),
                      Container(
                          width: 64,
                          height: 64,
                          child: Image.asset('assets/shadow_chelicer.png',)
                      ),
                      Container(
                          width: 64,
                          height: 64,
                          child: Image.asset('assets/hairy${widget.m['Spider_hair']}.png',)
                      ),
                    ],),
                  ],
                ),
              ],),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(child: Text('${widget.m['Spider_Description']}',
                style: TextStyle(fontSize: 15),textAlign: TextAlign.center,)),
            ),

            const SizedBox(
              height: 10,
            ),

          ],
        ),
      ),
    );
  }
}