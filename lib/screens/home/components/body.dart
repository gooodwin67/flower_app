import 'package:flower_app/constants.dart';
import 'package:flower_app/screens/home/components/featured.dart';
import 'package:flower_app/screens/home/components/head.dart';
import 'package:flower_app/screens/home/components/recomended.dart';
import 'package:flutter/material.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          HomeScreenHead(size: size),
          HeadRow(text: 'Recomended'),
          HomeScreenRecomended(),
          HeadRow(text: 'Features Flowers'),
          HomeScreenFeatured(),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}

class HeadRow extends StatelessWidget {
  final String text;
  const HeadRow({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MainHead(text: text),
          MainBtn(),
        ],
      ),
    );
  }
}

class MainBtn extends StatelessWidget {
  const MainBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(kPrimaryColor),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(36),
          ),
        ),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(horizontal: 20),
        ),
      ),
      child: Text('More'),
    );
  }
}

class MainHead extends StatelessWidget {
  final String text;
  const MainHead({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          bottom: 2,
          height: 5,
          child: Container(
            margin: EdgeInsets.only(right: 3),
            color: kPrimaryColor.withOpacity(0.3),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 3),
          child: Text(
            '$text',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
