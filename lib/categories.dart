import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Categories extends StatefulWidget {
  const Categories();

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  var categories = [
    {'category': 'Authors', 'image': 'poet-svgrepo-com.svg'},
    {
      'category': 'Body Fitness',
      'image': 'girl-stretching-body-svgrepo-com.svg'
    },
    {'category': 'Spirituality', 'image': 'new-age-svgrepo-com.svg'},
    {'category': 'Business', 'image': 'business-bag-svgrepo-com.svg'},
    {'category': 'Motivation', 'image': 'goal-svgrepo-com.svg'},
    {'category': 'Life', 'image': 'pulse-life-svgrepo-com.svg'},
    {'category': 'Sports', 'image': 'sports-svgrepo-com.svg'},
    {'category': 'Education', 'image': 'education-svgrepo-com.svg'},
    {'category': 'Islam', 'image': 'islam-muslim-svgrepo-com.svg'},
    {'category': 'Health', 'image': 'health-care-svgrepo-com.svg'},
    {'category': 'Music', 'image': 'music-svgrepo-com.svg'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(10),
            height: double.maxFinite,
            width: double.maxFinite,
            child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 8.0,
                children: List.generate(categories.length, (index) {
                  return Container(
                      padding: EdgeInsets.only(
                          top: 35, left: 10, right: 10, bottom: 10),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 236, 236, 236),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      height: 100,
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            "assets/svg/${categories[index]["image"]}",
                            height: 40,
                            width: 40,
                            fit: BoxFit.scaleDown,
                            //  color: Color.fromARGB(255, 255, 255, 255)
                          ),
                          SizedBox(height: 12),
                          Text(
                            "${categories[index]["category"]}",
                            style: TextStyle(fontSize: 13, color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ));
                }))));
  }
}
