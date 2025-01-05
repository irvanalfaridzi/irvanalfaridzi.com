part of 'widgets.dart';

class ProjectFilterChip extends StatelessWidget {
  final double height;
  final String urlImage;
  final String text;
  final Function(bool)? onSelected;
  final bool selected;
  const ProjectFilterChip({
    super.key,
    this.height = 30,
    required this.urlImage,
    required this.text,
    required this.onSelected,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Row(
        children: [
          Image.asset(
            "${Constant.techImages}$urlImage",
            height: height,
          ),
          const SizedBox(
            width: 4,
          ),
          Text(text),
        ],
      ),
      onSelected: onSelected,
      selected: selected,
      showCheckmark: true,
      checkmarkColor: Colors.white,
      selectedColor: Colors.black,
      backgroundColor: Colors.white,
      labelStyle: TextStyle(
        color: selected ? Colors.white : Colors.black,
      ),
      elevation: 2,
      padding: const EdgeInsets.all(8),
    );
  }
}
