import 'package:flutter/material.dart';
import 'package:my_app/helpers/variables.dart' as variable;
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';


class Home extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  StreamSubscription<QuerySnapshot>subscription;

  List<DocumentSnapshot>snapshot;

  CollectionReference collectionReference =Firestore.instance.collection('project');

  @override
  void initState() {
    subscription = collectionReference.snapshots().listen((dataSnapshot){
      setState(() {
        snapshot = dataSnapshot.documents;
      });
    });
    super.initState();
  }

  Widget slider() {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0)
        ),
        height: 130,
        child:  new Swiper(
          loop: true,
          pagination: SwiperPagination(
            margin: EdgeInsets.all(5.0),
            builder: DotSwiperPaginationBuilder(
              size: 7,
              activeSize: 7,
              color: Colors.white, activeColor: variable.primary
            )
          ),
          autoplay: true, 
          autoplayDisableOnInteraction: true, 
          onTap: (int i){
            // Scaffold.of(context).showSnackBar(new SnackBar(
            //   content: new Text("index ke "+i.toString()),
            // ));
          },
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset('assets/images/background.jpg', fit: BoxFit.cover,),
            );
          },
          itemCount: 5
        ),
      );
  }

  Widget basicMenu() {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: InkWell(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: variable.primary,
                      borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                    padding: EdgeInsets.all(15),
                    child: Icon(Icons.perm_contact_calendar, color: Colors.white,),
                  ),
                  Text('Teams', style:TextStyle(color: Colors.grey))
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'project');
              },
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: variable.primary,
                      borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                    padding: EdgeInsets.all(15),
                    child: Icon(Icons.developer_board, color: Colors.white,),
                  ),
                  Text('Project', style:TextStyle(color: Colors.grey))
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: InkWell(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: variable.primary,
                      borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                    padding: EdgeInsets.all(15),
                    child: Icon(Icons.timeline, color: Colors.white,),
                  ),
                  Text('Timeline', style:TextStyle(color: Colors.grey))
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: InkWell(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: variable.primary,
                      borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                    padding: EdgeInsets.all(15),
                    child: Icon(Icons.note, color: Colors.white,),
                  ),
                  Text('Notes', style:TextStyle(color: Colors.grey))
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          slider(),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            alignment: Alignment.centerLeft,
            child: Text('Application', style:TextStyle(fontWeight:FontWeight.bold)),
          ),
          basicMenu()
          // teams()
        ],
      )
    );
  }
}