import 'package:flutter/material.dart';
import 'package:shop_x/components/products.dart';
///// My Imports
class Cart_Products extends StatefulWidget {
  const Cart_Products({Key? key}) : super(key: key);

  @override
  State<Cart_Products> createState() => _Cart_ProductsState();
}

class _Cart_ProductsState extends State<Cart_Products> {
  var Products_on_the_cart=[
  {
  "name": "Blazer",
  "pricture": "assets/images/products/blazer1.jpeg",
  "price": 50,
    "size":"M",
  "color":"Red",
  "quantity":1,
  },
  {
  "name": "shoes",
  "pricture": "assets/images/products/shoe1.jpg",
  "price": 60,
    "size":"8",
  "color":"Black",
  "quantity":1,
  },
  ];
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: Products_on_the_cart.length,
        itemBuilder: (context,index){
        return Singel_cartproducts(
          cart_prod_name: Products_on_the_cart[index]["name"],
            cart_prod_pricture:Products_on_the_cart[index]["pricture"],
            cart_prod_price:Products_on_the_cart[index]["price"],
          cart_prod_size:Products_on_the_cart[index]["size"],
          cart_prod_color:Products_on_the_cart[index]["color"],
          cart_prod_quantity:Products_on_the_cart[index]["quantity"],
        );
        });
  }
}
class Singel_cartproducts extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_pricture;
  final cart_prod_price;
  final cart_prod_size;
  final cart_prod_color;
  final cart_prod_quantity;


  Singel_cartproducts({ this.cart_prod_name,this.cart_prod_pricture,
      this.cart_prod_price, this.cart_prod_size, this.cart_prod_color,
      this.cart_prod_quantity});




  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        ////// add leading image in front of the order/////
        leading: new Image.asset(cart_prod_pricture,width: 80.0,),
        title: new Text(cart_prod_name),
        subtitle: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                ////this section is for sizee////
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: new Text("Size:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new Text(cart_prod_size,style: TextStyle(
                    color: Colors.red,),),
                ),
                ////// This section is for product color//////
                new Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                  child: new Text("Color:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new Text(cart_prod_color,style: TextStyle(color: Colors.red),),
                ),
              ],
            ),
            //==============THIS section is for product price//////
            Container(
              alignment: Alignment.topLeft,
              child: Text("\$${cart_prod_price}",style: TextStyle(color: Colors.red,fontSize: 17.0,
              fontWeight: FontWeight.bold),),
            )
          ],
        ),
      ),
    );
  }
}

