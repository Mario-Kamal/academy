import 'package:academy/modules/login/login_screen.dart';
import 'package:academy/network/cashed_helper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';

void navegateTo(context, widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

void navegateAndFinish(context, widget) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
        (Route<dynamic> route) => false,
  );
}

Widget defaultTextFormField(
    {controller, inputType, validator, labelText, prefixIcon,obscureText,suffixIcon}) =>
    Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        textAlign: TextAlign.right,
        textDirection: TextDirection.ltr,
        controller: controller,
        keyboardType: inputType,
        validator: validator,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2,color: HexColor("#F2F3F8")),
              borderRadius: BorderRadius.circular(20)
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(width: 2,color: HexColor("#F2F3F8")),
              borderRadius: BorderRadius.circular(20)
          ),
          filled: true,
          fillColor: HexColor("#F2F3F8"),
          labelText: labelText,
          labelStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,fontFamily: "arbFonts"),
          prefixIcon: SizedBox(child: Image.asset('assets/images/${prefixIcon}',)),
          suffixIcon: suffixIcon,
        ),
        obscureText: obscureText,
      ),
    );

Widget defaultButton(function, String text, context) =>
    ElevatedButton(
        onPressed: function,
        style: ElevatedButton.styleFrom(
            primary: HexColor("#274FEA"),
            textStyle: TextStyle(fontSize: 18,
                fontWeight: FontWeight.w500,
                fontFamily: "arbFonts"),
            alignment: Alignment.center,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        child: Text(text));

void showToast({required String msg, required ToastState state}) =>
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: chooseColor(state),
        textColor: Colors.white,
        fontSize: 20.0);

enum ToastState { SUCCESS, ERROR, WARNING }

Color chooseColor(ToastState state) {
  Color color;
  switch (state) {
    case ToastState.SUCCESS:
      color = Colors.green;
      break;
    case ToastState.ERROR:
      color = Colors.red;
      break;
    case ToastState.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}

void signOut(context) {
  CashedHelper.removeData('token').then((value) {
    if (value) {
      navegateAndFinish(context, LoginScreen());
    }
  });
}

Widget drawerList(image,label)=>Container(
  margin: EdgeInsets.all(10),
  child: Row(
    children: [
      Image.asset(image,color: Colors.white,),
      SizedBox(width: 12,),
      Text(label,style: TextStyle(fontFamily: "arbFonts",fontWeight: FontWeight.w400,fontSize: 16,color: Colors.white),),
    ],
  ),
);
String token = '';