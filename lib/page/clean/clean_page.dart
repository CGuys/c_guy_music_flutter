import 'dart:ui';

import 'package:c_guy_music_flutter/utils/shader_painter.dart';
import 'package:c_guy_music_flutter/widget/background/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:window_manager/window_manager.dart';

class CleanPage extends StatefulWidget {
  const CleanPage({super.key});

  @override
  State<CleanPage> createState() => _CleanPageState();
}

class _CleanPageState extends State<CleanPage> with SingleTickerProviderStateMixin {
  Ticker? _ticker;
  FragmentProgram? shaderProgram;
  final ValueNotifier<double> _elapsedTime = ValueNotifier(0.0);
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    final moonShaderProgram = await FragmentProgram.fromAsset('assets/shaders/moon.frag');
    shaderProgram = moonShaderProgram;
    setState(() {});
    _ticker = createTicker(_onTick)..start();
  }

  @override
  void dispose() {
    _ticker?.dispose();
    //_animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (shaderProgram == null) ...{
            const SizedBox(),
          } else ...{
            ValueListenableBuilder<double>(
              valueListenable: _elapsedTime,
              builder: (context, value, child) {
                return CustomPaint(
                  painter: ShaderPainter(
                    shader: shaderProgram!.fragmentShader(),
                    shaderSize: MediaQuery.of(context).size,
                    time: value,
                  ),
                );
              },
            ),
          },
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  "Lemon Cleaner",
                  style: TextStyle(
                    fontSize: 86,
                    fontFamily: "ITCAvantGarde",
                    color: Color(0xFFE5F0FF),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _ticker?.stop();
                  // _animationController.reset();
                  // _animationController.forward();
                  _ticker?.start();
                },
                child: Container(
                  width: 230,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      "开始扫描",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFFE2F4F6),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: SizedBox(
              height: 80,
              //color: Colors.amber,
              child: DragToMoveArea(
                child: SizedBox(),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.topLeft,
            child: BackButton(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  void _onTick(Duration elapsed) {
    _elapsedTime.value = _elapsedTime.value + 0.02;
  }
}
