import 'package:blog/terrariumspiders/widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import '../terrariumspiders/model.dart';
import 'home_animal_screen.dart';


class Edit_Spider extends StatefulWidget {

  late int Id;

  late String Name;
  late String Description;

  late int head_2,head_3;
  late int body_2,body_3;
  late int legs_2,legs_3;
  late int chelicer_2,chelicer_3;

  late int venom,speed,temperament;
  late int mode,hair;

  late double blFemale,blCocoon,blMale;

  late Color
  head_Color,body_Color,legs_Color,chelicer_Color,
      head_2_Color,body_2_Color,legs_2_Color,chelicer_2_Color,
      head_3_Color,body_3_Color,legs_3_Color,chelicer_3_Color;

  Edit_Spider({
    required this.Id,
    required this.Name,required this.Description,
    required this.head_2,required this.head_3,
    required this.body_2,required this.body_3,
    required this.legs_2, required this.legs_3,
    required this.chelicer_2, required this.chelicer_3,
    required this.venom,required this.speed, required this.temperament,
    required this.mode,required this.hair,
    required this.blFemale,required this.blCocoon, required this.blMale,

    required this.head_Color,required this.body_Color,required this.legs_Color,
    required this.chelicer_Color,required this.head_2_Color,required this.body_2_Color,
    required this.legs_2_Color,required this.chelicer_2_Color, required this.head_3_Color,
    required this.body_3_Color,required this.legs_3_Color,required this.chelicer_3_Color,
  });

  @override
  _Edit_SpiderState createState() => _Edit_SpiderState();
}

class _Edit_SpiderState extends State<Edit_Spider> {


