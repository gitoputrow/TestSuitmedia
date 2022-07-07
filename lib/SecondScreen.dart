import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:untitled/ThirdScreen.dart';

class SecondScreen extends StatefulWidget {
  String name;
  SecondScreen(this.name);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {

  String username = "Selected User Name";

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (BuildContext , Orientation , ScreenType ) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Container(
            padding: EdgeInsets.only(),
            child: Text(
              "Second Screen",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 18.sp
              ),
            ),
          ),
          leading: Container(
            padding: EdgeInsets.only(left: 5.w),
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios,size: 6.5.w,color: Color.fromRGBO(85, 74, 240, 1),),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          shadowColor: Color.fromRGBO(0, 0, 0, 0.3),
        ),
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.only(left: 7.w,right: 7.w),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 4.h),
                      child: Text(
                          "Welcome"
                      )
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 0.5.h),
                      child: Text(
                        "${widget.name}",
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold
                        ),
                      )
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(bottom: 8.h),
                child: Center(
                  child: Text(
                    "$username",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22.sp
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 3.5.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ThirdScreen(),
                            ));
                        setState(() {
                          username = result;
                        });
                      },
                      child: Text(
                        "Choose a User",
                        style: TextStyle(
                          fontSize: 16.sp,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)
                        ),
                        padding: EdgeInsets.symmetric(vertical: 1.7.h),
                        primary: Color.fromRGBO(43, 99, 123, 1),
                        onPrimary: Colors.white,
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ),
      );
    },);
  }
}
