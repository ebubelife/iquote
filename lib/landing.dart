import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:swipeable_card_stack/swipe_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SwipeableCardSectionController _cardController =
      SwipeableCardSectionController();
  int counter = 4;
  bool liked = false;
  int? currentQuote;
  List<Widget> card_views = [];
  List<Widget> swiped_cards = [];
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Color.fromARGB(255, 0, 22, 39),
          child: Column(children: [
            const SizedBox(
              height: 30,
            ),
            CarouselSlider(
              items: cardView(),
              options: CarouselOptions(
                height: 330.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),
            const SizedBox(height: 20),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          liked = !liked;
                        });
                      },
                      child: SvgPicture.asset(
                          "assets/svg/heart-svgrepo-com1.svg",
                          height: 21,
                          width: 21,
                          fit: BoxFit.scaleDown,
                          color: liked == false
                              ? Colors.white
                              : Color.fromARGB(255, 228, 15, 15))),
                  const SizedBox(width: 3),
                  const Text(
                    "20",
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(width: 30),
                  GestureDetector(
                      onTap: (() {
                        setState(() {
                          //  card_views.insert(currentQuote!, card_views[0]);
                          _cardController.addItem(card_views[0]);
                          print("inserted");

                          sample_quotes.clear();
                        });
                      }),
                      child: Icon(Icons.flip_to_back,
                          size: 30, color: Colors.white)),
                  Text(
                    "20",
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  GestureDetector(
                      onTap: (() {
                        setState(() {
                          //  card_views.insert(currentQuote!, card_views[0]);
                          _cardController.addItem(card_views[0]);
                          print("inserted");

                          sample_quotes.clear();
                        });
                      }),
                      child: Icon(Icons.share, size: 30, color: Colors.white)),
                  Text(
                    "20",
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  SvgPicture.asset("assets/svg/quill-writer-svgrepo-com.svg",
                      height: 21,
                      width: 21,
                      fit: BoxFit.scaleDown,
                      color: Color.fromARGB(255, 255, 255, 255))
                ]),
            SizedBox()
          ])),
    );
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
