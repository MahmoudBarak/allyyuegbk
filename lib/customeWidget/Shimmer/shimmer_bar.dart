import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustShimmerBar extends StatefulWidget {
  const CustShimmerBar();

  @override
  State<CustShimmerBar> createState() => _CustShimmerBarState();
}

class _CustShimmerBarState extends State<CustShimmerBar> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) =>  Shimmer.fromColors(
          baseColor: Colors.grey.shade200,
          highlightColor: Colors.grey.shade100,
          child: Container(
            margin: EdgeInsets.all(10),
            height: 40,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.grey),
          ),
        ),
        separatorBuilder: (context, index) => SizedBox(
          width: 5,
        ),
        itemCount: 5);
  }
}

