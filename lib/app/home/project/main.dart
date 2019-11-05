import 'package:flutter/material.dart';
import 'package:my_app/helpers/variables.dart' as variable;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:my_app/models/ProjectModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shimmer/shimmer.dart';

class Project extends StatefulWidget {
  _ProjectState createState() => _ProjectState();
}

class  _ProjectState extends State<Project> {
  
  // StreamSubscription<QuerySnapshot>subscription;

  // List<DocumentSnapshot>snapshot;

  // CollectionReference collectionReference =Firestore.instance.collection('project');
  

  @override
  void initState() {
    // subscription = collectionReference.snapshots().listen((dataSnapshot){
    //   setState(() {
    //     snapshot = dataSnapshot.documents;
    //   });
    // });
    super.initState();
  }

  Future<List<ProjectModel>> getProject() async {
    final JsonDecoder json = new JsonDecoder();
    http.Response response = await http.get(
      'https://managing.000webhostapp.com/api/project');
    var responseJson = json.convert(response.body);
    return (responseJson['payload'] as List)
        .map((p) => ProjectModel.fromJson(p))
        .toList();
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
          child: new ListView(
            children: <Widget>[
              new FutureBuilder<List<ProjectModel>>(
                future: getProject(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<ProjectModel> projects = snapshot.data;
                    return new Column(
                      children: projects.map((p) => new Column(
                        children: <Widget>[
                          new InkWell(
                            child: Container(
                              margin: EdgeInsets.only(bottom: 15),
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
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(p.name, style:TextStyle(color: Colors.white, fontWeight:FontWeight.bold, fontSize: 18)),
                                        Icon(Icons.more_vert, color: Colors.white)
                                      ],
                                    ),
                                  ),
                                  Text(p.description, style: TextStyle(color: Colors.white),),
                                  Container(
                                    padding: EdgeInsets.only(top: 15,),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(right: 5),
                                          width: 35,
                                          height: 35,
                                          decoration: new BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: new DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage('assets/images/johndoe.jpg')
                                              )
                                          )
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(right: 5),
                                          width: 35,
                                          height: 35,
                                          decoration: new BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: new DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage('assets/images/agung.jpg')
                                              )
                                          )
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(right: 5),
                                          width: 35,
                                          height: 35,
                                          decoration: new BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: new DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage('assets/images/janedoe.jpg')
                                              )
                                          )
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(right: 5),
                                          width: 35,
                                          height: 35,
                                          alignment: Alignment.center,
                                          decoration: new BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white
                                              // image: new DecorationImage(
                                              //     fit: BoxFit.cover,
                                              //     image: AssetImage('assets/images/janedoe.jpg')
                                              // )
                                          ),
                                          child: Text('+21', style:TextStyle(color:variable.primary)),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      )).toList()
                    );
                  } else if (snapshot.hasError) {
                      return snapshot.error;
                    }
                    return new Center(
                      child: new Column(
                        children: <Widget>[
                          new Padding(padding: new EdgeInsets.all(50.0)),
                          new CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(variable.primary),),
                        ],
                      ),
                    );
                },
              )
            ],
          ),
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