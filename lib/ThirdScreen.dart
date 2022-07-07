import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/ContactBloc.dart';
import 'dart:async';
import 'dart:convert';
import 'package:untitled/model.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bloc.fetchAllContact();
    return ResponsiveSizer(builder: (BuildContext , Orientation , ScreenType ) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Container(
            padding: EdgeInsets.only(),
            child: Text(
              "Third Screen",
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
        body: StreamBuilder(
          stream: bloc.allContact,
          builder: (context, AsyncSnapshot<ItemModel> snapshot) {
            if (snapshot.hasData) {
              return buildList(snapshot);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      );
    });
    }

  Widget buildList(AsyncSnapshot<ItemModel> snapshot) {
    return RefreshIndicator(
        child: ListView.builder(
            padding: EdgeInsets.only(top: 2.h),
            itemCount: snapshot.data!.data.length,
            itemBuilder: (context,index){
              return GestureDetector(
                onTap: (){
                  Navigator.pop(context, "${snapshot.data!.data[index].firstname} ${snapshot.data!.data[index].lastname}");
                },
                child: CardUser(
                  snapshot.data!.data[index].avatar,
                  snapshot.data!.data[index].firstname,
                  snapshot.data!.data[index].lastname,
                  snapshot.data!.data[index].email,),
              );
            }),
        onRefresh: () async {
          setState(() {

          });
        });
  }
}


class CardUser extends StatelessWidget {

  String avatar;
  String firstname;
  String lastname;
  String email;

  CardUser(this.avatar,this.firstname,this.lastname,this.email);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 1.h),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 8.w),
                child: CircleAvatar(
                  backgroundImage: NetworkImage("$avatar"),
                  radius: 3.3.h,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 5.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Text(
                            "$firstname",
                            style: TextStyle(
                                fontSize: 17.5.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(" "),
                          Text(
                            "$lastname",
                            style: TextStyle(
                                fontSize: 17.5.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 0.6.h),
                      child: Text(
                        "$email",
                        style: TextStyle(
                            fontSize: 15.sp
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 1.1.h,left: 4.w,right: 4.w),
            child: Divider(
              thickness: 0.1.h,
              color: Color.fromRGBO(0, 0, 0, 0.2),
            ),
          ),
        ],
      )
    );
  }
}

