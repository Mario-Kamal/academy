import 'package:academy/component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:hexcolor/hexcolor.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#4262E5"),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Image.asset("assets/images/7.png"),
              )  ,
                SizedBox(width: 10,),
                Text("عمر ابراهيم",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,fontFamily: "arbFonts",color: Colors.white),),
                Spacer(),
                InkWell(
                  onTap: (){
                    ZoomDrawer.of(context)!.close();
                  },
                  child: Container(

                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: Image.asset("assets/images/icons/close.png"),
                  ),
                )  ,
              ],
            ),
          SizedBox(height: 60,),
          drawerList("assets/images/icons/home-2.png","الصفحة الرئيسية"),
          drawerList("assets/images/icons/category.png","التخصصات"),
          drawerList("assets/images/icons/book-saved.png","كورسات اون لاين"),
          drawerList("assets/images/icons/news.png","الاخبار والاحداث"),
          drawerList("assets/images/icons/tables.png","جدول المحاضرات"),
          drawerList("assets/images/icons/edit.png","طلب الالتحاق"),
          drawerList("assets/images/icons/partner.png","شركاء النجاح"),
          drawerList("assets/images/icons/portrait.png","اتصل بنا"),
          drawerList("assets/images/icons/hastag.png","اعداد الاكاديمية"),
          drawerList("assets/images/icons/info.png","عن المستقبل اكاديمى"),
          drawerList("assets/images/icons/user.png","البروفايل"),
            Spacer(),
            drawerList("assets/images/icons/logout.png", "تسجيل الخروج")
        ],),
      ),
    );
  }
}
