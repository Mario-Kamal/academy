import 'package:academy/component/component.dart';
import 'package:academy/layout/layout.dart';
import 'package:academy/modules/home/home_screen.dart';
import 'package:academy/modules/login/cubit/cubit.dart';
import 'package:academy/modules/login/cubit/states.dart';
import 'package:academy/modules/login/login_screen.dart';
import 'package:academy/modules/menu_screen/menu_screen.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:hexcolor/hexcolor.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var fieldController = TextEditingController();
    var yearController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context)=>LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginState>(
        listener: (context,state){},
        builder: (context,state){
          return Scaffold(
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height:160,width:160,child: Image(image: AssetImage('assets/images/1.png'))),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "عمل حساب جديد",
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
                      defaultTextFormField(
                        controller: nameController,
                        inputType: TextInputType.name,
                        validator: ( value) {
                          if (value!.isEmpty) {
                            return 'برجاء ادخال الاسم';
                          }
                        },
                        labelText: "الاسم بالكامل",
                        prefixIcon:"16.png",
                        obscureText: false
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      defaultTextFormField(
                          controller: fieldController,
                          inputType: TextInputType.text,
                          validator: ( value) {
                            if (value!.isEmpty) {
                              return 'برجاء ادخال القسم الدراسي';
                            }
                          },
                          labelText: "القسم الدراسي",
                          prefixIcon:"17.png",
                          obscureText: false
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      defaultTextFormField(
                          controller: yearController,
                          inputType: TextInputType.number,
                          validator: ( value) {
                            if (value!.isEmpty) {
                              return 'برجاء ادخال السنة الدراسية';
                            }
                          },
                          labelText: "السنة الدراسية",
                          prefixIcon:"17.png",
                          obscureText: false
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      defaultTextFormField(
                          controller: emailController,
                          inputType: TextInputType.emailAddress,
                          validator: ( value) {
                            if (value!.isEmpty) {
                              return 'برجاء ادخال البريد الالكتروني';
                            }
                          },
                          labelText: "البريد الالكتروني",
                          prefixIcon:"15.png",
                          obscureText: false
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      defaultTextFormField(
                          controller: passwordController,
                          inputType: TextInputType.visiblePassword,
                          validator: ( value) {
                            if (value!.isEmpty) {
                              return 'برجاء ادخال كلمة المرور';
                            }else if(value.length<8){
                              return 'يجب ان لا يكون الطول اقل من 8';
                            }
                          },
                          labelText: "كلمة المرور",
                          prefixIcon:"14.png",
                          obscureText: LoginCubit.get(context).isPassword,
                        suffixIcon: InkWell(child: LoginCubit.get(context).suffix,onTap: (){
                          LoginCubit.get(context).changePasswordVisibility();
                        },),
                      ),
                      const SizedBox(
                        height: 30.0,
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
                        }, "عمل حساب جديد", context),
                      ),
                      TextButton(onPressed: (){
                        navegateAndFinish(context, ZoomDrawer(
                          isRtl: true,
                          mainScreen: LayoutScreen(),
                          menuScreen: Directionality(textDirection:TextDirection.rtl,child: DrawerScreen()),
                          angle: 0.0,
                          borderRadius: 20,
                          menuBackgroundColor: HexColor("#4262E5"),
                        ));
                      }, child: Text("تخطى التسجيل",style: TextStyle(fontSize: 16,fontFamily: "arbFonts",fontWeight: FontWeight.w500,color: HexColor("#274FEA")),)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () {
                                navegateTo(context, LoginScreen());
                              },
                              child:  Text(
                                "تسجيل الدخول",
                                style: TextStyle(fontSize: 16.0,fontFamily: "arbFonts",fontWeight: FontWeight.w400,color: HexColor("#5271EE")),
                              )),
                          Text(
                            "لديك حساب بالفعل ؟",
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
      )
    );
  }
}
