import 'dart:io';
import 'package:c_guy_music_flutter/home/page/home_page.dart';
import 'package:c_guy_music_flutter/page/clean/clean_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:window_manager/window_manager.dart';

class FramePage extends StatefulWidget {
  const FramePage({super.key});

  @override
  State<FramePage> createState() => _FramePageState();
}

class _FramePageState extends State<FramePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Navigator(
            key: Get.nestedKey(1),
            initialRoute: '/home',
            onGenerateRoute: onGenerateRoute,
          ),
          // 手机才显示右侧的系统按钮
          if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) ...{
            Positioned(
              top: 16,
              right: 16,
              child: IconButton(
                onPressed: () {
                  windowManager.close();
                },
                icon: const Icon(
                  Icons.close_rounded,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
          },
        ],
      ),
    );
  }

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return GetPageRoute(
          settings: settings,
          page: () => const HomePage(),
          transition: Transition.topLevel,
        );
      case '/clean':
        return GetPageRoute(
          settings: settings,
          page: () => const CleanPage(),
          transition: Transition.rightToLeftWithFade,
        );
      default:
        return null;
    }
  }
}
