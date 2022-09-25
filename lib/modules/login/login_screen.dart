
// ignore_for_file: must_be_immutable

import 'package:academy/component/component.dart';
import 'package:academy/layout/layout.dart';
import 'package:academy/modules/home/home_screen.dart';
import 'package:academy/modules/login/cubit/cubit.dart';
import 'package:academy/modules/login/cubit/states.dart';
import 'package:academy/modules/menu_screen/menu_screen.dart';
import 'package:academy/modules/registration/registration_screen.dart';
import 'package:academy/network/cashed_helper.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, states) {
          if(states is LoginErrorState){
            showToast(msg: states.error, state: ToastState.ERROR);
          }else if(states is LoginSuccessState){
            CashedHelper.saveData(
                key: "uId",
                value: states.uId)
                .then((value) {
              navegateAndFinish(context, LayoutScreen());
            });
            showToast(msg: "Welcome to our ", state: ToastState.SUCCESS);
            navegateAndFinish(context, const LayoutScreen());
          }
        },
        builder: (context, states) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(height:160,width:160,child: Image(image: AssetImage('assets/images/1.png'))),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "تسجيل الدخول",
                        style: TextStyle(
                          fontFamily: "arbFonts",
                          fontSize: 26,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "برجاء تسجيل الدخول للاكديمية ",
                            style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,fontFamily: "arbFonts",),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                     Directionality(
                       textDirection: TextDirection.rtl,
                       child: TextFormField(
                         textAlign: TextAlign.right,
                         textDirection: TextDirection.ltr,
                           controller: emailController,
                           keyboardType: TextInputType.emailAddress,
                           validator: ( value) {
                             if (value!.isEmpty) {
                               return 'برجاء ادخال البريد الالكتروني';
                             }
                           },
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
                             labelText: "البريد الالكتروني",
                             labelStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,fontFamily: "arbFonts"),
                             prefixIcon: SizedBox(child: Image.asset('assets/images/15.png',),height: 5,width: 5,),
                           ),
                     ),
                     ),
                      const SizedBox(
                        height: 20.0,
                      ),
                       Directionality(
                         textDirection: TextDirection.rtl,
                         child: TextFormField(
                           textAlign: TextAlign.right,
                           textDirection: TextDirection.ltr,
                             controller: passwordController,
                             keyboardType: TextInputType.visiblePassword,
                             validator: ( value) {
                               if (value!.isEmpty) {
                                 return 'برجاء ادخال كلمة المرور';
                               }else if(value.length<8){
                                 return 'يجب ان لا يكون الطول اقل من 8';
                               }
                             },
                             decoration: InputDecoration(enabledBorder: OutlineInputBorder(
                               borderSide: BorderSide(width: 2,color: HexColor("#F2F3F8")),
                               borderRadius: BorderRadius.circular(20)
                             ),
                               border: OutlineInputBorder(
                                   borderSide: BorderSide(width: 2,color: HexColor("#F2F3F8")),
                                   borderRadius: BorderRadius.circular(20)
                               ),
                               labelText: "كلمة المرور",
                               filled: true,
                               fillColor: HexColor("#F2F3F8"),
                               labelStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,fontFamily: "arbFonts"),
                               prefixIcon: Image.asset('assets/images/14.png'),
                               suffixIcon: InkWell(child: LoginCubit.get(context).suffix,onTap: (){
                                 LoginCubit.get(context).changePasswordVisibility();
                               },),
                             ),
                           obscureText: LoginCubit.get(context).isPassword,
                     ),
                       ),
                      Row(
                        children: [
                          TextButton(onPressed: (){}, child: Text('هل نسيت كلمة المرور ؟',style: TextStyle(fontSize: 16,fontFamily: "arbFonts",fontWeight: FontWeight.w400,color: HexColor('#F8931F')))),
                          Spacer(),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        height: 60,
                        width: double.infinity,
                        child: defaultButton(() {
                          if (formKey.currentState!.validate()) {
                            navegateAndFinish(context, ZoomDrawer(
                              isRtl: true,
                              mainScreen: LayoutScreen(),
                              menuScreen: Directionality(textDirection:TextDirection.rtl,child: DrawerScreen()),
                              angle: 0.0,
                              borderRadius: 20,
                              menuBackgroundColor: HexColor("#4262E5"),
                            ));
                          }
                        }, "تسجيل الدخول", context),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextButton(onPressed: (){
                        navegateAndFinish(context, ZoomDrawer(
                          isRtl: true,
                          mainScreen: LayoutScreen(),
                          menuScreen: Directionality(textDirection:TextDirection.rtl,child: DrawerScreen()),
                          angle: 0.0,
                          borderRadius: 20,
                          menuBackgroundColor: HexColor("#4262E5"),
                        ));}, child: Text("تخطى التسجيل",style: TextStyle(fontSize: 16,fontFamily: "arbFonts",fontWeight: FontWeight.w500,color: HexColor("#274FEA")),)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () {
                                navegateTo(context, RegistrationScreen());
                              },
                              child:  Text(
                                "حساب جديد",
                                style: TextStyle(fontSize: 16.0,fontFamily: "arbFonts",fontWeight: FontWeight.w400,color: HexColor("#5271EE")),
                              )),
                           Text(
                            "ليس لديك اي حساب ؟",
                            style: TextStyle(fontSize: 16.0,fontFamily: "arbFonts",fontWeight: FontWeight.w400,color: HexColor("#000000"),),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

}
