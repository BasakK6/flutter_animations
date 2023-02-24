class DummyDataRepository {
  final List<DummyData> dummyDataList = [
    DummyData(
      title: "Title 1",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      imageUrl: "https://picsum.photos/200",
    ),
    DummyData(
      title: "Title 2",
      description:
          "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      imageUrl: "https://picsum.photos/300",
    ),
    DummyData(
      title: "Title 3",
      description:
          "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
      imageUrl: "https://picsum.photos/100",
    ),
    DummyData(
      title: "Title 4",
      description:
          "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      imageUrl: "https://picsum.photos/200/300",
    ),
    DummyData(
      title: "Title 5",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      imageUrl: "https://picsum.photos/200/600",
    ),
    DummyData(
      title: "Title 6",
      description:
          "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      imageUrl: "https://picsum.photos/200/400",
    ),
    DummyData(
      title: "Title 7",
      description:
          "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
      imageUrl: "https://picsum.photos/300/400",
    ),
    DummyData(
      title: "Title 8",
      description:
          "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      imageUrl: "https://picsum.photos/300/200",
    ),
  ];
}

class DummyData {
  String title;
  String description;
  String imageUrl;

  DummyData(
      {required this.title, required this.description, required this.imageUrl});
}
