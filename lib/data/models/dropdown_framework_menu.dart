class DropdownFrameworkMenu {
  final String name;
  final String urlImage;

  DropdownFrameworkMenu({required this.name, required this.urlImage});
}

List<DropdownFrameworkMenu> listDropdownFrameworkMenu = [
  DropdownFrameworkMenu(name: "All", urlImage: "flutter-vue.png"),
  DropdownFrameworkMenu(name: "Flutter", urlImage: "flutter.png"),
  DropdownFrameworkMenu(name: "Vue", urlImage: "vue.png"),
];
