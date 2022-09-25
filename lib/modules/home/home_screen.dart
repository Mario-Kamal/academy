import 'package:academy/layout/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex=0;
  List images = [
    'assets/images/10.png',
    'assets/images/11.png',
    'assets/images/12.png',
  ];

  List images2 = [
    'assets/images/18.png',
    'assets/images/19.png',
  ];

  List images3 = [
    'assets/images/23.png',
    'assets/images/24.png',
    'assets/images/25.png',
    'assets/images/26.png',
    'assets/images/27.png',
    'assets/images/28.png',
  ];

  List body2 = [
    "تعلم تجربة المستخدم",
    "تعلم اداره الاعمال",
  ];

  List body = [
    "المساحة والهندسة",
    "تكنولوجيا المعلومات",
    "التحاليل الطبية",
  ];

  List body3=[
    "الاخبار والاحداث",
    "طلب الالتحاق",
    "جدول الدراسى",
    "الكورسات",
    "شركاء النجاح",
    "اتصل بنا",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topLeft,
                children: [
                  Container(
                    padding: EdgeInsets.all(17.0),
                    height: 160,
                    margin: EdgeInsets.only(top: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            HexColor('#2144D4'),
                            HexColor('#5271EE'),
                          ],
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "🔥 افضل مكان اكاديمى",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              fontFamily: "arbFonts",
                              color: Colors.white),
                        ),
                        SizedBox(
                            width: 200,
                            child: Text(
                              "مكان لتعليم الطلاب المواد التعلمية مع افضل كودار",
                              textAlign: TextAlign.end,
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "arbFonts",
                                  color: HexColor("#E1E1E1")),
                            )),
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: HexColor("#F8931F")),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  Align(child: Container(margin:EdgeInsets.only(right: 230),child: Image.asset("assets/images/8.png",height: 180,fit: BoxFit.cover,)))
                ],
              ),
              Row(
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      "assets/images/9.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "الاقسام",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontFamily: "arbFonts",
                        color: Colors.black),
                  ),
                ],
              ),
              SizedBox(
                  height: 130,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) => InkWell(
                        onTap: (){
                          setState(() {
                            currentIndex=index;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: currentIndex==index?HexColor("#7757FF33"):HexColor("#D8D8D833"),
                                blurRadius: 5,
                                spreadRadius: 1,
                                offset: const Offset(0, 10),
                              )
                            ],
                            border: Border.all(color: HexColor("#F2F3F8")),
                            color: currentIndex==index?HexColor("#F8931F"):Colors.white,
                          ),
                          padding: EdgeInsets.all(16),
                          height: 130,
                          width: 120,
                          child: Column(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(
                                  images[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                height: 45,
                                width: 60,
                                child: Text(
                                  body[index],
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "arbFonts",
                                    fontWeight: FontWeight.w500,
                                    color: currentIndex==index?Colors.white:Colors.black,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      separatorBuilder: (context, index) => SizedBox(
                        width: 10,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      shrinkWrap: true,
                    ),
                  )),
              Row(
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      "assets/images/9.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "الخدمات",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontFamily: "arbFonts",
                        color: Colors.black),
                  ),
                ],
              ),
              // SizedBox(
              //   height: 210,
              //   child: Directionality(
              //     textDirection: TextDirection.rtl,
              //     child: ListView.separated(
              //       itemBuilder: (context, index) => Container(
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(10.0),
              //           border: Border.all(color: HexColor("#F2F3F8"))
              //         ),
              //         padding: EdgeInsets.symmetric(horizontal: 8,vertical: 5),
              //         height: 210,
              //         width: 220,
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Container(
              //               decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.circular(10)
              //               ),
              //               height: 125,
              //               width: 220,
              //               child:Image.asset(images2[index],fit: BoxFit.contain,),),
              //             Padding(
              //               padding: const EdgeInsets.symmetric(vertical: 6.0),
              //               child: Row(
              //                 children: [
              //                   Text(body2[index],style: TextStyle(fontSize: 16,fontFamily: "arbFonts",fontWeight: FontWeight.w500,color: Colors.black,)),
              //                   Spacer(),
              //                   Image.asset("assets/images/20.png")
              //                 ],
              //               ),
              //             ),
              //             Row(children: [
              //               Row(children: [
              //                 Image.asset("assets/images/22.png",color: Colors.black,),
              //                 Text(' 16',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,fontFamily: "arbFonts"),),
              //                 Text('ساعه ',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,fontFamily: "arbFonts"))
              //               ],),
              //               Spacer(),
              //               Row(children: [
              //                 Image.asset("assets/images/21.png",color: Colors.black,),
              //                 Text(' 14',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,fontFamily: "arbFonts"),),
              //                 Text('حصة ',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,fontFamily: "arbFonts"))
              //               ],),
              //             ],)
              //           ],
              //         ),
              //       ),
              //       separatorBuilder: (context, index) => SizedBox(
              //         width: 15,
              //       ),
              //       scrollDirection: Axis.horizontal,
              //       itemCount: images2.length,
              //       shrinkWrap: true,
              //     ),
              //   ),
              // )
              Directionality(
                textDirection: TextDirection.rtl,
                child: SizedBox(
                  height: 240,
                  child: GridView.builder(
                    physics: BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 10
                    ),
                    itemCount: images3.length,
                    itemBuilder: (
                        (context,index)=>Container(
                          height: 115,
                          width: 115,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: HexColor("#EEEEEE"))
                          ),
                          child: Column(
                            children: [
                              SizedBox(child: Image.asset(images3[index],fit: BoxFit.cover,),height: 80,width: 80,),
                              Text(body3[index],style: TextStyle(fontFamily: "arbFonts",fontWeight: FontWeight.w500,fontSize: 14),)
                            ],
                          ),
                        )
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
