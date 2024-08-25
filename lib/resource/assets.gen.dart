/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics.dart';

class $ImagesGen {
  const $ImagesGen();

  /// File path: images/bg_mask.svg
  SvgGenImage get bgMask => const SvgGenImage('images/bg_mask.svg');

  /// File path: images/c_guy_logo.png
  AssetGenImage get cGuyLogo => const AssetGenImage('images/c_guy_logo.png');

  /// File path: images/c_guy_music_logo.png
  AssetGenImage get cGuyMusicLogo =>
      const AssetGenImage('images/c_guy_music_logo.png');

  /// File path: images/calendar.svg
  SvgGenImage get calendar => const SvgGenImage('images/calendar.svg');

  /// File path: images/chat.svg
  SvgGenImage get chat => const SvgGenImage('images/chat.svg');

  /// File path: images/folder.svg
  SvgGenImage get folder => const SvgGenImage('images/folder.svg');

  /// File path: images/grid.svg
  SvgGenImage get grid => const SvgGenImage('images/grid.svg');

  /// Directory path: images/home
  $ImagesHomeGen get home => const $ImagesHomeGen();

  /// File path: images/picture.svg
  SvgGenImage get picture => const SvgGenImage('images/picture.svg');

  /// File path: images/saly.svg
  SvgGenImage get saly => const SvgGenImage('images/saly.svg');

  /// File path: images/security.svg
  SvgGenImage get security => const SvgGenImage('images/security.svg');

  /// File path: images/suitcase.svg
  SvgGenImage get suitcase => const SvgGenImage('images/suitcase.svg');

  /// File path: images/sylops-symbol.png
  AssetGenImage get sylopsSymbol =>
      const AssetGenImage('images/sylops-symbol.png');

  /// File path: images/test.png
  AssetGenImage get test => const AssetGenImage('images/test.png');

  /// File path: images/wallet.svg
  SvgGenImage get wallet => const SvgGenImage('images/wallet.svg');

  /// List of all assets
  List<dynamic> get values => [
        bgMask,
        cGuyLogo,
        cGuyMusicLogo,
        calendar,
        chat,
        folder,
        grid,
        picture,
        saly,
        security,
        suitcase,
        sylopsSymbol,
        test,
        wallet
      ];
}

class $ImagesHomeGen {
  const $ImagesHomeGen();

  /// File path: images/home/ic_bottom_box_next.svg
  SvgGenImage get icBottomBoxNext =>
      const SvgGenImage('images/home/ic_bottom_box_next.svg');

  /// File path: images/home/ic_bottom_box_play.svg
  SvgGenImage get icBottomBoxPlay =>
      const SvgGenImage('images/home/ic_bottom_box_play.svg');

  /// File path: images/home/ic_bottom_box_previous.svg
  SvgGenImage get icBottomBoxPrevious =>
      const SvgGenImage('images/home/ic_bottom_box_previous.svg');

  /// File path: images/home/ic_home_menu.svg
  SvgGenImage get icHomeMenu =>
      const SvgGenImage('images/home/ic_home_menu.svg');

  /// File path: images/home/ic_home_menu_mv.svg
  SvgGenImage get icHomeMenuMv =>
      const SvgGenImage('images/home/ic_home_menu_mv.svg');

  /// File path: images/home/ic_home_menu_new.svg
  SvgGenImage get icHomeMenuNew =>
      const SvgGenImage('images/home/ic_home_menu_new.svg');

  /// File path: images/home/ic_home_menu_playlists.svg
  SvgGenImage get icHomeMenuPlaylists =>
      const SvgGenImage('images/home/ic_home_menu_playlists.svg');

  /// File path: images/home/ic_home_menu_ranking.svg
  SvgGenImage get icHomeMenuRanking =>
      const SvgGenImage('images/home/ic_home_menu_ranking.svg');

  /// File path: images/home/ic_home_menu_singer.svg
  SvgGenImage get icHomeMenuSinger =>
      const SvgGenImage('images/home/ic_home_menu_singer.svg');

  /// File path: images/home/ic_home_play_list.svg
  SvgGenImage get icHomePlayList =>
      const SvgGenImage('images/home/ic_home_play_list.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        icBottomBoxNext,
        icBottomBoxPlay,
        icBottomBoxPrevious,
        icHomeMenu,
        icHomeMenuMv,
        icHomeMenuNew,
        icHomeMenuPlaylists,
        icHomeMenuRanking,
        icHomeMenuSinger,
        icHomePlayList
      ];
}

class Assets {
  Assets._();

  static const $ImagesGen images = $ImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final BytesLoader loader;
    if (_isVecFormat) {
      loader = AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
