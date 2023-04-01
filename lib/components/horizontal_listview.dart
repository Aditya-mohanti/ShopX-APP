import 'package:flutter/material.dart';
class HorizontalList extends StatelessWidget {
  const HorizontalList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            image_location:'assets/images/cats/tshirt.png',
            image_caption:'Shirt',
          ),
          Category(
            image_location:'assets/images/cats/formal.png',
            image_caption:'Formals',
          ),
          Category(
            image_location:'assets/images/cats/informal.png',
            image_caption:'Informal',
          ),
          Category(
            image_location:'assets/images/cats/jeans.png',
            image_caption:'Jeans',
          ),
          Category(
            image_location:'assets/images/cats/dress.png',
            image_caption:'Dress',
          ),
          Category(
            image_location:'assets/images/cats/tshirt.png',
            image_caption:'Shirt',
          ),
        ],
      ),
    );
  }
}
class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Category({Key? key, required this.image_location, required this.image_caption}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: (){},
        child: Container(
          width: 100.0,
          child: ListTile(
            title: Image.asset(
              image_location,
              width: 100.0,
              height: 80.0,
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(
                image_caption,
                style: TextStyle(color:Colors.black,fontSize:14.0, fontWeight: FontWeight.w300
              ),),
            ),
          ),
        ),
      ),
    );
  }
}

