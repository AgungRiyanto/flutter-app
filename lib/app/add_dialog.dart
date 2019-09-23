import 'package:flutter/material.dart';
class AddDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AddDialogState();
}

class AddDialogState extends State<AddDialog>
    with SingleTickerProviderStateMixin {
    AnimationController controller;
    Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 5,
          right: 5,
          child: Material(
            color: Colors.transparent,
            child: ScaleTransition(
              scale: scaleAnimation,
              child: Container(
                decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3.0))
                    ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("Well hello there!"),
                ),
              ),
            ),
          ),
        )
      ],
    );  
  }
}