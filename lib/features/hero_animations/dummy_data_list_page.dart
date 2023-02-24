import 'package:flutter/material.dart';
import 'package:flutter_animations/app_drawer.dart';
import 'package:flutter_animations/core/context_extensions.dart';
import 'package:flutter_animations/features/hero_animations/dummy_data_detail_page.dart';
import 'package:flutter_animations/features/hero_animations/repository/dummy_data_repository.dart';

class DummyDataListPage extends StatelessWidget {
  DummyDataListPage({Key? key}) : super(key: key);

  final DummyDataRepository repository = DummyDataRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const AppDrawer(),
      body: ListView.builder(
          itemCount: repository.dummyDataList.length,
          itemBuilder: (context, index) {
            return DummyDataCard(
              dummyData: repository.dummyDataList[index],
              index: index,
            );
          }),
    );
  }
}

class DummyDataCard extends StatelessWidget {
  const DummyDataCard({required this.dummyData, required this.index, Key? key})
      : super(key: key);
  final DummyData dummyData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: SizedBox(
          width: 50,
          height: 50,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Hero(
              tag: "Hero-Image-$index",
              child: Image.network(
                dummyData.imageUrl,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        title: Hero(
          tag: "Hero-Title-$index",
          child: Material(
            color: Colors.transparent,
            child: Text(dummyData.title),
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.arrow_forward),
          onPressed: () {
            context.navigation.push(MaterialPageRoute(builder: (context) {
              return DummyDataDetailPage(dummyData: dummyData, index: index);
            }));
          },
        ),
      ),
    );
  }
}
