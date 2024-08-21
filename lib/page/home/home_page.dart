import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:animate_gradient/animate_gradient.dart';
import 'package:c_guy_music_flutter/model/chart_sample_data.dart';
import 'package:c_guy_music_flutter/page/clean/clean_page.dart';
import 'package:c_guy_music_flutter/widget/background/background.dart';
import 'package:c_guy_music_flutter/widget/background/moon_bg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:window_manager/window_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  /// 旋转动画控制器
  //late AnimationController _controller;

  // 动画效果序号 1-10
  //int animationType = 0;

  /// 定时器
  Timer? timer;

  //Cpu使用率
  int wave1 = 1;
  List<ChartSampleData>? chartData1;

  /// 数据刷新通知
  late ValueNotifier valueListenable;

  _HomePageState() {
    chartData1 = [];
    for (int i = 0; i < 30; i++) {
      chartData1!.add(ChartSampleData(x: i, y: 0));
    }
    wave1 = chartData1!.length;
    timer = Timer.periodic(const Duration(milliseconds: 550), _updateData);
  }

  void _updateData(Timer timer) async {
    if (mounted) {
      chartData1!.removeAt(0);
      chartData1!.add(ChartSampleData(x: wave1, y: Random().nextInt(65) + 10)); // );
      wave1 = wave1 + 1;
      valueListenable.value = wave1;
    }
  }

  @override
  void initState() {
    super.initState();
    // _controller = AnimationController(
    //   vsync: this,
    //   duration: const Duration(seconds: 20),
    // )..repeat();
    valueListenable = ValueNotifier(wave1);
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
    //_controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("绘制build");
    if (Platform.isAndroid) {
      // 安卓只显示左侧盒子
      return buildLeftBox();
    }
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
              //color: Colors.amber,
              child: DragToMoveArea(
                child: SizedBox(),
              ),
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 360,
                child: buildLeftBox(),
              ),
              Expanded(
                child: buildRightBox(),
              )
            ],
          ),
        ],
      ),
    );
  }

  // 左侧盒子
  Widget buildLeftBox() {
    debugPrint("绘制LeftBox");
    //动画组件
    //畅快清理 · 清爽一下
    //欢迎使用Lemon Cleaner
    //开始扫描
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(height: 60),
        const Padding(
          padding: EdgeInsets.only(left: 40),
          child: Text(
            "Lemon Cleaner",
            style: TextStyle(
              fontSize: 26,
              fontFamily: "ITCAvantGarde",
              color: Color(0xFFE5F0FF),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              const Spacer(),
              const SizedBox(
                width: 300,
                height: 300,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    MoonBgWidget(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "CPU",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFFBEBEBE),
                            fontFamily: "ITCAvantGarde",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "98%",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              const Text(
                "畅快清理 · 清爽一下",
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xFFE5F0FF),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "欢迎使用 C Guy Music",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF6D748F),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 30),
              //230*50
              const SizedBox(height: 20),
              SizedBox(
                width: 230,
                height: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: AnimateGradient(
                    primaryBegin: Alignment.topLeft,
                    primaryEnd: Alignment.topCenter,
                    secondaryBegin: Alignment.bottomCenter,
                    secondaryEnd: Alignment.bottomRight,
                    primaryColors: const [
                      Color(0xFF2D93CC),
                      Color(0xFF2D93CC),
                      Color(0xFF42adcc),
                      Color(0xFF57C6CC),
                      Color(0xFF5FC9CA),
                    ],
                    secondaryColors: const [
                      Color(0xFF2B90CC),
                      Color(0xFF2D93CC),
                      Color(0xFF42adcc),
                      Color(0xFF57C6CC),
                      Color(0xFF5FC9CA),
                    ],
                    child: InkWell(
                      onTap: () {
                        toCleanPage();
                      },
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
                ),
              ),
              const SizedBox(height: 70),
            ],
          ),
        ),
      ],
    );
  }

  /// 右侧区域
  Widget buildRightBox() {
    debugPrint("绘制RightBox");
    return Padding(
      padding: const EdgeInsets.only(right: 30, bottom: 50),
      // 2行，3*3的格子 第一行2份行 第二行1份行
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 24),
          const Row(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ClipOval(
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: Image(
                        image: AssetImage("images/c_guy_logo.png"),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "下午好，C 佬",
                    style: TextStyle(
                      fontSize: 22,
                      color: Color(0xFF94a0bd),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Spacer(),
              SizedBox(
                width: 320,
                child: TextField(
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0x888a94b1),
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    focusColor: Colors.amber,
                    fillColor: Color(0xFF30344a),
                    filled: true,
                    hintText: "输入功能，文件内容，联系人进行搜索",
                    hintStyle: TextStyle(
                      fontSize: 12,
                      color: Color(0x888a94b1),
                      fontWeight: FontWeight.bold,
                    ),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                    hoverColor: Colors.transparent,
                    suffixIcon: Icon(
                      Icons.search_rounded,
                      color: Color(0xFF626576),
                      size: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 40),
            ],
          ),
          const SizedBox(height: 30),
          Flexible(
            flex: 2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Flexible(
                  flex: 3,
                  child: Column(
                    children: [
                      Expanded(
                        child: buildDataCard(
                          name: "系统安全",
                          tips: "系统扫描",
                          image: "images/Security.svg",
                        ),
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: buildDataCard(
                          name: "相册优化",
                          tips: "20个相似文件",
                          image: "images/picture.svg",
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                Flexible(
                  flex: 2,
                  child: Column(
                    children: [
                      Expanded(
                        child: buildDataCard(
                          name: "文件清理",
                          tips: "1236个垃圾文件",
                          image: "images/folder.svg",
                        ),
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: buildDataCard(
                          name: "保险箱",
                          tips: "保护您的隐私安全",
                          image: "images/suitcase.svg",
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                Flexible(
                  flex: 2,
                  child: buildImageCard(),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Flexible(
            child: Row(
              children: [
                Flexible(
                  child: buildDataCard(
                    name: "我的钱包",
                    tips: "资产安全",
                    image: "images/wallet.svg",
                    showButton: false,
                  ),
                ),
                const SizedBox(width: 20),
                Flexible(
                  child: buildDataCard(
                    name: "吐个槽",
                    tips: "提出宝贵的建议",
                    image: "images/chat.svg",
                    showButton: false,
                  ),
                ),
                const SizedBox(width: 20),
                Flexible(
                  flex: 2,
                  child: RepaintBoundary(
                    child: buildChart(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// PC信息列
  Widget buildPCInfo({
    required String name,
    required String value,
  }) {
    return Column(
      children: [
        Text(
          name,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF76849f),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontFamily: "ITCAvantGarde",
            fontWeight: FontWeight.bold,
            color: Color(0xFFb0bcd7),
          ),
        )
      ],
    );
  }

  /// 宣传图卡片
  Widget buildImageCard() {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFC48FD9),
            Color(0xFFC591D7),
            Color(0xFFDEADB8),
            Color(0xFFEBBDA7),
          ],
          stops: [0, 0.2, 0.6, 1],
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            right: -160,
            bottom: -180,
            child: SvgPicture.asset(
              "images/saly.svg",
              fit: BoxFit.cover,
              width: 440,
              height: 440,
            ),
          ),
          const Positioned(
            left: 0,
            right: 0,
            top: 56,
            child: Column(
              children: [
                Text(
                  "柠檬精选",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "发现更多优质应用",
                  style: TextStyle(
                    color: Color(0xFFEAEAEA),
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  /// 右侧每一个卡片的基类
  Widget buildDataCard({
    required String name,
    required String tips,
    required String image,
    bool showButton = true,
  }) {
    return buildAeroCard(
      padding: const EdgeInsets.only(
        top: 10,
        left: 10,
        right: 4,
        bottom: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                image,
                height: 60,
                //抗锯齿
                //isAntiAlias: true,
              ),
              // if (showButton) ...{
              //   IconButton(
              //     onPressed: () {},
              //     icon: const HugeIcon(
              //       icon: HugeIcons.strokeRoundedMoreVertical,
              //       color: Color(0xFFA5B6D7),
              //     ),
              //   ),
              // }
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //工具名称
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFA5B6D7),
                  ),
                ),
                const SizedBox(height: 4),
                //提示信息
                Text(
                  tips,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 136, 151, 179),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  /// Aero 盒子
  Widget buildAeroCard({
    required Widget child,
    EdgeInsets? padding,
  }) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0x0AFFFFFF),
      ),
      child: child,
    );
  }

  Widget buildChart() {
    debugPrint("绘制图表");
    return buildAeroCard(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "系统状况",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Color(0xFFA5B6D7),
            ),
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: valueListenable,
              builder: (context, value, child) {
                debugPrint("绘制图表-局部刷新");
                return Container();
                // return SfCartesianChart(
                //   plotAreaBorderWidth: 0,
                //   primaryXAxis: const NumericAxis(
                //     isVisible: false,
                //     decimalPlaces: 0,
                //   ),
                //   primaryYAxis: const NumericAxis(
                //     isVisible: false,
                //     maximum: 100,
                //   ),
                //   series: _getLiveUpdateSeries(),
                // );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildPCInfo(name: "CPU温度", value: "48℃"),
              buildPCInfo(name: "CPU占用", value: "98%"),
              buildPCInfo(name: "风扇", value: "1186R"),
              buildPCInfo(name: "磁盘", value: "2/8 TB"),
            ],
          ),
        ],
      ),
    );
  }

  //图表数据
  // List<SplineSeries<ChartSampleData, num>> _getLiveUpdateSeries() {
  //   return <SplineSeries<ChartSampleData, num>>[
  //     SplineSeries<ChartSampleData, num>(
  //       dataSource: [...chartData1!],
  //       xValueMapper: (ChartSampleData sales, _) => sales.x,
  //       yValueMapper: (ChartSampleData sales, _) => sales.y,
  //       animationDuration: 0,
  //       splineType: SplineType.cardinal,
  //     ),
  //     // SplineSeries<ChartSampleData, num>(
  //     //   dataSource: [...chartData2!],
  //     //   xValueMapper: (ChartSampleData sales, _) => sales.x as num,
  //     //   yValueMapper: (ChartSampleData sales, _) => sales.y,
  //     //   animationDuration: 0,
  //     // )
  //   ];
  // }

  /// 跳转到清理页面
  void toCleanPage() {
    debugPrint("x");
    Get.to(
      () => const CleanPage(),
      id: 1,
      fullscreenDialog: true,
      transition: Transition.fadeIn,
    );
  }
}