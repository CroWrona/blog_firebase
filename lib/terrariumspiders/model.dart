import 'package:flutter/material.dart';

class Animal_add extends StatelessWidget {
  Animal_add({
    required this.animal_Size,
    required this.animal_head_Color,
    required this.animal_body_Color,
    required this.animal_legs_Color,
    required this.animal_chelicer_Color,
    required this.animal_head_2,
    required this.animal_body_2,
    required this.animal_legs_2,
    required this.animal_chelicer_2,
    required this.animal_head_2_Color,
    required this.animal_body_2_Color,
    required this.animal_legs_2_Color,
    required this.animal_chelicer_2_Color,
    required this.animal_head_3,
    required this.animal_body_3,
    required this.animal_legs_3,
    required this.animal_chelicer_3,
    required this.animal_head_3_Color,
    required this.animal_body_3_Color,
    required this.animal_legs_3_Color,
    required this.animal_chelicer_3_Color,
  });
  double animal_Size;
  Color animal_head_Color;
  Color animal_body_Color;
  Color animal_legs_Color;
  Color animal_chelicer_Color;
  int animal_head_2;
  int animal_body_2;
  int animal_legs_2;
  int animal_chelicer_2;
  Color animal_head_2_Color;
  Color animal_body_2_Color;
  Color animal_legs_2_Color;
  Color animal_chelicer_2_Color;
  int animal_head_3;
  int animal_body_3;
  int animal_legs_3;
  int animal_chelicer_3;
  Color animal_head_3_Color;
  Color animal_body_3_Color;
  Color animal_legs_3_Color;
  Color animal_chelicer_3_Color;

  @override
  Widget build(BuildContext context) {
      return Stack(
        alignment: Alignment.center,
        children: [
          Container(
              width: animal_Size,
              height: animal_Size,
              child: Image.asset('assets/shadow.png')
          ),
          //body_1
          Container(
              width: animal_Size,
              height: animal_Size,
              child: Image.asset('assets/body/1.png', color: animal_body_Color,
              )
          ),
          //body_2
          Container(
              width: animal_Size,
              height: animal_Size,
              child: Image.asset('assets/body/$animal_body_2.png', color: animal_body_2_Color,
              )
          ),
          //body_3
          Container(
              width: animal_Size,
              height: animal_Size,
              child: Image.asset('assets/body/$animal_body_3.png', color: animal_body_3_Color,
              )
          ),
          //body
          Container(
              width: animal_Size,
              height: animal_Size,
              child: Image.asset('assets/shadow_body.png',)
          ),
          //head_1
          Container(
              width: animal_Size,
              height: animal_Size,
              child: Image.asset('assets/head/1.png', color: animal_head_Color,
              )
          ),
          //head_2
          Container(
              width: animal_Size,
              height: animal_Size,
              child: Image.asset('assets/head/$animal_head_2.png', color: animal_head_2_Color,
              )
          ),
          //head_3
          Container(
              width: animal_Size,
              height: animal_Size,
              child: Image.asset('assets/head/$animal_head_3.png', color: animal_head_3_Color,
              )
          ),
          //head
          Container(
              width: animal_Size,
              height: animal_Size,
              child: Image.asset('assets/shadow_head.png',)
          ),
          //legs_1
          Container(
              width: animal_Size,
              height: animal_Size,
              child: Image.asset('assets/legs/1.png', color: animal_legs_Color,
              )
          ),
          //legs_2
          Container(
              width: animal_Size,
              height: animal_Size,
              child: Image.asset('assets/legs/$animal_legs_2.png', color: animal_legs_2_Color,
              )
          ),
          //legs_3
          Container(
              width: animal_Size,
              height: animal_Size,
              child: Image.asset('assets/legs/$animal_legs_3.png',color: animal_legs_3_Color,)
          ),
          //legs
          Container(
              width: animal_Size,
              height: animal_Size,
              child: Image.asset('assets/shadow_legs.png',)
          ),
          //eyes
          Container(
              width: animal_Size,
              height: animal_Size,
              child: Image.asset('assets/eyeshappy.png',)
          ),
          //chelicer_1
          Container(
              width: animal_Size,
              height: animal_Size,
              child: Image.asset('assets/chelicer/1.png',color: animal_chelicer_Color,)
          ),
          //chelicer_2
          Container(
              width: animal_Size,
              height: animal_Size,
              child: Image.asset('assets/chelicer/$animal_chelicer_2.png',color: animal_chelicer_2_Color,)
          ),
          //chelicer_3
          Container(
              width: animal_Size,
              height: animal_Size,
              child: Image.asset('assets/chelicer/$animal_chelicer_3.png',color: animal_chelicer_3_Color,)
          ),
          //chelicer
          Container(
              width: animal_Size,
              height: animal_Size,
              child: Image.asset('assets/shadow_chelicer.png',)
          ),
        ],
      );
  }
}

