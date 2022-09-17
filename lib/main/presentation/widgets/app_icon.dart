import 'package:code_union_test/core/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({Key? key, required this.name, this.size = 24.0, this.color = AppColors.black}) : super(key: key);

  final String name;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      name,
      color: color,
      alignment: Alignment.center,
      fit: BoxFit.cover,
      height: size,
      width: size,
      errorBuilder: (_, obj, stackTrace) => Icon(
        CupertinoIcons.exclamationmark_circle_fill,
        size: size,
        color: color,
      ),
    );
  }
}
