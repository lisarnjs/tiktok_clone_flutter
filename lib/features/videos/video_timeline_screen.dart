import 'package:flutter/material.dart';
import 'package:titok_clone/features/videos/widgets/video_post.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  int _itemCount = 4;

  final PageController _pageController = PageController();

  // List<Color> colors = [
  //   Colors.blue,
  //   Colors.red,
  //   Colors.yellow,
  //   Colors.teal,
  // ];

  final Duration _scrollDuration = const Duration(milliseconds: 250);
  final Curve _scrollCurve = Curves.linear;

  void _onPageChanged(int page) {
    _pageController.animateToPage(
      page,
      duration: _scrollDuration,
      curve: _scrollCurve,
    );
    if (page == _itemCount - 1) {
      _itemCount = _itemCount + 4;
      // colors.addAll([
      //   Colors.blue,
      //   Colors.red,
      //   Colors.yellow,
      //   Colors.teal,
      // ]);
      setState(() {});
    }
  }

  void _onVideoFinished() {
    return;
    _pageController.nextPage(
      duration: _scrollDuration,
      curve: _scrollCurve,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _onRefresh() {
    return Future.delayed(
      const Duration(seconds: 5),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      displacement: 50, // 화면을 당긴 다음 indicator 위치를 정하는 값
      edgeOffset: 20,
      color: Theme.of(context).primaryColor,
      child: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        onPageChanged: _onPageChanged,
        itemCount: _itemCount,
        itemBuilder: (context, index) =>
            VideoPost(onVideoFinished: _onVideoFinished, index: index),

        // itemBuilder: (context, index) => Container(
        //   color: colors[index],
        //   child: Center(
        //     child: Text(
        //       "Screen $index",
        //       style: const TextStyle(fontSize: 68),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
