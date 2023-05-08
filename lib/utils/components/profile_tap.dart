import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../app_colors.dart';

/**
 * @authors Jackie, Christoffer & Jakob
 */
class ProfileTap extends StatelessWidget {
  final String imagePath;
  final String profileName;

  const ProfileTap({
    Key? key,
    required this.imagePath,
    required this.profileName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        customButton: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(imagePath),
              ),
            ),
            Text(
              profileName,
              style: TextStyle(
                color: AppColors.lightGreyColor,
                fontSize: 18,
              ),
            ),
          ],
        ),
        items: [
          ...MenuItems.firstItems.map(
            (item) => DropdownMenuItem<MenuItem>(
              value: item,
              child: MenuItems.buildItem(item),
            ),
          ),
          const DropdownMenuItem<Divider>(
              enabled: false,
              child: Divider(
                color: AppColors.yellowColor,
              )),
          ...MenuItems.secondItems.map(
            (item) => DropdownMenuItem<MenuItem>(
              value: item,
              child: MenuItems.buildItem(item),
            ),
          ),
        ],
        onChanged: (value) {
          MenuItems.onChanged(context, value as MenuItem);
        },
        dropdownStyleData: DropdownStyleData(
          width: 160,
          padding: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: AppColors.darkGreyColor,
          ),
          elevation: 8,
          offset: const Offset(40, -4),
        ),
        menuItemStyleData: MenuItemStyleData(
          customHeights: [
            ...List<double>.filled(MenuItems.firstItems.length, 48),
            8,
            ...List<double>.filled(MenuItems.secondItems.length, 48),
          ],
          padding: const EdgeInsets.only(left: 16, right: 16),
        ),
      ),
    );
  }
}

class MenuItem {
  final String text;
  final IconData icon;

  const MenuItem({
    required this.text,
    required this.icon,
  });
}

class MenuItems {
  static const List<MenuItem> firstItems = [like, share];
  static const List<MenuItem> secondItems = [cancel];

  static const like = MenuItem(text: 'Indstillinger', icon: Icons.settings);
  static const share = MenuItem(text: 'FAQ', icon: Icons.share);
  static const cancel = MenuItem(text: 'Logud', icon: Icons.logout);

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Icon(
          item.icon,
          color: Colors.white,
          size: 22,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          item.text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  static onChanged(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.like:
        //Do something
        break;
      case MenuItems.share:
        //Do something
        break;
      case MenuItems.cancel:
        //Do something
        break;
    }
  }
}