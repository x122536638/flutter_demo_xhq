import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: 'Flutter Tutorial',
    home: new TutorialHome(),
  ));
}

class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Scaffold是Material中主要的布局组件.
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: new Text('Example title'),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,




          ),
        ],
      ),
      //body占屏幕的大部分

      body: new Center(
//        child: new Text('Hello, world!'),
//        child: new MyButton(),
//      child: new Counter(),
      child: new ShoppingList(products:<Product>[
        new Product(name: 'eggs'),
        new Product(name: "flour"),

      ],),
          ),

      floatingActionButton: new FloatingActionButton(
        tooltip: 'Add', // used by assistive technologies
        child: new Icon(Icons.add),
        onPressed: null,
      ),
    );
  }
}
//模型
class Product {
  final String name;
  const Product({this.name});
}

typedef void CartCHangedCaollback(Product product, bool incart);
//模型  模型状态  cell  构造函数里定义了一个点击事件
class ShoppingListItem extends StatelessWidget {

  ShoppingListItem({Product product,this.inCart,this.onCarChanged}):  product =product,super(key:new ObjectKey(product));

  Product product;
  bool inCart;

  CartCHangedCaollback onCarChanged;

  Color _getColor(BuildContext context) {
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context){
    if (!inCart) return null;
    return new TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      onTap: () {
        onCarChanged(product, !inCart);
      },
      leading: new CircleAvatar(
        backgroundColor: _getColor(context),
        child: new Text(product.name),
      ),
      title: new Text(product.name,style:_getTextStyle(context) ,),
    );
  }
}

//模型数组   tableview
class ShoppingList extends StatefulWidget{

  ShoppingList({Key key,this.products}):super(key:key);

//  ShoppingList({this.products});
  final List<Product> products;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _ShoppingListState();
  }

}
//模型状态集合  点击事件实现
class _ShoppingListState extends State<ShoppingList>{

  Set<Product> _shoppingCart = new Set<Product>();



  void _handleCartChanged(Product product,bool isCart){

    setState(() {
      if(isCart){
        _shoppingCart.add(product);
      }else{
        _shoppingCart.remove(product);
      }


    });

  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ss'),
      ),
      body: new ListView(
        padding: new EdgeInsets.symmetric(vertical: 8.0),
        children: widget.products.map((Product product){
          return new ShoppingListItem(product: product,inCart: _shoppingCart.contains(product),onCarChanged:_handleCartChanged ,);
        }).toList(),
      ),
    );
  }

}



