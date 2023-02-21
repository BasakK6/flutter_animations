import 'package:flutter/material.dart';
import 'package:flutter_animations/project/constants.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          buildDrawerHeader(context),
          buildDrawerItemContainer(
              title: "Animation Type 1",
              iconData: Icons.star,
              children: [
                buildDrawerItem(title: "item1", onTap: () {}),
                buildDrawerItem(title: "item2", onTap: () {}),
                buildDrawerItem(title: "item3", onTap: () {}),
                buildDrawerItem(title: "item4", onTap: () {}),
              ]),
          buildDrawerItemContainer(
              title: "Animation Type 2",
              iconData: Icons.star,
              children: [
                buildDrawerItem(title: "item1", onTap: () {}),
                buildDrawerItem(title: "item2", onTap: () {}),
                buildDrawerItem(title: "item3", onTap: () {}),
                buildDrawerItem(title: "item4", onTap: () {}),
              ]),
        ],
      ),
    );
  }

  ExpansionTile buildDrawerItemContainer({
    required String title,
    required IconData iconData,
    required List<Widget> children,
  }) {
    return ExpansionTile(
      title: Text(title),
      leading: Icon(iconData),
      children: children,
    );
  }

  ListTile buildDrawerItem(
      {required String title, required VoidCallback onTap}) {
    return ListTile(
      title: Text(title),
      onTap: onTap,
    );
  }

  DrawerHeader buildDrawerHeader(BuildContext context) {
    return DrawerHeader(
      decoration: const BoxDecoration(
        color: Color(0xFFD4606A),
      ),
      child: Column(
        children: const [
          Expanded(
            child: CircleAvatar(
              radius: 45,
              backgroundImage: AssetImage(Constants.profilePicturePath),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              Constants.drawerTitle,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
