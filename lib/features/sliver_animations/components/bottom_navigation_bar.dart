part of "../sliver_appbar_and_bottomnavbar_animation.dart";

class BottomNavigationModel {
  final IconData icon;
  final String title;

  BottomNavigationModel({required this.icon, required this.title});
}

class BottomNavigationDummyList {
  late final List<BottomNavigationModel> _items;

  BottomNavigationDummyList() {
    _items = [
      BottomNavigationModel(icon: Icons.favorite, title: "First"),
      BottomNavigationModel(icon: Icons.ac_unit, title: "Second"),
      BottomNavigationModel(icon: Icons.accessibility_rounded, title: "Third"),
    ];
  }

  List<BottomNavigationBarItem> toWidgets() {
    return _items
        .map((e) => BottomNavigationBarItem(
              icon: Icon(e.icon),
              label: e.title,
            ))
        .toList();
  }
}
