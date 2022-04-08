import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  late final String title;
  late final VoidCallback onPress;
  Button({required this.title,required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      clipBehavior: Clip.antiAlias,
      child: MaterialButton(
        color: Colors.blue[300],
        height: 50,
        minWidth: double.infinity,
        child: Text(title,style: TextStyle(color: Colors.white),),
        onPressed: onPress,
      ),
    );
  }
}

class ColorDesignSpider_AddSpider extends StatelessWidget {
  late final Color color_1,color_2,color_3;
  late final VoidCallback onPressColor_1,onPressColor_2,onPressColor_3;
  late final VoidCallback onPressLeft_2,onPressRight_2;
  late final VoidCallback onPressLeft_3,onPressRight_3;
  ColorDesignSpider_AddSpider({
    required this.color_1,required this.color_2,required this.color_3,
    required this.onPressColor_1,required this.onPressColor_2,required this.onPressColor_3,
    required this.onPressLeft_2,required this.onPressRight_2,
    required this.onPressLeft_3,required this.onPressRight_3,
  });
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: onPressLeft_2,
          ),
          IconButton(
            icon: Icon(
              Icons.brightness_1,
              color: color_2,
            ),
            onPressed: onPressColor_2,
          ),
          IconButton(
            icon: Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
            onPressed: onPressRight_2,
          ),
          IconButton(
            icon: Icon(
              Icons.brightness_1,
              color: color_1,
            ),
            onPressed: onPressColor_1,
          ),
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: onPressLeft_3,
          ),
          IconButton(
            icon: Icon(
              Icons.brightness_1,
              color: color_3,
            ),
            onPressed: onPressColor_3,
          ),
          IconButton(
            icon: Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
            onPressed: onPressRight_3,
          ),
        ],
      ),
    );
  }
}

class VenomSpeedTemperament_AddSpider extends StatelessWidget {
  late final int i;
  late final String image;
  late final Color color;
  late final VoidCallback onPress_Left,onPress_Right;
  VenomSpeedTemperament_AddSpider({
    required this.i,
    required this.image,
    required this.color,
    required this.onPress_Left,required this.onPress_Right,
  });
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: onPress_Left,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 40,
                width: 200,
                child: LinearProgressIndicator(
                  value: i/4,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(color),
                ),
              ),
              Container(
                  width: 40,
                  height: 40,
                  child: Image.asset('$image',)
              ),
            ],
          ),
          IconButton(
            icon: Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
            onPressed: onPress_Right,
          ),
        ],),
    );
  }
}

TextField Text_TextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.white.withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.white70,
      ),
      labelText: text,
      labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.3),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}
