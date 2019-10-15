import 'package:flutter/material.dart';
import 'package:my_app/helpers/variables.dart' as variable;
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateProject extends StatefulWidget {
  _CreateProjectState createState() => _CreateProjectState();
}

class  _CreateProjectState extends State<CreateProject> {
  final databaseReference = Firestore.instance;
  final nameController = TextEditingController();
  final descController = TextEditingController();

  void createRecord() async {
    DocumentReference ref = await databaseReference.collection("project")
      .add({
        'name': nameController.text,
        'desc': descController.text
      });
  }

  @override
  Widget build(BuildContext context) {
    Widget appBar() {
      return Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 0.6
            ),
          ),
        ),
        // color: Colors.white,
        padding: EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 10),
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
                  flex: 4,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text('New Project', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black)),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: InkWell(
                    onTap: () {
                      createRecord();
                    },
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Container(
                        padding: EdgeInsets.only(bottom: 8, top: 8, left: 15, right: 15),
                        decoration: BoxDecoration(
                          border: Border.all(color: variable.primary, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(20.0))
                        ),
                        child: Text('Save', style: TextStyle(fontWeight: FontWeight.bold, color: variable.primary),),
                      )
                    ),
                  )
                )
              ],
            ),
          ],
        ),
      );
    }

    Widget nameInput() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Text('Name this project', style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(5))
            ),
            child: TextField(
              controller: nameController,
              style: new TextStyle(color: Colors.grey),
              decoration: new InputDecoration(
                hintText: 'e.g. Anchorage',
                hintStyle: TextStyle(color: Colors.grey),
                contentPadding: EdgeInsets.all(15.0),
                border: InputBorder.none,
              ),
            ),
          )
        ],
      );
    }

    Widget descInput() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 10, top: 10),
            child: Text('Add an optional description', style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(5))
            ),
            child: TextField(
              controller: descController,
              maxLines: 3,
              style: new TextStyle(color: Colors.grey),
              decoration: new InputDecoration(
                hintText: 'e.g. Plan and schedulling for expanding the office',
                hintStyle: TextStyle(color: Colors.grey),
                contentPadding: EdgeInsets.all(15.0),
                border: InputBorder.none,
              ),
            ),
          )
        ],
      );
    }

    Widget content() {
      return Expanded(
        flex: 10,
        child: Container(
          padding: EdgeInsets.only(top: 15, left: 10, right: 10),
          child: Column(
            children: <Widget>[
              nameInput(),
              descInput()
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