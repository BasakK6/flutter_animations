import 'package:flutter/material.dart';
import 'package:flutter_animations/features/set_state_animations/set_state_animation_page.dart';
import 'package:flutter_animations/project/constants.dart';
import 'package:flutter_animations/project/context_extension.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  void goToPage(BuildContext context, {required Widget newPage}) {
    context.navigation.pushReplacement(MaterialPageRoute(builder: (context) {
      return newPage;
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          buildDrawerHeader(context),
          buildSetStateAnimationNavigations(context),
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

  ExpansionTile buildSetStateAnimationNavigations(BuildContext context) {
    return buildDrawerItemContainer(
            title: "setState Animations",
            iconData: Icons.star,
            children: [
              buildDrawerItem(
                  title: "Right to Left Movement",
                  onTap: () {
                    goToPage(
                      context,
                      newPage: const SetStateAnimationPage(
                          left: true,
                          top: false,
                          right: false,
                          message: "I go Right and then Left"),
                    );
                  }),
              buildDrawerItem(
                  title: "Down to Up Movement",
                  onTap: () {
                    goToPage(
                      context,
                      newPage: const SetStateAnimationPage(
                          left: false,
                          top: true,
                          right: false,
                          message: "I go Down and then Up"),
                    );
                  }),
              buildDrawerItem(
                  title: "Main Diagonal Movement",
                  onTap: () {
                    goToPage(
                      context,
                      newPage: const SetStateAnimationPage(
                          left: true,
                          top: true,
                          right: false,
                          message: "I go Down Right and then Up Left"),
                    );
                  }),
              buildDrawerItem(
                  title: "Anti Diagonal Movement",
                  onTap: () {
                    goToPage(
                      context,
                      newPage: const SetStateAnimationPage(
                          left: false,
                          top: true,
                          right: true,
                          message: "I go Down Left and then Up Right"),
                    );
                  }),
            ]);
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
