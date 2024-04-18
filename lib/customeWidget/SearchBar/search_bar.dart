import 'package:allyyuegbk/customeWidget/SearchBar/search%20_delegate.dart';
import 'package:flutter/material.dart';


class CustSearchBar extends StatelessWidget {
  final bool isHome;
   CustSearchBar({required this.isHome});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       isHome? SizedBox():IconButton(
          onPressed: () {

            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_outlined,
          ),
        ),
        GestureDetector(
          onTap: (){
            showSearch(
              context: context,
              delegate: Search(),
            );
          },
          child: Container(
            height: MediaQuery.of(context).size.height/18,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10)),
            width: MediaQuery.of(context).size.width/1.19,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.search_outlined,color: Colors.black,),
                ),
                SizedBox(width: MediaQuery.of(context).size.width/30,),
                Text("Find Your Product",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 16),),
              ],)
          ),
        ),
      ],
    );
  }
}


