part of 'widgets.dart';

class MySecondaryButton extends StatelessWidget {
  final String text;
  final Function onTap;
  final FontWeight fontWeight;
  final double fontSize;
  const MySecondaryButton({
    super.key,
    required this.text,
    required this.onTap,
    this.fontWeight = FontWeight.bold,
    this.fontSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onTap();
      },
      style: ButtonStyle(
        splashFactory: InkSplash.splashFactory,
        overlayColor: WidgetStateProperty.all(Colors.grey.withOpacity(0.5)),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: Colors.black,
        ),
      ),
    );
  }
}
