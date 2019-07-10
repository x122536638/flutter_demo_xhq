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
//      child: new ShoppingList(products:<Product>[
//        new Product(name: 'eggs'),
//        new Product(name: "flour"),
//
//      ]),
      child: new ShoppingList( <Product>[
        new Product(name: "dsdsd"),
        new Product(name: "sdadasd"),
      ]),
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

  //点击回调
  CartCHangedCaollback callback;
 final Product product;
  final bool inCart;
  ShoppingListItem(this.product,this.callback,this.inCart);

//  ShoppingListItem({Product prodcut,this.inCart,this.callback}):product =prodcut,super(key:new ObjectKey(product));

  Color _getColor(BuildContext ctx){
    if(inCart){
      return Colors.black54;
    }
    return Theme.of(ctx).primaryColor;

  }

  TextStyle _getStyle(BuildContext context){

    if(!inCart) return null;
    return TextStyle(decoration: TextDecoration.lineThrough);

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListTile(
      onTap: (){
        callback(product,!inCart);
      },
      leading: CircleAvatar(backgroundColor:_getColor(context),child: new Text(product.name),),
      title: new Text(product.name,style:_getStyle(context) ,),

    );



  }


}

//模型数组   tableview   构造函数(模型数组)
class ShoppingList extends StatefulWidget{

   final List<Product> array;
  ShoppingList(this.array);

//  ShoppingList(Key key,this.array):super(key:key);//widget复用相关的?
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _ShoppingListState();
  }



}
//模型状态集合  点击事件实现
class _ShoppingListState extends State<ShoppingList>{

  Set<Product> _incartSet =new Set<Product>();

  void _cartCHangedCaollback(Product product, bool incart){

    setState(() {
      if(incart){
        _incartSet.add(product);
      }else{
        _incartSet.remove(product);
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView(
      children: widget.array.map((product){
//        return new Text(product.name);


      return new ShoppingListItem(product, _cartCHangedCaollback  , _incartSet.contains(product));
      }).toList(),
    );
  }




//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return new ListView(
//      children:widget.array.map((product){
//        return new ShoppingListItem(product: product,callback: _cartCHangedCaollback,);
//
//      }).toList(),
//
//      //<ShoppingListItem>[],
//    );
//  }



}



