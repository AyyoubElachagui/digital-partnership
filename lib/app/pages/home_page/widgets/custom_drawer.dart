import 'package:digital_partnership_group/app/pages/home_page/widgets/custom_list_tile.dart';
import 'package:digital_partnership_group/app/utils/color_palette.dart';
import 'package:digital_partnership_group/app/utils/image_assets.dart';
import 'package:digital_partnership_group/app/widgets/back_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final GlobalKey<ScaffoldState> globalKey;
  const CustomDrawer({Key? key, required this.globalKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(
        color: ColorPalette.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BackButtonWidget(
                    onClickBack: () => globalKey.currentState?.closeDrawer(),
                  ),
                  Container(
                    width: 70,
                    height: 70,
                    margin: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(ImageAssets.avatarImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    'Nate Samson',
                    style: TextStyle(
                        fontSize: 18,
                        color: ColorPalette.textPrimaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'nate@email.con',
                    style: TextStyle(
                        fontSize: 12,
                        color: ColorPalette.textPrimaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            CustomListTile(
              onTap: () => globalKey.currentState?.closeDrawer(),
              icon: Icons.history,
              label: 'History',
            ),
            CustomListTile(
              onTap: () => globalKey.currentState?.closeDrawer(),
              icon: CupertinoIcons.chat_bubble_text,
              label: 'Complain',
            ),
            CustomListTile(
              onTap: () => globalKey.currentState?.closeDrawer(),
              icon: CupertinoIcons.person_3,
              label: 'Referral',
            ),
            CustomListTile(
              onTap: () => globalKey.currentState?.closeDrawer(),
              icon: Icons.error_outline,
              label: 'About Us',
            ),
            CustomListTile(
              onTap: () => globalKey.currentState?.closeDrawer(),
              icon: CupertinoIcons.settings,
              label: 'Settings',
            ),
            CustomListTile(
              onTap: () => globalKey.currentState?.closeDrawer(),
              icon: Icons.support_agent_outlined,
              label: 'Help and Support',
            ),
            CustomListTile(
              onTap: () => globalKey.currentState?.closeDrawer(),
              icon: Icons.logout,
              label: 'Logout',
              isLast: true,
            ),
          ],
        ),
      ),
    );
  }
}
