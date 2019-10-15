import 'package:flutter/material.dart';
import 'package:my_app/helpers/variables.dart' as variable;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class Project extends StatefulWidget {
  _ProjectState createState() => _ProjectState();
}

class  _ProjectState extends State<Project> {
  
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

  @override
  Widget build(BuildContext context) {
    Widget appBar() {
      return Container(
        color: Colors.white,
        padding: EdgeInsets.only(right: 10, left: 10, top: 15, bottom: 15),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      child: Icon(Icons.arrow_back_ios, color: variable.primary),
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text('Projects', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black)),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.bottomRight,
                    child: Icon(Icons.search, color: variable.primary),
                  ),
                )
              ],
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Expanded(
        flex: 10,
        child: Container(
          padding: EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: snapshot.length,
            itemBuilder: (context, i) {
              final item = snapshot[i];
              return InkWell(
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: variable.primary,
                    borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        // alignment: Alignment.centerLeft,
                        child: Text(snapshot[i]['name'], style:TextStyle(color: Colors.white, fontWeight:FontWeight.bold, fontSize: 18)),
                      ),
                      Text(snapshot[i]['desc'], style: TextStyle(color: Colors.white),)
                    ],
                  ),
                ),
              );
            },
          )
        ),
      );
    } 

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                appBar(),
                content(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}