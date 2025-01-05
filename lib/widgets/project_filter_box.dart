part of 'widgets.dart';

class ProjectFilterBox extends StatelessWidget {
  final BoxConstraints constraints;
  const ProjectFilterBox({super.key, required this.constraints});

  @override
  Widget build(BuildContext context) {
    List<Widget> listWidgetRow = [
      Expanded(
        child: TextField(
          onChanged: (value) {
            context.read<ProjectProvider>().onSearch(value);
          },
          decoration: const InputDecoration(
            hintText: "Find a Project..",
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFF000000),
                width: 1.0,
                style: BorderStyle.solid,
              ),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFF000000),
                width: 1.0,
                style: BorderStyle.solid,
              ),
            ),
          ),
        ),
      ),
      const SizedBox(width: 16),
      const ProjectDropdownMenu(),
    ];

    return SizedBox(
      width: double.infinity,
      height: constraints.maxWidth <= 500 ? 100 : 50,
      child: Row(
        children: listWidgetRow,
      ),
    );
  }
}
