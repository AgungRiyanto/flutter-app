import 'package:flutter/material.dart';
import 'package:my_app/helpers/variables.dart' as variable;
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:convert';

class Profile extends StatefulWidget {
  @override
	_ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String name = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataUser();
  }

  void getDataUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name =  prefs.getString('name');
    });
  }

  Widget cardUserDetail() {
    return Container(
      decoration: BoxDecoration(
        color: variable.primary,
        borderRadius: BorderRadius.circular(5.0)
      ),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 7,
            child: Container(
              alignment: Alignment.topLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(this.name,style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                  Text('agungreeyanto@gmail.com', style: TextStyle(color: Colors.white, fontSize: 12),),
                  Text('0877-3454-2196', style: TextStyle(color: Colors.white, fontSize: 12),)
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: 30.0,
                backgroundImage: AssetImage('assets/johndoe.jpg'),
              )
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.2),
      width: MediaQuery.of(context).size.width,
      // padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          cardUserDetail(),
          Container(
            padding: EdgeInsets.only(top: 13, bottom: 13),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(color: Colors.grey, width: 0.3))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    alignment: Alignment.topLeft,
                    child: Icon(Icons.check_circle, color: variable.primary,),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Text('My Assignments', style: TextStyle(fontSize: 16),),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    alignment: Alignment.topLeft,
                    child: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18,),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 13, bottom: 13),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(color: Colors.grey, width: 0.3))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    alignment: Alignment.topLeft,
                    child: Icon(Icons.bookmark, color: variable.primary,),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Text('My Bookmarks', style: TextStyle(fontSize: 16),),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    alignment: Alignment.topLeft,
                    child: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18,),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 13, bottom: 13),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(color: Colors.grey, width: 0.3))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    alignment: Alignment.topLeft,
                    child: Icon(Icons.calendar_today, color: variable.primary,),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Text('My Schedules', style: TextStyle(fontSize: 16),),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    alignment: Alignment.topLeft,
                    child: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18,),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 13, bottom: 13),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(color: Colors.grey, width: 0.3))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    alignment: Alignment.topLeft,
                    child: Icon(Icons.settings, color: variable.primary,),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Text('Settings', style: TextStyle(fontSize: 16),),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    alignment: Alignment.topLeft,
                    child: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18,),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.only(top: 13, bottom: 13),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(color: Colors.grey, width: 0.3))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    alignment: Alignment.topLeft,
                    child: Icon(Icons.exit_to_app, color: variable.primary,),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Text('Logout', style: TextStyle(fontSize: 16),),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    alignment: Alignment.topLeft,
                    child: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18,),
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}