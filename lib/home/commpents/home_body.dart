import 'package:c_guy_music_flutter/home/commpents/home_left_menu_box.dart';
import 'package:c_guy_music_flutter/home/widgets/audio_cover_widget.dart';
import 'package:c_guy_music_flutter/home/widgets/c_guy_music_logo.dart';
import 'package:c_guy_music_flutter/page/clean/clean_page.dart';
import 'package:c_guy_music_flutter/page/home/home_page.dart';
import 'package:c_guy_music_flutter/resource/assets.gen.dart';
import 'package:c_guy_music_flutter/welcome/page/welcome_page.dart';
import 'package:c_guy_music_flutter/widget/background/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:window_manager/window_manager.dart';
/**
 * @Author Cheng Pan
 * @Data 2024/8/21.
 */

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  var _currentMenu = 0;

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Stack(
        fit: StackFit.expand,
        children: [
          const Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: SizedBox(
              height: 80,
              child: DragToMoveArea(
                child: SizedBox(),
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    HomeLeftMenuBox(
                      onTap: (index) {
                        setState(() {
                          _currentMenu = index;
                        });
                      },
                    ),
                    Expanded(
                      child: Container(
                        color: const Color(0xFF0E121A),
                        child: Builder(
                          builder: (context) {
                            switch (_currentMenu) {
                              case 0:
                                return const WelcomePage();
                              case 1:
                                return Center(
                                  child: CGuyMusicLogo(
                                    logo: Assets.images.cGuyLogo.path,
                                    logoSize: 200,
                                  ),
                                );
                              case 2:
                                return const HomePage();
                              default:
                                return const SizedBox();
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const HomeBottomBox()
            ],
          )
        ],
      ),
    );
  }
}

class HomeBottomBox extends StatelessWidget {
  const HomeBottomBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      color: const Color(0xFF202530),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 18),
      height: 100,
      child: Row(
        children: [
          AudioCoverWidget(image: Image.asset(Assets.images.test.path)),
          const SizedBox(width: 20),
          const SizedBox(
            width: 199,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '樱花树下的约定',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  '旺仔小乔·2022翻唱',
                  style: TextStyle(
                    color: Color(0xFF596675),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 1,
            height: 40,
            color: const Color(0xFFE4EBF2),
          ),
          Container(
            width: 30,
            height: 30,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 50),
            child: SvgPicture.asset(
              'images/home/ic_bottom_box_previous.svg',
              width: 20,
              height: 20,
              fit: BoxFit.contain,
            ),
          ),
          Container(
            width: 50,
            height: 50,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Color(0xFF181C25),
                  Color(0xFF202530),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            margin: const EdgeInsets.only(left: 50),
            child: SvgPicture.asset(
              'images/home/ic_bottom_box_play.svg',
              width: 20,
              height: 20,
              fit: BoxFit.contain,
            ),
          ),
          Container(
            width: 30,
            height: 30,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 50),
            child: SvgPicture.asset(
              'images/home/ic_bottom_box_next.svg',
              width: 20,
              height: 20,
              fit: BoxFit.contain,
            ),
          ),
          Container(width: 50),
        ],
      ),
    );
  }
}
