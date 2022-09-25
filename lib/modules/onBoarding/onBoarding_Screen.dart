import 'package:academy/modules/login/login_screen.dart';
import 'package:academy/network/cashed_helper.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

class OnBoardingScreen extends StatefulWidget {

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool isLast = false;
  var boardController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
        image: "assets/images/3.png", title: "النجاح و التفوق", body: "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص"),
    BoardingModel(
        image: "assets/images/4.png", title: "التعلم الاكاديمى", body: "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص"),
  ];
  void submit(){
    CashedHelper.saveData(key: "onBoarding", value: true).then((value) {
      if(value){
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>LoginScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                Expanded(
                    child: PageView.builder(
                      controller: boardController,
                      onPageChanged: (int index) {
                        if (index == boarding.length - 1) {
                          setState(() {
                            isLast = true;
                          });
                        } else {
                          isLast = false;
                        }
                      },
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) =>
                          buildBoardingItem(boarding[index], context),
                      itemCount: boarding.length,
                    )),
                SizedBox(
                  height: 13.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 25),
                  child: Row(
                    children: [
                      SmoothPageIndicator(
                        controller: boardController,
                        effect: ExpandingDotsEffect(
                            dotHeight: 7.0,
                            dotColor: HexColor("#DFEFFF"),
                            activeDotColor: HexColor("#3F62EC"),
                            expansionFactor: 2,
                            dotWidth: 20.0),
                        count: boarding.length,
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          if (isLast) {
                            submit();
                          } else {
                            boardController.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.decelerate);
                          }
                        },
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(shape: BoxShape.circle,color: HexColor("#3F62EC"),),
                          child: Image.asset("assets/images/icons/Icon.png"),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget buildBoardingItem(BoardingModel model, context) => Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(width:450,height: 450,child: Image(image: AssetImage(model.image,),height: 450,width: 390,fit: BoxFit.fitHeight,)),
      SizedBox(
        height: 13.0,
      ),
      Text(
        model.title,
        style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500,fontFamily: "arbFonts"),textAlign: TextAlign.center,
      ),
      SizedBox(
        height: 9.0,
      ),
      Text(
        model.body,
        style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,fontFamily: "arbFonts",color: HexColor("#707070")),textAlign: TextAlign.center,
      ),
    ],
  );
}
