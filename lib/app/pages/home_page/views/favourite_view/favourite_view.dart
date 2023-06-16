import 'package:digital_partnership_group/app/pages/home_page/views/favourite_view/widgets/card_favourite.dart';
import 'package:flutter/material.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.fromLTRB(20, 80, 20, 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ...List.generate(10, (index) => CardFavourite()).toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
