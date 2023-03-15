import 'package:flutter/material.dart';
import 'package:flutter_animations/core/context_extensions.dart';
import 'package:flutter_animations/core/duration_items.dart';
import 'package:flutter_animations/home_page.dart';
import 'package:flutter_animations/project/constants.dart';

part 'components/bottom_navigation_bar.dart';

class SliverAppBarAndBottomNavBarAnimationPage extends StatefulWidget {
  const SliverAppBarAndBottomNavBarAnimationPage({Key? key}) : super(key: key);

  @override
  State<SliverAppBarAndBottomNavBarAnimationPage> createState() =>
      _SliverAppBarAndBottomNavBarAnimationPageState();
}

class _SliverAppBarAndBottomNavBarAnimationPageState
    extends State<SliverAppBarAndBottomNavBarAnimationPage> {
  bool _bodyIsScrolled = false;

  void _updateIsScrolled(bool value) {
    //Don't trigger setState unless it is necessary
    if (_bodyIsScrolled == value) {
      return;
    }
    //update the state variable
    Future.microtask(() => setState(() {
          _bodyIsScrolled = value;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, bodyIsScrolled) {
        _updateIsScrolled(bodyIsScrolled);
        return [buildSliverAppBar()];
      },
      body: Scaffold(
        body: buildListView(),
        bottomNavigationBar: AnimatedCrossFade(
          firstChild: const SizedBox.shrink(),
          secondChild: BottomNavigationBar(
            items: BottomNavigationDummyList().toWidgets(),
            onTap: (index) async {
              await context.navigation.pushReplacement(MaterialPageRoute(builder: (context) {
                return const HomePage();
              }));
            },
          ),
          crossFadeState: _bodyIsScrolled
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          duration: const DurationItems.durationLow(),
        ),
      ),
    );
  }

  ListView buildListView() {
    return ListView.builder(itemBuilder: (context, index) {
      return Card(
        child: ListTile(
          leading: const Icon(Icons.star),
          title: Text("Item Number: ${index + 1}"),
        ),
      );
    });
  }

  SliverAppBar buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: context.dynamicHeight(0.25),
      floating: true,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(_bodyIsScrolled
            ? "Body got Scrolled"
            : "Sliver AppBar&BottomNavBar"),
        centerTitle: true,
        background: Image.network(
          Constants.randomImagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
