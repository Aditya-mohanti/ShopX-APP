import 'package:flutter/material.dart';
import 'package:shop_x/main.dart';

import '../components/products.dart';
class PageDetails extends StatefulWidget {
  final product_detail_name;
  final product_detail_old_prize;
  final product_detail_new_prize;
  final product_detail_picture;

  PageDetails({
    this.product_detail_name,
    this.product_detail_old_prize,
    this.product_detail_new_prize,
    this.product_detail_picture
  });

  @override
  State<PageDetails> createState() => _PageDetailsState();
}

class _PageDetailsState extends State<PageDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red,
        centerTitle: true,
        title: InkWell(
          onTap: (){Navigator.push(context,MaterialPageRoute(builder: (context)=>new HomePage()));},
            child: Text("Shop X")),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search,color: Colors.white,),onPressed: (){}),
          new IconButton(icon: Icon(Icons.shopping_cart_sharp,color: Colors.white),onPressed: (){}),
        ],
      ),
      body: ListView(
        children: <Widget>[
          new Container(
            height: 300,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.product_detail_picture),
              ),
              footer: new Container(
                color: Colors.white,
                child: ListTile(
                  leading: new Text(widget.product_detail_name,
                  style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),),
                  title: new Row(
                    children: <Widget>[
                      Expanded(
                        child:new Text("\$${widget.product_detail_old_prize}",
                        style: TextStyle(color: Colors.grey,decoration: TextDecoration.lineThrough),),
                      ),
                      Expanded(
                        child:new Text("\$${widget.product_detail_new_prize}",
                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          ////////////// THE FIRST BUTTONS?////////////////
          Row(
            children: <Widget>[
              //=============The size Button==============/
              Expanded(
                  child:MaterialButton(
                    onPressed: (){
                    showDialog(context: context,
                        builder: (context){
                      return new AlertDialog(
                        title: new Text("Size"),
                        content: new Text("Choose the size"),
                        actions: <Widget>[
                          new MaterialButton(onPressed: (){
                            Navigator.of(context).pop(context);
                          },
                          child: new Text("close"),)
                        ],
                      );
                    });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                    elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: new Text("Size"),
                      ),
                      Expanded(
                          child: new Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),)
              ),
              Expanded(
                  child:MaterialButton(
                    onPressed: (){
                      showDialog(context: context,
                          builder: (context){
                            return new AlertDialog(
                              title: new Text("Colors"),
                              content: new Text("Choose a Color"),
                              actions: <Widget>[
                                new MaterialButton(onPressed: (){
                                  Navigator.of(context).pop(context);
                                },
                                  child: new Text("close"),)
                              ],
                            );
                          });
                    },
                    color: Colors.white,
                    textColor: Colors.grey,
                    elevation: 0.2,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: new Text("Color"),
                        ),
                        Expanded(
                          child: new Icon(Icons.arrow_drop_down),
                        ),
                      ],
                    ),)
              ),
              Expanded(
                  child:MaterialButton(
                    onPressed: (){
                      showDialog(context: context,
                          builder: (context){
                            return new AlertDialog(
                              title: new Text("Quantity"),
                              content: new Text("Choose the quantity"),
                              actions: <Widget>[
                                new MaterialButton(onPressed: (){
                                  Navigator.of(context).pop(context);
                                },
                                  child: new Text("close"),)
                              ],
                            );
                          });
                    },
                    color: Colors.white,
                    textColor: Colors.grey,
                    elevation: 0.2,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: new Text("Quantity"),
                        ),
                        Expanded(
                          child: new Icon(Icons.arrow_drop_down),
                        ),
                      ],
                    ),)
              ),
            ],
          ),
          Row(
            children: <Widget>[
              //=============The Second Button==============//
              Expanded(
                  child:MaterialButton(
                    onPressed: (){},
                    color: Colors.red,
                    textColor: Colors.white,
                    elevation: 0.2,
                    child: new Text("Buy Now"),
                  ),
              ),
              new IconButton(icon: Icon(Icons.add_shopping_cart,color: Colors.red),color:Colors.red,onPressed: (){}),
              new IconButton(icon: Icon(Icons.favorite,color: Colors.red),color :Colors.red,onPressed: (){}),



            ],
          ),
          Divider(color: Colors.red,),
          new ListTile(
            title: new Text("Product Details"),
            subtitle: new Text("These t-shirts are a comfortable and durable alternative to standard cotton tees."
                " It’s designed to be worn all day by the man in demand. "
                "This classic design will keep you looking presentable on the "
                "go with a gentle fabric for comfort all day."
            ),
          ),
          Divider(),
          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
              child: Text("Product Name",style: TextStyle(
                color: Colors.black,
              fontWeight: FontWeight.bold),),
              ),
              Padding(padding: const EdgeInsets.all(5.0),
              child: new Text(widget.product_detail_name),)
            ],
          ),
          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text("Product Brand",style: TextStyle(
                  color: Colors.black,
                fontWeight: FontWeight.bold),),
              ),
              Padding(padding: const EdgeInsets.all(5.0),
              child: new Text("Brand X"),),
            ],
          ),
          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text("Product Condition",style: TextStyle(
                  color: Colors.black,
                fontWeight: FontWeight.bold),),
              ),
              Padding(padding: const EdgeInsets.all(5.0),
                child: new Text("NEW"),),
            ],
          ),
          Divider(),
          Padding(padding: EdgeInsets.all(8.0),
           child: new Text("Similar Products",style: TextStyle(
             color: Colors.grey,
             fontWeight: FontWeight.bold,
             fontSize: 15.0,
           ),),),
          /////// +++++++ SIMILAR PRODUCTS KA SECTION//////////////
          Container(
            height: 360.0,
            child: Similar_Products(),
          )
        ],
      ),
    );
  }
}
class Similar_Products extends StatefulWidget {
  @override
  State<Similar_Products> createState() => _Similar_ProductsState();
}

