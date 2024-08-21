import 'package:c_guy_music_flutter/home/widgets/c_guy_music_logo.dart';
import 'package:c_guy_music_flutter/resource/assets.gen.dart';
import 'package:flutter/material.dart';

/**
 * @Author Cheng Pan
 * @Data 2024/8/21.
 */
class _PopMenuModel {
  final String title;
  final SvgGenImage icon;

  _PopMenuModel({
    required this.title,
    required this.icon,
  });
}

class HomeLeftMenuBox extends StatefulWidget {
  const HomeLeftMenuBox({
    super.key,
    required this.onTap,
  });

  final Function(int cyrrentMenu) onTap;

  @override
  State<HomeLeftMenuBox> createState() => _HomeLeftMenuBoxState();
}

class _HomeLeftMenuBoxState extends State<HomeLeftMenuBox> {
  final List<_PopMenuModel> _menuList = [
    _PopMenuModel(title: '首页', icon: Assets.images.home.icHomeMenu),
    _PopMenuModel(title: '歌单', icon: Assets.images.home.icHomeMenuPlaylists),
    _PopMenuModel(title: '歌手', icon: Assets.images.home.icHomeMenuSinger),
    _PopMenuModel(title: 'MV', icon: Assets.images.home.icHomeMenuMv),
    _PopMenuModel(title: '排行', icon: Assets.images.home.icHomeMenuRanking),
    _PopMenuModel(title: '最新音乐', icon: Assets.images.home.icHomeMenuNew),
  ];

  var _currentMenu = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 299,
      color: const Color(0xFF181C25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 40, left: 40, right: 40),
            child: const CGuyMusicLogo(
              logo: 'images/c_guy_music_logo.png',
              logoText: 'C-Guy Music',
              logoSubText: '专注于音乐的播放器',
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 45),
            child: ListView.builder(
              itemCount: _menuList.length,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                final menu = _menuList[index];
                return TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.transparent,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: const RoundedRectangleBorder(),
                  ),
                  onPressed: () {
                    setState(() {
                      _currentMenu = index;
                    });
                    widget.onTap(index);
                  },
                  child: Row(
                    children: [
                      const SizedBox(width: 40),
                      menu.icon.svg(
                        width: 24,
                        height: 24,
                        color: index == _currentMenu ? const Color(0xFFFFDC82) : const Color(0xFFDADADA),
                      ),
                      const SizedBox(width: 32),
                      Text(
                        menu.title,
                        style: TextStyle(
                          color: index == _currentMenu ? const Color(0xFFFFDC82) : const Color(0xFFDADADA),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      Visibility(
                        visible: index == _currentMenu,
                        maintainSize: true,
                        maintainAnimation: true,
                        maintainState: true,
                        child: Container(
                          height: 30,
                          width: 3,
                          color: const Color(0xFFFFDC82),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
