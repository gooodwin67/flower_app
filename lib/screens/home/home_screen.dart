import 'package:flower_app/constants.dart';
import 'package:flower_app/screens/home/components/body.dart';

import 'package:flutter/material.dart';

class HomeScreenWidget extends StatelessWidget {
  const HomeScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        leading: IconButton(
            onPressed: () {}, icon: Image.asset('assets/images/menu.png')),
      ),
      body: HomeScreenBody(),
    );
  }
}
