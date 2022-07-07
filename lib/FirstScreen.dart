import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'SecondScreen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final textPalindrome = TextEditingController();
  final textName = TextEditingController();

  String alertText = "";
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (BuildContext , Orientation , ScreenType ) {
      return Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("Asset/background.png"),
                  fit: BoxFit.cover
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 8.h),
                child: Image.asset("Asset/ic_photo.png",height: 12.h,),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 7.w),
                child: TextField(
                  controller: textName,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        borderSide: BorderSide(width: 0.w)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        borderSide: BorderSide(color: Colors.white,width: 0.w)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        borderSide: BorderSide(color: Colors.blueAccent,width: 0.3.w)
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 2.2.h,horizontal: 5.w),
                    hintText: "Name",
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 7.w,vertical: 2.5.h),
                child: TextField(
                  controller: textPalindrome,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        borderSide: BorderSide(width: 0.w)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        borderSide: BorderSide(color: Colors.white,width: 0.w)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        borderSide: BorderSide(color: Colors.blueAccent,width: 0.3.w)
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 2.2.h,horizontal: 5.w),
                    hintText: "Palindrome",
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 7.w,right: 7.w,top: 5.5.h),
                child: ElevatedButton(
                  onPressed: (){

                    if (textPalindrome.text.isNotEmpty){
                      String original = textPalindrome.text;
                      String reverse = textPalindrome.text.split("").reversed.join("");
                      if(original == reverse){
                        setState(() {
                          alertText = "isPalindrome";
                        });
                      }
                      else{
                        setState(() {
                          alertText = "Not Palindrome";
                        });
                      }
                      showDialog(
                          context: context,
                          builder: (context){
                            return AlertDialog(
                              backgroundColor: Colors.white,
                              contentPadding: EdgeInsets.symmetric(vertical: 3.5.h,horizontal: 12.w),
                              content: Container(
                                // height: 15.h,
                                // decoration: BoxDecoration(
                                //     // borderRadius: BorderRadius.circular(160),
                                // ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "$alertText",
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          color: Color.fromRGBO(0, 0, 0, 0.8)
                                      ),),
                                    Container(
                                      padding: EdgeInsets.only(top: 2.h),
                                      child: Container(
                                        padding: EdgeInsets.only(right: 4.w),
                                        child: ElevatedButton(onPressed: () {

                                          Navigator.of(context).pop();

                                        },
                                          child: Text("OK",style:
                                          TextStyle(fontSize: 16.sp,),),
                                          style: ElevatedButton.styleFrom(
                                              primary: Color.fromRGBO(43, 99, 123, 1),
                                              onPrimary: Colors.white
                                          ),),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    }

                  },
                  child: Text(
                    "CHECK",
                    style: TextStyle(
                      fontSize: 15.sp,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                    ),
                    padding: EdgeInsets.symmetric(vertical: 2.h),
                    primary: Color.fromRGBO(43, 99, 123, 1),
                    onPrimary: Colors.white,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 7.w,right: 7.w,top: 2.5.h),
                child: ElevatedButton(
                  onPressed: (){
                      Navigator.push(
                          context,
                      MaterialPageRoute(builder: (context) => SecondScreen(textName.text)));
                  },
                  child: Text(
                    "NEXT",
                    style: TextStyle(
                      fontSize: 15.sp,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                    ),
                    padding: EdgeInsets.symmetric(vertical: 2.h),
                    primary: Color.fromRGBO(43, 99, 123, 1),
                    onPrimary: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      );
    },);
  }
}
