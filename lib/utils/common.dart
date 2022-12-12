import 'package:flutter/material.dart';

class Common {
  static EdgeInsets paddingBase(BoxConstraints constraints,
          {double gap = 300}) =>
      EdgeInsets.symmetric(horizontal: constraints.maxWidth > 1100 ? gap : 0);

  static snackBar(BuildContext context, {String text = "Coming Soon"}) =>
      SnackBar(
        backgroundColor: Colors.black,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 50,
          right: 20,
          left: 20,
        ),
        content: Text(text),
        action: SnackBarAction(
          label: "Close",
          textColor: Colors.white,
          onPressed: () {},
        ),
      );

  static Widget loadingWidget = const Center(
    child: CircularProgressIndicator(
      color: Colors.black,
    ),
  );
}