  final postRef = FirebaseDatabase.instance.reference().child('Spiders');
  FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  // }

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
                      widget.head_Color=pickerColor;
                    }
                    else if(spider=='head_2'){
                      widget.head_2_Color=pickerColor;
                    }
                    else if(spider=='head_3'){
                      widget.head_3_Color=pickerColor;
                    }
                    else if(spider=='body_'){
                      widget.body_Color=pickerColor;
                    }
                    else if(spider=='body_2'){
                      widget.body_2_Color=pickerColor;
                    }
                    else if(spider=='body_3'){
                      widget.body_3_Color=pickerColor;
                    }
                    else if(spider=='legs_'){
                      widget.legs_Color=pickerColor;
                    }
                    else if(spider=='legs_2'){
                      widget.legs_2_Color=pickerColor;
                    }
                    else if(spider=='legs_3'){
                      widget.legs_3_Color=pickerColor;
                    }
                    else if(spider=='chelicer_'){
                      widget.chelicer_Color=pickerColor;
                    }
                    else if(spider=='chelicer_2'){
                      widget.chelicer_2_Color=pickerColor;
                    }
                    else if(spider=='chelicer_3'){
                      widget.chelicer_3_Color=pickerColor;
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

  Color _getColorFromHex(String hexColor) {
    hexColor = hexColor.replaceAll("#", "");
    return Color(int.parse("$hexColor"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Spider'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
          child: Column(
            children: [
              Animal_add(animal_Size: 200,
                animal_head_Color: widget.head_Color,animal_body_Color: widget.body_Color,
                animal_legs_Color: widget.legs_Color,animal_chelicer_Color: widget.chelicer_Color,
                animal_head_2: widget.head_2,animal_head_2_Color: widget.head_2_Color,
                animal_head_3: widget.head_3,animal_head_3_Color: widget.head_3_Color,
                animal_body_2: widget.body_2,animal_body_2_Color: widget.body_2_Color,
                animal_body_3: widget.body_3,animal_body_3_Color: widget.body_3_Color,
                animal_legs_2: widget.legs_2,animal_legs_2_Color: widget.legs_2_Color,
                animal_legs_3: widget.legs_3,animal_legs_3_Color: widget.legs_3_Color,
                animal_chelicer_2: widget.chelicer_2,animal_chelicer_2_Color: widget.chelicer_2_Color,
                animal_chelicer_3: widget.chelicer_3,animal_chelicer_3_Color: widget.chelicer_3_Color,
              ),

              //head
              ColorDesignSpider_AddSpider(
                onPressLeft_2: () {setState(() {if(widget.head_2>0){widget.head_2--;}}); },
                onPressRight_2: () {setState(() {if(widget.head_2<maxHead){widget.head_2++;}});},
                onPressLeft_3: () {setState(() {if(widget.head_3>0){widget.head_3--;}});},
                onPressRight_3: () {setState(() {if(widget.head_3<maxHead){widget.head_3++;}});},
                onPressColor_2: (){setState(() {dialog(context,'head_2');});},
                onPressColor_1: (){setState(() {dialog(context,'head_');});},
                onPressColor_3: (){setState(() {dialog(context,'head_3');});},
                color_2: widget.head_2_Color,
                color_1: widget.head_Color,
                color_3: widget.head_3_Color,
              ),
              //body
              ColorDesignSpider_AddSpider(
                onPressLeft_2: () {setState(() {if(widget.body_2>0){widget.body_2--;}}); },
                onPressRight_2: () {setState(() {if(widget.body_2<maxBody){widget.body_2++;}});},
                onPressLeft_3: () {setState(() {if(widget.body_3>0){widget.body_3--;}});},
                onPressRight_3: () {setState(() {if(widget.body_3<maxBody){widget.body_3++;}});},
                onPressColor_2: (){setState(() {dialog(context,'body_2');});},
                onPressColor_1: (){setState(() {dialog(context,'body_');});},
                onPressColor_3: (){setState(() {dialog(context,'body_3');});},
                color_2: widget.body_2_Color,
                color_1: widget.body_Color,
                color_3: widget.body_3_Color,
              ),
              //legs
              ColorDesignSpider_AddSpider(
                onPressLeft_2: () {setState(() {if(widget.legs_2>0){widget.legs_2--;}}); },
                onPressRight_2: () {setState(() {if(widget.legs_2<maxLegs){widget.legs_2++;}});},
                onPressLeft_3: () {setState(() {if(widget.legs_3>0){widget.legs_3--;}});},
                onPressRight_3: () {setState(() {if(widget.legs_3<maxLegs){widget.legs_3++;}});},
                onPressColor_2: (){setState(() {dialog(context,'legs_2');});},
                onPressColor_1: (){setState(() {dialog(context,'legs_');});},
                onPressColor_3: (){setState(() {dialog(context,'legs_3');});},
                color_2: widget.legs_2_Color,
                color_1: widget.legs_Color,
                color_3: widget.legs_3_Color,
              ),
              //chelicer
              ColorDesignSpider_AddSpider(
                onPressLeft_2: () {setState(() {if(widget.chelicer_2>0){widget.chelicer_2--;}}); },
                onPressRight_2: () {setState(() {if(widget.chelicer_2<maxChelicer){widget.chelicer_2++;}});},
                onPressLeft_3: () {setState(() {if(widget.chelicer_3>0){widget.chelicer_3--;}});},
                onPressRight_3: () {setState(() {if(widget.chelicer_3<maxChelicer){widget.chelicer_3++;}});},
                onPressColor_2: (){setState(() {dialog(context,'chelicer_2');});},
                onPressColor_1: (){setState(() {dialog(context,'chelicer_');});},
                onPressColor_3: (){setState(() {dialog(context,'chelicer_3');});},
                color_2: widget.chelicer_2_Color,
                color_1: widget.chelicer_Color,
                color_3: widget.chelicer_3_Color,
              ),

              SizedBox(height: 20,),

              VenomSpeedTemperament_AddSpider(
                i: widget.venom,
                image: 'assets/attributevenom.png',
                color: Colors.green,
                onPress_Left: () { setState(() {if(widget.venom>1){widget.venom--;}}); },
                onPress_Right: () { setState(() {if(widget.venom<4){widget.venom++;}}); },
              ),
              VenomSpeedTemperament_AddSpider(
                i: widget.speed,
                image: 'assets/attributespeed.png',
                color: Colors.yellow,
                onPress_Left: () { setState(() {if(widget.speed>1){widget.speed--;}}); },
                onPress_Right: () { setState(() {if(widget.speed<4){widget.speed++;}}); },
              ),
              VenomSpeedTemperament_AddSpider(
                i: widget.temperament,
                image: 'assets/attributetemperament.png',
                color: Colors.red,
                onPress_Left: () { setState(() {if(widget.temperament>1){widget.temperament--;}}); },
                onPress_Right: () { setState(() {if(widget.temperament<4){widget.temperament++;}}); },
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
                    value: widget.blFemale,
                    divisions: 30,
                    label: '${widget.blFemale} cm',

                    activeColor: Colors.pink,
                    inactiveColor: Colors.purple.shade100,
                    thumbColor: Colors.pink,

                    onChanged: (value) {
                      setState(() {
                        widget.blFemale = value;
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
                    value: widget.blCocoon,
                    divisions: 30,
                    label: '${widget.blCocoon} cm+',

                    activeColor: Colors.grey,
                    inactiveColor: Colors.grey.shade100,
                    thumbColor: Colors.grey,

                    onChanged: (value) {
                      setState(() {
                        widget.blCocoon = value;
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
                    value: widget.blMale,
                    divisions: 30,
                    label: '${widget.blMale} cm',

                    activeColor: Colors.blue,
                    inactiveColor: Colors.blue.shade100,
                    thumbColor: Colors.blue,

                    onChanged: (value) {
                      setState(() {
                        widget.blMale = value;
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
                            if(widget.mode>0){
                              widget.mode--;
                            }
                          });
                        },
                      ),
                      Container(
                          width: 64,
                          height: 64,
                          child: Image.asset('assets/mode${widget.mode}.png',)
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            if(widget.mode<3){
                              widget.mode++;
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
                            if(widget.hair>0){
                              widget.hair--;
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
                            child: Image.asset('assets/hairy${widget.hair}.png',)
                        ),
                      ],),
                      IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            if(widget.hair<2){
                              widget.hair++;
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
                  //controller :_nameController,
                  controller: _nameController =TextEditingController(text: "${widget.Name}"),
                  keyboardType: TextInputType.emailAddress,
                  maxLength: 40,
                  decoration: InputDecoration(
                      hintText: 'Name',
                      labelText: 'Name',
                      //prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
                  ),

                ),
                SizedBox(height: 5,),
                TextFormField(
                  controller : _descriptionController =TextEditingController(text: "${widget.Description}"),
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
                Button(title: 'Edit', onPress: ()async{
                  postRef.child("Spiders List/${widget.Id}").update( {
                    'Spider_Name':_nameController.text.toString(),
                    'Spider_Description':_descriptionController.text.toString(),
                    'Spider_venom':widget.venom,
                    'Spider_speed':widget.speed,
                    'Spider_temperament':widget.temperament,
                    'Spider_mode':widget.mode,
                    'Spider_hair':widget.hair,
                    'Spider_blFemale':widget.blFemale,
                    'Spider_blMale':widget.blMale,
                    'Spider_blCocoon':widget.blCocoon,

                    'Spider_head_Color':widget.head_Color.value.toString(),
                    'Spider_body_Color':widget.body_Color.value.toString(),
                    'Spider_legs_Color':widget.legs_Color.value.toString(),
                    'Spider_chelicer_Color':widget.chelicer_Color.value.toString(),

                    'Spider_head_2':widget.head_2,
                    'Spider_body_2':widget.body_2,
                    'Spider_legs_2':widget.legs_2,
                    'Spider_chelicer_2':widget.chelicer_2,
                    'Spider_head_2_Color':widget.head_2_Color.value.toString(),
                    'Spider_body_2_Color':widget.body_2_Color.value.toString(),
                    'Spider_legs_2_Color':widget.legs_2_Color.value.toString(),
                    'Spider_chelicer_2_Color':widget.chelicer_2_Color.value.toString(),

                    'Spider_head_3':widget.head_3,
                    'Spider_body_3':widget.body_3,
                    'Spider_legs_3':widget.legs_3,
                    'Spider_chelicer_3':widget.chelicer_3,
                    'Spider_head_3_Color':widget.head_3_Color.value.toString(),
                    'Spider_body_3_Color':widget.body_3_Color.value.toString(),
                    'Spider_legs_3_Color':widget.legs_3_Color.value.toString(),
                    'Spider_chelicer_3_Color':widget.chelicer_3_Color.value.toString(),
                  });
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeSpidersScreen()));
                },),
              ],),),

            ],
          ),
        ),
      ),
    );
  }
}