class _Similar_ProductsState extends State<Similar_Products> {
  var product_list=[
    {
      "name": "Red dress",
      "picture": "assets/images/products/dress1.jpeg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "Sexy Heals",
      "picture": "assets/images/products/hills1.jpeg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "Hot Pants",
      "picture": "assets/images/products/pants1.jpg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "Casual Shoes ",
      "picture": "assets/images/products/shoe1.jpg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "Mini Skirt",
      "picture": "assets/images/products/skt1.jpeg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": " Tight Skirt",
      "picture": "assets/images/products/skt2.jpeg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "Track Pants",
      "picture": "assets/images/products/pants2.jpeg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "Party Wear",
      "picture": "assets/images/products/dress2.jpeg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "Placement Blazer",
      "picture": "assets/images/products/blazer2.jpeg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "Gucci Bag",
      "picture": "assets/images/w1.jpeg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "Trendy Tees",
      "picture": "assets/images/w3.jpeg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "Classic Watch",
      "picture": "assets/images/w4.jpeg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "Vanhausen Blazer",
      "picture": "assets/images/m2.jpg",
      "old_price": 100,
      "price": 50,
    },




  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
        new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Similar_Single_prod(
            prod_name: product_list[index]['name'],
            prod_pricture: product_list[index]['picture'],
            prod_old_price: product_list[index]['old_price'],
            prod_price: product_list[index]['price'],
          );
        });
  }
}
class Similar_Single_prod extends StatelessWidget {
  final prod_name;
  final prod_pricture;
  final prod_old_price;
  final prod_price;

  Similar_Single_prod({
    this.prod_name,
    this.prod_pricture,
    this.prod_old_price,
    this.prod_price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: prod_name,
          child: Material(
            child: InkWell(
                onTap: () =>Navigator.of(context).push(new MaterialPageRoute(
                    builder: (context)=>new PageDetails(
                      //passing the details to the next page
                      product_detail_name: prod_name,
                      product_detail_new_prize: prod_price,
                      product_detail_old_prize: prod_old_price,
                      product_detail_picture: prod_pricture,
                    ))),
                child: GridTile(
                    footer: Container(
                      color: Colors.white70,
                      child: ListTile(
                        leading: Text(
                          prod_name,
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        title: Text(
                          "\$$prod_price",
                          style: TextStyle(
                              color: Colors.red,fontWeight: FontWeight.bold
                          ),
                        ),
                        subtitle: Text(
                          "\$$prod_old_price",
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w800,
                            decoration:TextDecoration.lineThrough,
                          ),
                        ),
                      ),
                    ), child: Image.asset(
                  prod_pricture,
                  fit: BoxFit.cover,
                )
                )
            ),
          )),
    );
  }
}


