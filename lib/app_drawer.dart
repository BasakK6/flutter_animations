import 'package:flutter/material.dart';
import 'package:flutter_animations/core/context_extensions.dart';
import 'package:flutter_animations/features/explicit_animations/alignment_change_page.dart';
import 'package:flutter_animations/features/explicit_animations/animated_icon_page.dart';
import 'package:flutter_animations/features/explicit_animations/size_change_page.dart';
import 'package:flutter_animations/features/explicit_animations/vertical_movement_page.dart';
import 'package:flutter_animations/features/hero_animations/dummy_data_list_page.dart';
import 'package:flutter_animations/features/implicit_animations/animated_container_page.dart';
import 'package:flutter_animations/features/implicit_animations/animated_cross_fade_page.dart';
import 'package:flutter_animations/features/implicit_animations/animated_default_textstyle_page.dart';
import 'package:flutter_animations/features/implicit_animations/animated_list_page.dart';
import 'package:flutter_animations/features/implicit_animations/animated_opacity_page.dart';
import 'package:flutter_animations/features/implicit_animations/animated_padding_page.dart';
import 'package:flutter_animations/features/implicit_animations/animated_positioned_page.dart';
import 'package:flutter_animations/features/implicit_animations/animated_rotation_page.dart';
import 'package:flutter_animations/features/implicit_animations/animation_in_future_builder_page.dart';
import 'package:flutter_animations/features/set_state_animations/set_state_animation_page.dart';
import 'package:flutter_animations/features/sliver_animations/sliver_appbar_and_bottomnavbar_animation.dart';
import 'package:flutter_animations/features/sliver_animations/sliver_appbar_page.dart';
import 'package:flutter_animations/features/third_party_animations/lottie_animations/lottie_animation_page.dart';
import 'package:flutter_animations/project/constants.dart';

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
          buildSetStateAnimationsMenu(context),
          buildImplicitAnimationsMenu(context),
          buildHeroAnimationsMenu(context),
          buildExplicitAnimationsMenu(context),
          buildThirdPartyAnimationsMenu(context),
          buildSliverAnimationsMenu(context)
        ],
      ),
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

  ExpansionTile buildSetStateAnimationsMenu(BuildContext context) {
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

  ExpansionTile buildImplicitAnimationsMenu(BuildContext context) {
    return buildDrawerItemContainer(
      title: "Implicit Animations",
      iconData: Icons.star,
      children: [
        buildDrawerItem(
            title: "Animated Padding",
            onTap: () {
              goToPage(
                context,
                newPage: const AnimatedPaddingPage(),
              );
            }),
        buildDrawerItem(
            title: "Animated Container",
            onTap: () {
              goToPage(
                context,
                newPage: const AnimatedContainerPage(),
              );
            }),
        buildDrawerItem(
            title: "Animated Positioned",
            onTap: () {
              goToPage(
                context,
                newPage: const AnimatedPositionedPage(),
              );
            }),
        buildDrawerItem(
            title: "Animated CrossFade",
            onTap: () {
              goToPage(
                context,
                newPage: const AnimatedCrossFadePage(),
              );
            }),
        buildDrawerItem(
            title: "Animated Opacity",
            onTap: () {
              goToPage(
                context,
                newPage: const AnimatedOpacityPage(),
              );
            }),
        buildDrawerItem(
            title: "Animated DefaultTextStyle",
            onTap: () {
              goToPage(
                context,
                newPage: const AnimatedDefaultTextStylePage(),
              );
            }),
        buildDrawerItem(
            title: "Animated Rotation",
            onTap: () {
              goToPage(
                context,
                newPage: const AnimatedRotationPage(),
              );
            }),
        buildDrawerItem(
            title: "Animated List",
            onTap: () {
              goToPage(
                context,
                newPage: const AnimatedListPage(),
              );
            }),
        buildDrawerItem(
            title: "Animation in FutureBuilder",
            onTap: () {
              goToPage(
                context,
                newPage: const AnimationInFutureBuilderPage(),
              );
            }),
      ],
    );
  }

  ExpansionTile buildHeroAnimationsMenu(BuildContext context) {
    return buildDrawerItemContainer(
        title: "Hero Animations",
        iconData: Icons.star,
        children: [
          buildDrawerItem(
              title: "List View - Detail View Transition",
              onTap: () {
                goToPage(
                  context,
                  newPage: DummyDataListPage(),
                );
              }),
        ]);
  }

  ExpansionTile buildExplicitAnimationsMenu(BuildContext context) {
    return buildDrawerItemContainer(
        title: "Explicit Animations",
        iconData: Icons.star,
        children: [
          buildDrawerItem(
              title: "Vertical Movement",
              onTap: () {
                goToPage(
                  context,
                  newPage: const VerticalMovementPage(),
                );
              }),
          buildDrawerItem(
              title: "Animated Icon",
              onTap: () {
                goToPage(
                  context,
                  newPage: const AnimatedIconPage(),
                );
              }),
          buildDrawerItem(
              title: "Size Change",
              onTap: () {
                goToPage(
                  context,
                  newPage: const SizeChangePage(),
                );
              }),
          buildDrawerItem(
              title: "Alignment Change",
              onTap: () {
                goToPage(
                  context,
                  newPage: const AlignmentChangePage(),
                );
              }),
        ]);
  }

  ExpansionTile buildThirdPartyAnimationsMenu(BuildContext context) {
    return buildDrawerItemContainer(
      title: "Third Party Animations",
      iconData: Icons.star,
      children: [
        buildDrawerItem(
          title: "Lottie Animations",
          onTap: () {
            goToPage(
              context,
              newPage: const LottieAnimationPage(),
            );
          },
        ),
      ],
    );
  }

  ExpansionTile buildSliverAnimationsMenu(BuildContext context) {
    return buildDrawerItemContainer(
        title: "Sliver Animations",
        iconData: Icons.star,
        children: [
          buildDrawerItem(
              title: "Sliver AppBar",
              onTap: () {
                goToPage(
                  context,
                  newPage: const SliverAppBarPage(),
                );
              }),
          buildDrawerItem(
            title: "Sliver AppBar and BottomNavBar Animation",
            onTap: () {
              goToPage(context,
                  newPage:
                  const SliverAppBarAndBottomNavBarAnimationPage());
            },
          ),
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
}
