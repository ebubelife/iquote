import 'package:flutter/material.dart';
import 'package:iquote/authors.dart';
import 'package:iquote/categories.dart';
import 'package:iquote/landing.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';
import 'package:flutter_svg/svg.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  const Home();

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //create a CardController
  SwipeableCardSectionController _cardController =
      SwipeableCardSectionController();
  int counter = 4;
  bool liked = false;
  int? currentQuote;
  List<Widget> card_views = [];
  List<Widget> swiped_cards = [];

  int pageIndex = 0;

  var sample_quotes = [
    {
      'image': 'fahrul-azmi-5K549TS6F08-unsplash.jpg',
      'quote':
          'And whoever is grateful is grateful for the good of his own soul. And whoever is ungrateful, then Allah is in no need of him.',
      'type': 'Islam',
      'author': 'Quoran'
    },
    {
      'image': 'emma-simpson-mNGaaLeWEp0-unsplash.jpg',
      'quote':
          'You are never too old to set new goals or to dream a new dream.',
      'type': 'health',
      'author': 'iQuote'
    },
    {
      'image': 'tegan-mierle-ioyEITUD2G8-unsplash.jpg',
      'quote': 'The only way to do great work is to love what you do.',
      'type': 'Motivation',
      'author': 'Steve Jobs'
    }
  ];

  final pages = [
    const HomePage(),
    const Authors(),
    const Categories(),
    const Categories(),
  ];

  @override
  void initState() {
    cardView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var _card_view = cardView();
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 22, 39),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Color.fromARGB(255, 238, 89, 4),
          unselectedItemColor: Color.fromARGB(255, 34, 34, 34),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          currentIndex: pageIndex,
          onTap: (value) => {
            setState(() {
              pageIndex = value;
            })
          },
          type: BottomNavigationBarType.shifting,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/svg/home-svgrepo-com(2).svg",
                height: 23,
                width: 23,
                fit: BoxFit.scaleDown,
                //  color: Color.fromARGB(255, 255, 255, 255)
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/svg/smiling-svgrepo-com.svg",
                height: 23,
                width: 23,
                fit: BoxFit.scaleDown,
                //  color: Color.fromARGB(255, 255, 255, 255)
              ),
              label: 'Authors',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/svg/category-svgrepo-com.svg",
                height: 23,
                width: 23,
                fit: BoxFit.scaleDown,
                //  color: Color.fromARGB(255, 255, 255, 255)
              ),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/svg/saved-svgrepo-com.svg",
                height: 23,
                width: 23,
                fit: BoxFit.scaleDown,
                //  color: Color.fromARGB(255, 255, 255, 255)
              ),
              label: 'Saved',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/svg/new-sticker-svgrepo-com.svg",
                height: 23,
                width: 23,
                fit: BoxFit.scaleDown,
                //  color: Color.fromARGB(255, 255, 255, 255)
              ),
              label: 'New',
            ),
          ],
        ),
        drawer: Drawer(
            width: double.maxFinite,
            child: Scaffold(
                appBar: AppBar(
                  foregroundColor: Color.fromARGB(255, 0, 22, 39),
                  backgroundColor: Colors.white,
                  elevation: 0.5,
                ),
                body: Container(
                  padding: EdgeInsets.all(10),
                  height: double.maxFinite,
                  width: double.maxFinite,
                ))),
        appBar: AppBar(
          foregroundColor: Color.fromARGB(255, 0, 22, 39),

          backgroundColor: Colors.white,
          elevation: 0.0,
          // ignore: prefer_const_literals_to_create_immutables

          title: const Text(
            "iQuote",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 241, 77, 1),
            ),
          ),
        ),
        body: pages[pageIndex]);
  }

  List<Widget> cardView() {
    for (var sample_quote in sample_quotes) {
      card_views.add(Card(
        child: Container(
          height: 140,
          width: 420,

          // ignore: sort_child_properties_last
          child: Container(
              padding: const EdgeInsets.all(7),
              height: double.maxFinite,
              width: double.maxFinite,
              color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.6),
              child: Column(
                children: [
                  Spacer(),
                  Center(
                      child: Text(
                    sample_quote["quote"]!,
                    textAlign: TextAlign.center,
                    // ignore: prefer_const_constructors
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
                  Spacer(),
                  Center(
                      child: Text(
                    sample_quote["author"]!,
                    textAlign: TextAlign.center,
                    // ignore: prefer_const_constructors
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  )),
                ],
              )),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 148, 148, 148).withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(5)),
              image: DecorationImage(
                  image: AssetImage(
                    "assets/quote_sample_images/${sample_quote["image"]}",
                  ),
                  fit: BoxFit.fill)),
        ),
      ));
    }
    return card_views;
  }
}
