import 'package:alfaridzi_me/data/models/dropdown_framework_menu.dart';
import 'package:alfaridzi_me/data/models/models.dart';
import 'package:flutter/foundation.dart';

class ProjectProvider with ChangeNotifier {
  String _inputSearch = "";
  bool _isSearchMode = false;
  final List<Project> _listOfProject = listProject;
  List<Project> _listOfSearchProject = listProject;
  DropdownFrameworkMenu _dropdownValue = listDropdownFrameworkMenu.first;

  final List<Project> _listOfFlutterProject = listProject
      .where((element) => element.technologies.contains("Flutter"))
      .toList();
  final List<Project> _listOfVueProject = listProject
      .where((element) => element.technologies.contains("Vue"))
      .toList();
  final List<DropdownFrameworkMenu> _listDropdownMenu =
      listDropdownFrameworkMenu;

  String get inputSearch => _inputSearch;
  List<DropdownFrameworkMenu> get listDropdownMenu => _listDropdownMenu;
  DropdownFrameworkMenu get dropdownValue => _dropdownValue;
  bool get isVue => dropdownValue.name == "Vue";
  bool get isFlutter => dropdownValue.name == "Flutter";
  bool get isAll => dropdownValue.name == "All";
  bool get isSearchMode => _isSearchMode;
  List<Project> get listOfSearchProject =>
      isSearchMode ? _listOfSearchProject : listOfProject;
  List<Project> get listOfProject => isAll
      ? listProject
      : isFlutter
          ? _listOfFlutterProject
          : isVue
              ? _listOfVueProject
              : _listOfProject;

  onDropdownMenuChange(DropdownFrameworkMenu? value) {
    _dropdownValue = value ?? listDropdownMenu.first;
    if (isSearchMode) {
      onSearch(inputSearch);
    }
    notifyListeners();
  }

  onSearch(String input) {
    debugPrint("Input: $input");
    _inputSearch = input;
    if (input.isNotEmpty) {
      _isSearchMode = true;
      _listOfSearchProject = listOfProject
          .where((element) =>
              element.projectName.toLowerCase().contains(input.toLowerCase()))
          .toList();
      notifyListeners();
    } else {
      _isSearchMode = false;
      notifyListeners();
    }
  }
}
