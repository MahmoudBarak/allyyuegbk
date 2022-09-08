import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_outlined,
                    ),
                  ),
                  Text(
                    'My Cart',
                    style:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              _listOfItems(),
              _button()
            ],
          ),
        ),
      ),
    );
  }

  int x = 1;
  Widget _listOfItems() => Container(
    width: 360,
    height: 800,
        child: ListView.separated(
          itemBuilder: (context, index) => _items(),
          physics: BouncingScrollPhysics(),
          itemCount: 5,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          separatorBuilder: (context, index) => SizedBox(
            height: 20,
          ),


        ),
      );
  Widget _items() => Container(
        height: 130,
        width: 350,
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10)),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/Images/small_tilt_shoe_1.png'),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nike Shoes',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Size: 45'),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '140 \$',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
            Container(
              height: 40,
              width: 112,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        x++;
                      });
                    },
                    color: Colors.orange.shade800,
                  ),
                  Text('${x}'),
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      setState(() {
                        x--;
                      });
                    },
                    color: Colors.orange.shade800,
                  ),
                ],
              ),
            )
          ],
        ),
      );
  Widget _button()=> Column(
    children: [
      Container(
        width: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Colors.orange.shade800,
        ),
        child: TextButton(
          child: Text('Buy Now', style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold,fontSize: 18)),
          onPressed: () {

          },

        ),
      ),
    ],
  );
}
