import 'package:flutter/material.dart';
import 'package:flutter_animations/core/context_extensions.dart';
import 'package:flutter_animations/features/hero_animations/repository/dummy_data_repository.dart';

class DummyDataDetailPage extends StatelessWidget {
  const DummyDataDetailPage(
      {required this.dummyData, required this.index, Key? key})
      : super(key: key);

  final DummyData dummyData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: context.width,
              height: context.dynamicHeight(0.30),
              child: Hero(
                tag: "Hero-Image-$index",
                child: Image.network(
                  dummyData.imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Hero(
              tag: "Hero-Title-$index",
              child: Material(
                color: Colors.transparent,
                child: Text(
                  dummyData.title,
                  style: context.textTheme.titleMedium,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              dummyData.description,
              style: context.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
