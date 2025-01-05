part of 'widgets.dart';

class MyMenuButton extends StatelessWidget {
  final String text;
  final Function onTap;
  final bool isSelected;
  const MyMenuButton({
    super.key,
    required this.text,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onTap();
      },
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          isSelected ? Colors.white : Colors.transparent,
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
