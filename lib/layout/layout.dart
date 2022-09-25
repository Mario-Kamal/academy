import 'package:academy/modules/course/course_screen.dart';
import 'package:academy/modules/field/field_screen.dart';
import 'package:academy/modules/home/home_screen.dart';
import 'package:academy/modules/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:hexcolor/hexcolor.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  List screens=[
  HomeScreen(),
  FieldScreen(),
  CourseScreen(),
  ProfileScreen(),
];
int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        elevation: 0,
        leadingWidth: 0,
        titleSpacing: 0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton( icon: Icon(Icons.menu,color: Colors.black,),onPressed: ()=>ZoomDrawer.of(context)!.toggle()),
              Text(
                "👋 اهلا بيك يا عمر",
                style: TextStyle(fontSize: 18, color: Colors.black,fontFamily: "arbFonts",fontWeight: FontWeight.w700),
              ),
              SizedBox(
                  height: 40,
                  width: 40,
                  child: Image.asset('assets/images/7.png'))
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: HexColor("#D8D8D84E"),
              blurRadius: 40,
            )
          ],
        ),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: BottomNavigationBar(backgroundColor: Colors.white,
            showUnselectedLabels: true,
            unselectedItemColor: HexColor("#BABABA"),
            selectedLabelStyle: TextStyle(color: HexColor("#5271EE")),
            selectedItemColor: HexColor("#5271EE"),
            unselectedLabelStyle: TextStyle(color: HexColor("#BABABA")),
            currentIndex: currentIndex,
            items: [
              BottomNavigationBarItem(icon: SizedBox(height:25,width:25,child:Image.asset(fit: BoxFit.contain,"assets/images/icons/home-2.png",color: currentIndex==0?HexColor("#5271EE"):HexColor("#BABABA"),)),label: "Home"),
              BottomNavigationBarItem(icon: SizedBox(height:25,width:25,child: Image.asset(fit: BoxFit.contain,"assets/images/icons/category.png",color: currentIndex==1?HexColor("#5271EE"):HexColor("#BABABA"),)),label: "Home",),
              BottomNavigationBarItem(icon: SizedBox(height:25,width:25,child: Image.asset(fit: BoxFit.contain,"assets/images/icons/book-saved.png",color: currentIndex==2?HexColor("#5271EE"):HexColor("#BABABA"),)),label: "Home",),
              BottomNavigationBarItem(icon: SizedBox(height:25,width:25,child: Image.asset(fit: BoxFit.contain,"assets/images/icons/user.png",color: currentIndex==3?HexColor("#5271EE"):HexColor("#BABABA"),)),label: "Home",),
            ],
            onTap: (int index){
              setState(() {
                currentIndex=index;
              });
            },
          ),
        ),
      ),
      body: screens[currentIndex],
    );
  }
}
