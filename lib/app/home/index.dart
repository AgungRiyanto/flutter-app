import 'package:flutter/material.dart';
import 'package:my_app/helpers/variables.dart' as variable;
import 'package:flutter_swiper/flutter_swiper.dart';


class Home extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: new Swiper(
        itemHeight: 130,
        // loop: true,
        autoplay: true, 
        autoplayDisableOnInteraction: true, 
        onTap: (int i){
          // Scaffold.of(context).showSnackBar(new SnackBar(
          //   content: new Text("index ke "+i.toString()),
          // ));
        },
        // itemBuilder: (BuildContext context,int index){      
        //   return new Image.network(urls[index],fit: BoxFit.fill,);
        // },
        itemBuilder: (context, index) {
          return new Container(
            color: Colors.grey,
            child: new Image.network("https://image.tmdb.org/t/p/w370_and_h556_bestv2/2uNW4WbgBXL25BAbXGLnLqX71Sw.jpg",fit: BoxFit.fill,),
          );
        },
          itemCount: 5
      ),

    );
  }
}