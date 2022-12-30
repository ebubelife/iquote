import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Authors extends StatefulWidget {
  const Authors();

  @override
  _AuthorsState createState() => _AuthorsState();
}

class _AuthorsState extends State<Authors> {
  var categories = [
    {'Author': 'Abraham Lincoln'},
    {'Author': 'Abraham Lincoln'},
    {'Author': 'Abraham Lincoln'},
    {'Author': 'Abraham Lincoln'},
    {'Author': 'Abraham Lincoln'},
    {'Author': 'Abraham Lincoln'},
    {'Author': 'Abraham Lincoln'},
  ];

  ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(10),
            height: double.maxFinite,
            width: double.maxFinite,
            child: ListView.separated(
                shrinkWrap: true,
                itemCount: 10,
                controller: _controller,
                scrollDirection: Axis.vertical,
                primary: false,
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (c, i) {
                  return SizedBox(width: 15);
                },
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Row(
                      children: [
                        const Text(
                          "Albert Einstein",
                          style: TextStyle(
                              color: Color.fromARGB(255, 63, 63, 63),
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                        Spacer(),
                        Text(
                          "200 Quotes",
                          style:
                              TextStyle(color: Color.fromARGB(255, 63, 63, 63)),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        color:
                            Color.fromARGB(255, 223, 223, 223).withOpacity(0.3),
                        border: Border(
                          left: BorderSide(
                            //                   <--- left side
                            color: Color.fromARGB(255, 7, 196, 253),
                            width: 3.0,
                          ),
                        )),
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.only(
                        top: 20, bottom: 20, left: 20, right: 10),
                  );
                })));
  }
}
