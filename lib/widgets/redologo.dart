import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:redo/assets/colors/colors.dart';

Widget redoLogo(BuildContext context, double scale, bool hasShadow) {
  double containerSize = MediaQuery.of(context).size.width * scale;
  double logoSize = containerSize * 0.8;
  double borderRadiusRatio = 0.1;
  return Container(
    decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(containerSize * borderRadiusRatio),
        boxShadow: hasShadow
            ? [
                BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 0,
                    blurRadius: 10,
                    offset: const Offset(2, 4))
              ]
            : null),
    padding: EdgeInsets.all(containerSize * 0.1),
    width: containerSize,
    height: containerSize,
    child: Center(
      child: SvgPicture.asset(
        'lib/assets/images/REDO Logo(White).svg',
        width: logoSize,
        height: logoSize,
        fit: BoxFit.contain,
      ),
    ),
  );
}
