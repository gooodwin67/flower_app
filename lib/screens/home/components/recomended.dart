import 'package:flower_app/constants.dart';
import 'package:flower_app/screens/detail/detail_screen.dart';
import 'package:flutter/material.dart';

final List<Flowers> listFlowers = <Flowers>[
  Flowers(
      image: Image.asset('assets/images/rec1.jpg'),
      imageFull: Image.asset('assets/images/full1.jpg'),
      name: 'Samantha',
      country: 'Russia',
      price: 400),
  Flowers(
      image: Image.asset('assets/images/rec2.jpg'),
      imageFull: Image.asset('assets/images/full2.jpg'),
      name: 'Angelica',
      country: 'Russia',
      price: 540),
  Flowers(
      image: Image.asset('assets/images/rec3.jpg'),
      imageFull: Image.asset('assets/images/full3.jpg'),
      name: 'Serena',
      country: 'Russia',
      price: 450),
];

class Flowers {
  final Image image;
  final Image imageFull;
  final String name;
  final String country;
  final int price;

  Flowers(
      {required this.image,
      required this.imageFull,
      required this.name,
      required this.country,
      required this.price});
}

List listFlowersWidgets = [];

class HomeScreenRecomended extends StatelessWidget {
  const HomeScreenRecomended({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      child: ListView.separated(
        itemCount: 3,
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) {
          return SizedBox(width: 20);
        },
        itemBuilder: (context, index) {
          return RecomendedBlock(
            image: listFlowers[index].image,
            imageFull: listFlowers[index].imageFull,
            name: listFlowers[index].name,
            country: listFlowers[index].country,
            price: listFlowers[index].price,
          );
        },
      ),
    );
  }
}

class RecomendedBlock extends StatelessWidget {
  final Image image;
  final Image imageFull;
  final String name;
  final String country;
  final int price;
  const RecomendedBlock({
    required this.image,
    required this.imageFull,
    Key? key,
    required this.name,
    required this.country,
    required this.price,
  }) : super(key: key);

  @override
  final int size = 240;

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(
                  imageFull: imageFull,
                  name: name,
                  country: country,
                  price: price),
            ));
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            height: size * 0.75,
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: FittedBox(
                fit: BoxFit.cover,
                child: image,
              ),
            ),
          ),
          Container(
            height: size * 0.25,
            width: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                color: Color.fromARGB(255, 255, 255, 255),
                boxShadow: [
                  BoxShadow(
                    color: kPrimaryColor.withOpacity(0.3),
                    offset: Offset(0, -37),
                    blurRadius: 65.0,
                  )
                ]),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 11),
              child: Stack(
                children: [
                  Text(
                    name.toUpperCase(),
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Text(
                      country.toUpperCase(),
                      style: TextStyle(
                        color: kPrimaryColor.withOpacity(0.6),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 10,
                    child: Text('\$$price',
                        style: TextStyle(
                            color: kPrimaryColor, fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
