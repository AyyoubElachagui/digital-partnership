import 'package:digital_partnership_group/app/pages/home_page/views/favourite_view/favourite_view.dart';
import 'package:digital_partnership_group/app/pages/home_page/views/home_view/home_view.dart';
import 'package:digital_partnership_group/app/pages/home_page/views/offer_view/offer_view.dart';
import 'package:digital_partnership_group/app/pages/home_page/views/profile_view/profile_view.dart';
import 'package:digital_partnership_group/app/pages/home_page/views/wallet_view/wallet_view.dart';
import 'package:digital_partnership_group/app/pages/home_page/widgets/bottom_navigation_bar.dart';
import 'package:digital_partnership_group/app/pages/home_page/widgets/custom_drawer.dart';
import 'package:digital_partnership_group/app/routing/navigation_service.dart';
import 'package:digital_partnership_group/app/routing/routes.dart';
import 'package:digital_partnership_group/app/utils/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  int currentIndex = 0;

  NavigationService get navigationService =>
      Provider.of<NavigationService>(context, listen: false);

  List<Widget> pages = [
    HomeView(),
    FavouriteView(),
    WalletView(),
    OfferView(),
    ProfileView(),
  ];

  List<String> titles = ['', 'Favourite', '', 'Offer', 'Profile'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: CustomDrawer(
        globalKey: _key,
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              PageView(
                controller: pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: pages,
              ),
              Positioned(
                bottom: 0,
                child: BottomNavigationBarWidget(
                  indexSelected: (index) {
                    setState(() {
                      currentIndex = index;
                      pageController.animateToPage(
                        currentIndex,
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.easeInOut,
                      );
                    });
                  },
                ),
              ),
              Positioned(
                top: 20,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => _key.currentState?.openDrawer(),
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: ColorPalette.kGreen,
                          ),
                          child: Icon(Icons.menu),
                        ),
                      ),
                      if (currentIndex == 0 || currentIndex == 2) ...[
                        InkWell(
                          onTap: () {
                            navigationService.navigateTo(
                                routeName: Routes.notificationView);
                          },
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: ColorPalette.white,
                            ),
                            child: Icon(Icons.notifications_none),
                          ),
                        ),
                      ],
                      if (currentIndex == 1 ||
                          currentIndex == 3 ||
                          currentIndex == 4) ...[
                        Text(
                          titles[currentIndex],
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: ColorPalette.textPrimaryColor),
                        ),
                        SizedBox(),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
