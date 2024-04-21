import 'package:flutter/material.dart';
import '../data/colors.dart';
import '../data/size_config.dart';
import '../data/styles.dart';

class CommonBtn extends StatelessWidget {
  final String btnName;
  final Function() onPressed;
  double? radius;
  double? height;
  double? width;
  double? textSize;

  CommonBtn({
    Key? key,
    required this.btnName,
    required this.onPressed,
    this.radius,
    this.height,
    this.width,
    this.textSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(),
      child: Container(
        height: height != null ? height! : 50,
        width: width != null ? width! : double.infinity,
        decoration: BoxDecoration(
          gradient: appGradient,
          borderRadius:
              BorderRadius.circular( radius?? cornerRadius),
        ),
        child: Center(
          child: Text(
            btnName,
            textAlign: TextAlign.center,
            style: fontSemiBoldStyle(
                color: whiteColor, fontSize: textSize ?? btnFontSize),
          ),
        ),
      ),
    );
  }
}
