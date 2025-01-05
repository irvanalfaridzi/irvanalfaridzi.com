part of 'widgets.dart';

class ProjectDropdownMenu extends StatelessWidget {
  const ProjectDropdownMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFF000000),
            width: 1.0,
            style: BorderStyle.solid,
          ),
        ),
      ),
      child: DropdownButton<DropdownFrameworkMenu>(
        value: context.watch<ProjectProvider>().dropdownValue,
        elevation: 16,
        style: const TextStyle(color: Colors.black),
        itemHeight: 50,
        underline: const SizedBox(),
        onChanged: (DropdownFrameworkMenu? value) {
          context.read<ProjectProvider>().onDropdownMenuChange(value);
        },
        items: context
            .read<ProjectProvider>()
            .listDropdownMenu
            .map<DropdownMenuItem<DropdownFrameworkMenu>>(
          (DropdownFrameworkMenu value) {
            return DropdownMenuItem<DropdownFrameworkMenu>(
              value: value,
              alignment: Alignment.centerRight,
              child: Row(
                children: [
                  Image.asset(
                    "${Constant.techImages}${value.urlImage}",
                    height: 30,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(value.name),
                ],
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
