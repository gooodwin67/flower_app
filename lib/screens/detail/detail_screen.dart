import 'package:flower_app/constants.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class DetailScreen extends StatelessWidget {
  final Image imageFull;
  final String name, country;
  final int price;
  const DetailScreen({
    Key? key,
    required this.imageFull,
    required this.name,
    required this.country,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var padding = MediaQuery.of(context).viewPadding;
    final Size size = MediaQuery.of(context).size;
    final double height = size.height - padding.top - padding.bottom;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: height * 0.70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: size.width * 0.25,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: 56,
                              height: 56,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Transform.rotate(
                                  angle: math.pi,
                                  child: Icon(
                                    Icons.arrow_right_alt,
                                    size: 30,
                                    color: Colors.black.withOpacity(0.6),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          DetailScreenIcon(
                              image: Image.asset('assets/images/sun.png')),
                          DetailScreenIcon(
                              image: Image.asset('assets/images/temp.png')),
                          DetailScreenIcon(
                              image: Image.asset('assets/images/water.png')),
                          DetailScreenIcon(
                              image: Image.asset('assets/images/wind.png')),
                        ],
                      ),
                    ),
                    Container(
                      width: size.width * 0.75,
                      height: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: kPrimaryColor.withOpacity(0.17),
                              offset: Offset(0, 15),
                              blurRadius: 22,
                            ),
                          ]),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                        ),
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: imageFull,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: height * 0.025),
              DetailScreenDesc(
                  height: height, name: name, price: price, country: country),
              SizedBox(height: height * 0.025),
              Container(
                height: height * 0.1,
                child: Row(
                  children: [
                    Container(
                      width: size.width / 2,
                      height: double.infinity,
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(30)),
                        child: MaterialButton(
                          onPressed: () {},
                          color: kPrimaryColor,
                          child: Text(
                            'Buy Now',
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: size.width / 2,
                      height: 60,
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(30)),
                        child: MaterialButton(
                          onPressed: () {},
                          child: Text(
                            'Description',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.7),
                                fontSize: 17),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DetailScreenDesc extends StatelessWidget {
  final double height;
  final String name;
  final int price;
  final String country;
  const DetailScreenDesc({
    Key? key,
    required this.height,
    required this.name,
    required this.price,
    required this.country,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.15,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  '$name',
                  style: const TextStyle(
                    color: Color(0xFF1D1D1D),
                    fontSize: 33,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Text(
                  '\$$price',
                  style: const TextStyle(
                    color: kPrimaryColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 7),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '$country',
                style: TextStyle(
                  color: kPrimaryColor.withOpacity(0.7),
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailScreenIcon extends StatelessWidget {
  final Image image;
  const DetailScreenIcon({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
          color: kBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: kPrimaryColor.withOpacity(0.22),
              offset: Offset(0, 15),
              blurRadius: 22,
            ),
            const BoxShadow(
              color: Colors.white,
              offset: Offset(-15, -15),
              blurRadius: 20,
            ),
          ]),
      child: image,
    );
  }
}
