// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, file_names

////////////////////////////////////////////
///follow For more ig: @Countrol4offical
///@countrolfour@gmail.com
////////////////////////////////////////////
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class Furnitures extends StatefulWidget {
  const Furnitures({Key? key}) : super(key: key);

  @override
  _FurnituresState createState() => _FurnituresState();
}

class _FurnituresState extends State<Furnitures> with TickerProviderStateMixin {
  final List<dynamic> _furnitures = [
    {
      'title': 'Modern \nBed Desing',
      'sub_title': 'Choose From Thousands Of Items That Fits Your Choice.',
      'image':
          'https://i.pinimg.com/originals/c6/3f/f2/c63ff2429b732cbc4873f0cc5c7f02a3.jpg'
    },
    {
      'title': 'Modern \nBed Desing',
      'sub_title': 'Choose From Thousands Of Items That Fits Your Choice.',
      'image':
          'https://images.squarespace-cdn.com/content/v1/5ce56c992a52ef0001811af5/1566201048752-MU7ERY5DVIABVASMR5BG/master+bedroom+ideas+-+design+trends+2020'
    },
    {
      'title': 'Modern \nBed Desing',
      'sub_title': 'Choose From Thousands Of Items That Fits Your Choice.',
      'image':
          'https://i.pinimg.com/736x/a5/02/ee/a502ee02db2c8285a876d436d987a8d1.jpg'
    },
    {
      'title': 'Modern \nBed Desing',
      'sub_title': 'Choose From Thousands Of Items That Fits Your Choice.',
      'image':
          'https://i.pinimg.com/736x/c6/4a/e9/c64ae901957cc8206ef7628af956575c.jpg'
    }
  ];

  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 20), vsync: this)
        ..repeat(reverse: true);

  late final Animation<double> _animation = Tween<double>(begin: 1.0, end: 1.5)
      .animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        onPageChanged: (int index) {
          _controller.value = 0.0;
          _controller.forward();
        },
        itemBuilder: (context, index) {
          return Container(
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(),
                  child: ScaleTransition(
                    scale: _animation,
                    child: Image.network(
                      _furnitures[index]['image'],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                      padding: EdgeInsets.all(20),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              colors: [
                            Colors.black.withOpacity(0.9),
                            Colors.black.withOpacity(0.9),
                            Colors.black.withOpacity(0.2),
                            Colors.black.withOpacity(0.1)
                          ])),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FadeInDown(
                              duration: Duration(milliseconds: 1500),
                              child: Text(
                                _furnitures[index]['title'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 42,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            FadeInDown(
                                delay: Duration(milliseconds: 1500),
                                duration: Duration(milliseconds: 1000),
                                child: Text(
                                  _furnitures[index]['sub_title'],
                                  style: TextStyle(
                                    color: Colors.grey.shade400,
                                    fontSize: 18,
                                  ),
                                )),
                            SizedBox(
                              height: 50,
                            ),
                            FadeInLeft(
                              delay: Duration(milliseconds: 600),
                              duration: Duration(milliseconds: 5000),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: MaterialButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    onPressed: () {},
                                    color: Colors.white,
                                    padding: EdgeInsets.only(
                                        right: 5, left: 30, top: 5, bottom: 5),
                                    child: Container(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: Row(
                                        children: [
                                          Text(
                                            'Get Started',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                            ),
                                          ),
                                          Spacer(),
                                          Container(
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          40)),
                                              child: Icon(
                                                Icons.arrow_forward,
                                                color: Colors.orange.shade100,
                                              )),
                                        ],
                                      ),
                                    )),
                              ),
                            ),
                            SizedBox(height: 50),
                          ])),
                )
              ],
            ),
          );
        },
        itemCount: _furnitures.length,
        controller: PageController(viewportFraction: 1.0),
      ),
    );
  }
}
