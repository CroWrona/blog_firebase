import 'package:blog/terrariumspiders/widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import '../terrariumspiders/model.dart';


class Add_Spider extends StatefulWidget {
  const Add_Spider({Key? key}) : super(key: key);

  @override
  _Add_SpiderState createState() => _Add_SpiderState();
}

class _Add_SpiderState extends State<Add_Spider> {

  final postRef = FirebaseDatabase.instance.reference().child('Spiders');
  FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  int venom=1,speed=1,temperament=1;
  int mode=0,hair=0;

  int head_2=0;
  int body_2=0;
  int legs_2=0;
  int chelicer_2=0;
  int head_3=0;
  int body_3=0;
  int legs_3=0;
  int chelicer_3=0;

  double blFemale=0;
  double blMale=0;
  double blCocoon=0;

  Color head_Color = Color(0xff240c01);
  Color body_Color = Color(0xff240c01);
  Color legs_Color = Color(0xff240c01);
  Color chelicer_Color = Color(0xff240c01);
  Color head_2_Color = Color(0xff164357);
  Color body_2_Color = Color(0xff164357);
  Color legs_2_Color = Color(0xff164357);
  Color chelicer_2_Color = Color(0xff164357);
  Color head_3_Color = Color(0xff42654a);
  Color body_3_Color = Color(0xff42654a);
  Color legs_3_Color = Color(0xff42654a);
  Color chelicer_3_Color = Color(0xff42654a);

