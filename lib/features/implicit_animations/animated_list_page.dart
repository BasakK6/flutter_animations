import 'package:flutter/material.dart';

import 'package:flutter_animations/app_drawer.dart';
import 'package:flutter_animations/core/duration_items.dart';

class AnimatedListPage extends StatefulWidget {
  const AnimatedListPage({Key? key}) : super(key: key);

  @override
  State<AnimatedListPage> createState() => _AnimatedListPageState();
}

class _AnimatedListPageState extends State<AnimatedListPage> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  final Tween<Offset> _offset =
      Tween(begin: const Offset(1, 0), end: Offset.zero);

  List<String> listItems = [
    "Item 1",
    "Item 2",
    "Item 3",
    "Item 4",
    "Item 5",
    "Item 6",
  ];

  void removeFunction(int index) {
    listItems.removeAt(index);
    _listKey.currentState?.removeItem(index, (context, animation) {
      return SlideTransition(
        position: animation.drive(_offset),
        child: ItemCard(
          item: listItems[index],
          index: index,
          removeFunction: removeFunction,
        ),
      );
    }, duration: const DurationItems.durationLow());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AnimatedList (Implicit)"),
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  listItems.add("hello");
                  _listKey.currentState?.insertItem(listItems.length - 1,
                      duration: const DurationItems.durationLow());
                });
              },
              child: const Text("Add Item to End"),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: AnimatedList(
                key: _listKey,
                initialItemCount: listItems.length,
                itemBuilder: (context, index, animation) {
                  return  SlideTransition(
                          position: animation.drive(_offset),
                          child: ItemCard(
                            item: listItems[index],
                            index: index,
                            removeFunction: removeFunction,
                          ),
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({
    required this.item,
    required this.index,
    required this.removeFunction,
    super.key,
  });

  final String item;
  final int index;
  final Function(int index) removeFunction;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.star),
        title: Text(item),
        trailing: IconButton(
          onPressed: () {
            removeFunction(index);
          },
          icon: const Icon(Icons.delete),
        ),
      ),
    );
  }
}
