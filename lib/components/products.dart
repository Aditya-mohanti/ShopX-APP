import 'package:flutter/material.dart';
import 'package:shop_x/pages/products_details.dart';
class Products extends StatefulWidget {
  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list=[
    {
      "name": "Blazer",
      "picture": "assets/images/products/blazer1.jpeg",
      "old_price": 120,
      "price": 85,
    },
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
          return Single_prod(
            prod_name: product_list[index]['name'],
            prod_pricture: product_list[index]['picture'],
            prod_old_price: product_list[index]['old_price'],
            prod_price: product_list[index]['price'],
          );
        });
  }
}
class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_pricture;
  final prod_old_price;
  final prod_price;

  Single_prod({
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

