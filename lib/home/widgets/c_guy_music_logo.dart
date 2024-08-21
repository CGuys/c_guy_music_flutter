import 'package:flutter/material.dart';

/**
 * @Author Cheng Pan
 * @Data 2024/8/21.
 */
class CGuyMusicLogo extends StatelessWidget {
  const CGuyMusicLogo({
    super.key,
    required this.logo,
    this.logoSize,
    this.logoText,
    this.logoSubText,
  });

  final String logo;
  final double? logoSize;
  final String? logoText;
  final String? logoSubText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: logoSize ?? 50,
          height: logoSize ?? 50,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6.5),
            child: Image(
              image: AssetImage(logo),
            ),
          ),
        ),
        if (logoText != null || logoSubText != null)
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  logoText ?? "",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  logoSubText ?? "",
                  style: const TextStyle(
                    color: Color(0xFF596675),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
      ],
    );
  }
}