  // create some values
  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);
  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }
  void dialog(context, String spider) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Pick a color!'),
            content: SingleChildScrollView(
              child: ColorPicker(
                pickerColor: pickerColor,
                onColorChanged: changeColor,
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('Got it'),
                onPressed: () {
                  setState(() {
                    currentColor = pickerColor;

                    if(spider=='head_'){
                      head_Color=pickerColor;
                    }
                    else if(spider=='head_2'){
                      head_2_Color=pickerColor;
                    }
                    else if(spider=='head_3'){
                      head_3_Color=pickerColor;
                    }
                    else if(spider=='body_'){
                      body_Color=pickerColor;
                    }
                    else if(spider=='body_2'){
                      body_2_Color=pickerColor;
                    }
                    else if(spider=='body_3'){
                      body_3_Color=pickerColor;
                    }
                    else if(spider=='legs_'){
                      legs_Color=pickerColor;
                    }
                    else if(spider=='legs_2'){
                      legs_2_Color=pickerColor;
                    }
                    else if(spider=='legs_3'){
                      legs_3_Color=pickerColor;
                    }
                    else if(spider=='chelicer_'){
                      chelicer_Color=pickerColor;
                    }
                    else if(spider=='chelicer_2'){
                      chelicer_2_Color=pickerColor;
                    }
                    else if(spider=='chelicer_3'){
                      chelicer_3_Color=pickerColor;
                    }
                  });

                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }
    );
  }

  int maxHead=11;
  int maxBody=24;
  int maxLegs=18;
  int maxChelicer=12;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Spider'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
          child: Column(
            children: [
              Animal_add(animal_Size: 200,
                animal_head_Color: head_Color,animal_body_Color: body_Color,
                animal_legs_Color: legs_Color,animal_chelicer_Color: chelicer_Color,
                animal_head_2: head_2,animal_head_2_Color: head_2_Color,
                animal_head_3: head_3,animal_head_3_Color: head_3_Color,
                animal_body_2: body_2,animal_body_2_Color: body_2_Color,
                animal_body_3: body_3,animal_body_3_Color: body_3_Color,
                animal_legs_2: legs_2,animal_legs_2_Color: legs_2_Color,
                animal_legs_3: legs_3,animal_legs_3_Color: legs_3_Color,
                animal_chelicer_2: chelicer_2,animal_chelicer_2_Color: chelicer_2_Color,
                animal_chelicer_3: chelicer_3,animal_chelicer_3_Color: chelicer_3_Color,
              ),

              //head
              ColorDesignSpider_AddSpider(
                onPressLeft_2: () {setState(() {if(head_2>0){head_2--;}}); },
                onPressRight_2: () {setState(() {if(head_2<maxHead){head_2++;}});},
                onPressLeft_3: () {setState(() {if(head_3>0){head_3--;}});},
                onPressRight_3: () {setState(() {if(head_3<maxHead){head_3++;}});},
                onPressColor_2: (){setState(() {dialog(context,'head_2');});},
                onPressColor_1: (){setState(() {dialog(context,'head_');});},
                onPressColor_3: (){setState(() {dialog(context,'head_3');});},
                color_2: head_2_Color,
                color_1: head_Color,
                color_3: head_3_Color,
              ),
              //body
              ColorDesignSpider_AddSpider(
                onPressLeft_2: () {setState(() {if(body_2>0){body_2--;}}); },
                onPressRight_2: () {setState(() {if(body_2<maxBody){body_2++;}});},
                onPressLeft_3: () {setState(() {if(body_3>0){body_3--;}});},
                onPressRight_3: () {setState(() {if(body_3<maxBody){body_3++;}});},
                onPressColor_2: (){setState(() {dialog(context,'body_2');});},
                onPressColor_1: (){setState(() {dialog(context,'body_');});},
                onPressColor_3: (){setState(() {dialog(context,'body_3');});},
                color_2: body_2_Color,
                color_1: body_Color,
                color_3: body_3_Color,
              ),
              //legs
              ColorDesignSpider_AddSpider(
                onPressLeft_2: () {setState(() {if(legs_2>0){legs_2--;}}); },
                onPressRight_2: () {setState(() {if(legs_2<maxLegs){legs_2++;}});},
                onPressLeft_3: () {setState(() {if(legs_3>0){legs_3--;}});},
                onPressRight_3: () {setState(() {if(legs_3<maxLegs){legs_3++;}});},
                onPressColor_2: (){setState(() {dialog(context,'legs_2');});},
                onPressColor_1: (){setState(() {dialog(context,'legs_');});},
                onPressColor_3: (){setState(() {dialog(context,'legs_3');});},
                color_2: legs_2_Color,
                color_1: legs_Color,
                color_3: legs_3_Color,
              ),
              //chelicer
              ColorDesignSpider_AddSpider(
                onPressLeft_2: () {setState(() {if(chelicer_2>0){chelicer_2--;}}); },
                onPressRight_2: () {setState(() {if(chelicer_2<maxChelicer){chelicer_2++;}});},
                onPressLeft_3: () {setState(() {if(chelicer_3>0){chelicer_3--;}});},
                onPressRight_3: () {setState(() {if(chelicer_3<maxChelicer){chelicer_3++;}});},
                onPressColor_2: (){setState(() {dialog(context,'chelicer_2');});},
                onPressColor_1: (){setState(() {dialog(context,'chelicer_');});},
                onPressColor_3: (){setState(() {dialog(context,'chelicer_3');});},
                color_2: chelicer_2_Color,
                color_1: chelicer_Color,
                color_3: chelicer_3_Color,
              ),

              SizedBox(height: 20,),

              VenomSpeedTemperament_AddSpider(
                i: venom,
                image: 'assets/attributevenom.png',
                color: Colors.green,
                onPress_Left: () { setState(() {if(venom>1){venom--;}}); },
                onPress_Right: () { setState(() {if(venom<4){venom++;}}); },
              ),
              VenomSpeedTemperament_AddSpider(
                i: speed,
                image: 'assets/attributespeed.png',
                color: Colors.yellow,
                onPress_Left: () { setState(() {if(speed>1){speed--;}}); },
                onPress_Right: () { setState(() {if(speed<4){speed++;}}); },
              ),
              VenomSpeedTemperament_AddSpider(
                i: temperament,
                image: 'assets/attributetemperament.png',
                color: Colors.red,
                onPress_Left: () { setState(() {if(temperament>1){temperament--;}}); },
                onPress_Right: () { setState(() {if(temperament<4){temperament++;}}); },
              ),


              SizedBox(height: 20,),

              //female
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      width: 64,
                      height: 64,
                      child: Image.asset('assets/gender2.png',)
                  ),
                  Slider(
                    min: 0,
                    max: 15,
                    value: blFemale,
                    divisions: 30,
                    label: '${blFemale} cm',

                    activeColor: Colors.pink,
                    inactiveColor: Colors.purple.shade100,
                    thumbColor: Colors.pink,

                    onChanged: (value) {
                      setState(() {
                        blFemale = value;
                      });
                    },
                  ),
                  Container(
                      width: 64,
                      height: 64,
                      child: Image.asset('assets/gender2.png',)
                  ),
                ],),
              //cocoon
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      width: 64,
                      height: 64,
                      child: Image.asset('assets/cocoon.png',)
                  ),
                  Slider(
                    min: 0,
                    max: 15,
                    value: blCocoon,
                    divisions: 30,
                    label: '${blCocoon} cm+',

                    activeColor: Colors.grey,
                    inactiveColor: Colors.grey.shade100,
                    thumbColor: Colors.grey,

                    onChanged: (value) {
                      setState(() {
                        blCocoon = value;
                      });
                    },
                  ),
                  Container(
                      width: 64,
                      height: 64,
                      child: Image.asset('assets/cocoon.png',)
                  ),
                ],),
              //male
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      width: 64,
                      height: 64,
                      child: Image.asset('assets/gender1.png',)
                  ),
                  Slider(
                    min: 0,
                    max: 15,
                    value: blMale,
                    divisions: 30,
                    label: '${blMale} cm',

                    activeColor: Colors.blue,
                    inactiveColor: Colors.blue.shade100,
                    thumbColor: Colors.blue,

                    onChanged: (value) {
                      setState(() {
                        blMale = value;
                      });
                    },
                  ),
                  Container(
                      width: 64,
                      height: 64,
                      child: Image.asset('assets/gender1.png',)
                  ),
                ],),

              SizedBox(height: 20,),

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
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            if(mode>0){
                              mode--;
                            }
                          });
                        },
                      ),
                      Container(
                          width: 64,
                          height: 64,
                          child: Image.asset('assets/mode$mode.png',)
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            if(mode<3){
                              mode++;
                            }
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            if(hair>0){
                              hair--;
                            }
                          });
                        },
                      ),
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
                            child: Image.asset('assets/hairy$hair.png',)
                        ),
                      ],),
                      IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            if(hair<2){
                              hair++;
                            }
                          });
                        },
                      ),
                    ],
                  ),
              ],),


              SizedBox(height: 20,),
              Form(child: Column(children: [
                TextFormField(
                  controller :_nameController,
                  keyboardType: TextInputType.emailAddress,
                  maxLength: 40,
                  decoration: InputDecoration(
                      hintText: 'Name',
                      labelText: 'Name',
                      //prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 5,),
                TextFormField(
                  controller :_descriptionController,
                  keyboardType: TextInputType.emailAddress,
                   minLines: 1,
                   maxLines: 5,
                  decoration: InputDecoration(
                      hintText: 'Description',
                      labelText: 'Description',
                      //prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 20,),
                Button(title: 'Upload', onPress: ()async{
                  try{
                    int date = DateTime.now().microsecondsSinceEpoch;
                    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance.ref('/flutterblog$date');

                    final User? user = _auth.currentUser;
                    postRef.child('Spiders List').child(date.toString()).set({

                      'Id':date.toString(),
                      'Time':date.toString(),
                      'Spider_Name':_nameController.text.toString(),
                      'Spider_Description':_descriptionController.text.toString(),

                      'Spider_venom':venom,
                      'Spider_speed':speed,
                      'Spider_temperament':temperament,
                      'Spider_mode':mode,
                      'Spider_hair':hair,

                      'Spider_blFemale':blFemale,
                      'Spider_blMale':blMale,
                      'Spider_blCocoon':blCocoon,

                      'Spider_head_Color':head_Color.value.toString(),
                      'Spider_body_Color':body_Color.value.toString(),
                      'Spider_legs_Color':legs_Color.value.toString(),
                      'Spider_chelicer_Color':chelicer_Color.value.toString(),

                      'Spider_head_2':head_2,
                      'Spider_body_2':body_2,
                      'Spider_legs_2':legs_2,
                      'Spider_chelicer_2':chelicer_2,
                      'Spider_head_2_Color':head_2_Color.value.toString(),
                      'Spider_body_2_Color':body_2_Color.value.toString(),
                      'Spider_legs_2_Color':legs_2_Color.value.toString(),
                      'Spider_chelicer_2_Color':chelicer_2_Color.value.toString(),

                      'Spider_head_3':head_3,
                      'Spider_body_3':body_3,
                      'Spider_legs_3':legs_3,
                      'Spider_chelicer_3':chelicer_3,
                      'Spider_head_3_Color':head_3_Color.value.toString(),
                      'Spider_body_3_Color':body_3_Color.value.toString(),
                      'Spider_legs_3_Color':legs_3_Color.value.toString(),
                      'Spider_chelicer_3_Color':chelicer_3_Color.value.toString(),

                      'Email':user!.email.toString(),
                      'id':user.uid.toString(),

                    }).then((value){
                      print('value end');
                      Navigator.pop(context);

                    }).onError((error, stackTrace){
                      print('error');
                    });
                  }catch(e){
                    print(e);
                    print('e blad?');
                  }
                },),

              ],),),

            ],
          ),
        ),
      ),
    );
  }
}