class Animal extends StatelessWidget {
  Animal({
    required this.animal_Size,
    required this.animal_head_Color,
    required this.animal_body_Color,
    required this.animal_legs_Color,
    required this.animal_chelicer_Color,
    required this.animal_head_2,
    required this.animal_body_2,
    required this.animal_legs_2,
    required this.animal_chelicer_2,
    required this.animal_head_2_Color,
    required this.animal_body_2_Color,
    required this.animal_legs_2_Color,
    required this.animal_chelicer_2_Color,
    required this.animal_head_3,
    required this.animal_body_3,
    required this.animal_legs_3,
    required this.animal_chelicer_3,
    required this.animal_head_3_Color,
    required this.animal_body_3_Color,
    required this.animal_legs_3_Color,
    required this.animal_chelicer_3_Color,
  });
  double animal_Size;
  String animal_head_Color;
  String animal_body_Color;
  String animal_legs_Color;
  String animal_chelicer_Color;
  int animal_head_2;
  int animal_body_2;
  int animal_legs_2;
  int animal_chelicer_2;
  String animal_head_2_Color;
  String animal_body_2_Color;
  String animal_legs_2_Color;
  String animal_chelicer_2_Color;
  int animal_head_3;
  int animal_body_3;
  int animal_legs_3;
  int animal_chelicer_3;
  String animal_head_3_Color;
  String animal_body_3_Color;
  String animal_legs_3_Color;
  String animal_chelicer_3_Color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
            width: animal_Size,
            height: animal_Size,
            child: Image.asset('assets/shadow.png')
        ),
        //body_1
        Container(
            width: animal_Size,
            height: animal_Size,
            child: Image.asset('assets/body/1.png',
              color: Color(int.parse(animal_body_Color)).withOpacity(1),
            )
        ),
        //body_2
        Container(
            width: animal_Size,
            height: animal_Size,
            child: Image.asset('assets/body/$animal_body_2.png',
              color: Color(int.parse(animal_body_2_Color)).withOpacity(1),
            )
        ),
        //body_3
        Container(
            width: animal_Size,
            height: animal_Size,
            child: Image.asset('assets/body/$animal_body_3.png',
              color: Color(int.parse(animal_body_3_Color)).withOpacity(1),
            )
        ),
        //body
        Container(
            width: animal_Size,
            height: animal_Size,
            child: Image.asset('assets/shadow_body.png',)
        ),
        //head_1
        Container(
            width: animal_Size,
            height: animal_Size,
            child: Image.asset('assets/head/1.png',
              color: Color(int.parse(animal_head_Color)).withOpacity(1),
            )
        ),
        //head_2
        Container(
            width: animal_Size,
            height: animal_Size,
            child: Image.asset('assets/head/$animal_head_2.png',
              color: Color(int.parse(animal_head_2_Color)).withOpacity(1),
            )
        ),
        //head_3
        Container(
            width: animal_Size,
            height: animal_Size,
            child: Image.asset('assets/head/$animal_head_3.png',
              color: Color(int.parse(animal_head_3_Color)).withOpacity(1),
            )
        ),
        //head
        Container(
            width: animal_Size,
            height: animal_Size,
            child: Image.asset('assets/shadow_head.png',)
        ),
        //legs_1
        Container(
            width: animal_Size,
            height: animal_Size,
            child: Image.asset('assets/legs/1.png',
              color: Color(int.parse(animal_legs_Color)).withOpacity(1),
            )
        ),
        //legs_2
        Container(
            width: animal_Size,
            height: animal_Size,
            child: Image.asset('assets/legs/$animal_legs_2.png',
              color: Color(int.parse(animal_legs_2_Color)).withOpacity(1),
            )
        ),
        //legs_3
        Container(
            width: animal_Size,
            height: animal_Size,
            child: Image.asset('assets/legs/$animal_legs_3.png',
              color: Color(int.parse(animal_legs_3_Color)).withOpacity(1),
            )
        ),
        //legs
        Container(
            width: animal_Size,
            height: animal_Size,
            child: Image.asset('assets/shadow_legs.png',)
        ),
        //eyes
        Container(
            width: animal_Size,
            height: animal_Size,
            child: Image.asset('assets/eyeshappy.png',)
        ),
        //chelicer_1
        Container(
            width: animal_Size,
            height: animal_Size,
            child: Image.asset('assets/chelicer/1.png',
              color: Color(int.parse(animal_chelicer_Color)).withOpacity(1),
            )
        ),
        //chelicer_2
        Container(
            width: animal_Size,
            height: animal_Size,
            child: Image.asset('assets/chelicer/$animal_chelicer_2.png',
              color: Color(int.parse(animal_chelicer_2_Color)).withOpacity(1),
            )
        ),
        //chelicer_3
        Container(
            width: animal_Size,
            height: animal_Size,
            child: Image.asset('assets/chelicer/$animal_chelicer_3.png',
              color: Color(int.parse(animal_chelicer_3_Color)).withOpacity(1),
            )
        ),
        //chelicer
        Container(
            width: animal_Size,
            height: animal_Size,
            child: Image.asset('assets/shadow_chelicer.png',)
        ),
      ],
    );
  }
}
