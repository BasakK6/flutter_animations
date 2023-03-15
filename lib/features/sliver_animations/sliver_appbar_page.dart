import 'package:flutter/material.dart';
import 'package:flutter_animations/app_drawer.dart';
import 'package:flutter_animations/core/context_extensions.dart';

import 'package:flutter_animations/project/constants.dart';

class SliverAppBarPage extends StatelessWidget {
  const SliverAppBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: context.dynamicHeight(0.25),
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text("Sliver AppBar Animation"),
              centerTitle: true,
              background: Image.network(
                Constants.randomImagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              alignment: Alignment.center,
              height: context.dynamicHeight(0.1),
              child: const Text("This is how we use normal widgets with Slivers"),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.star),
                    title: Text("Item Number: ${index + 1}"),
                  ),
                );
              },
              childCount: 20,
            ),
          )
        ],
      ),
    );
  }
}
