import 'dart:math';

import 'package:c_guy_music_flutter/home/commpents/clipper/cirque_clipper.dart';
import 'package:flutter/material.dart';

/**
 * @Author Cheng Pan
 * @Data 2024/8/21.
 */
class AudioCoverWidget extends StatefulWidget {
  final Image image;

  const AudioCoverWidget({super.key, required this.image});

  @override
  _AudioCoverWidgetState createState() => _AudioCoverWidgetState();
}

class _AudioCoverWidgetState extends State<AudioCoverWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat(); // 重复播放动画
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: _controller.value * 2 * pi, // 根据动画值旋转
          child: SizedBox(
            width: 60,
            height: 60,
            child: ClipPath(
              clipper: MyPathClipper(),
              child: widget.image,
            ),
          ),
        );
      },
    );
  }
}
