part of 'widgets.dart';

enum ButtonMode { blackTheme, whiteTheme }

class MyMainButton extends StatelessWidget {
  final Widget child;
  final ButtonMode buttonMode;
  final Function onTap;
  final double width;
  final double height;
  const MyMainButton({
    super.key,
    this.buttonMode = ButtonMode.blackTheme,
    required this.onTap,
    required this.child,
    this.width = 230,
    this.height = 60,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        onPressed: () {
          onTap();
        },
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            buttonMode == ButtonMode.blackTheme
                ? Colors.black
                : Colors.grey[100],
          ),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ),
        child: child,
      ),
    );
  }
}
