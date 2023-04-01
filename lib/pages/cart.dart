import 'package:flutter/material.dart';
import 'package:shop_x/components/carts_products.dart';
class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text("Cart"),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: (){}),
        ],
      ),
      body:new Cart_Products() ,
      bottomNavigationBar: new Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(child: ListTile(
              title: new Text("Total"),
              subtitle: new Text("\$230"),
            )),
            Expanded(
            child: new MaterialButton(onPressed: (){},
            child: new Text("Check Out",style: TextStyle(
              color: Colors.white,
            ),),
            color: Colors.red,),
            ),
          ],
        ),
      ),
    );
  }
}
