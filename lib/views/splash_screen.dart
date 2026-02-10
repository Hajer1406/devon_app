import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../controllers/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _videoController;
  final SplashController _controller = SplashController();

  @override
  void initState() {
    super.initState();

    _videoController = VideoPlayerController.asset(
      'assets/videos/logo.mp4',
    )..initialize().then((_) {
        setState(() {});
        _videoController
          ..setLooping(true)
          ..setVolume(0)
          ..play();
      });

    _controller.startSplash(context);
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _videoController.value.isInitialized
          ? Stack(
  fit: StackFit.expand,
  children: [
    VideoPlayer(_videoController),

    // Overlay sombre léger (optionnel)
    Container(
      color: Colors.black.withOpacity(0.15),
    ),
  ],
)
          : Center(child: CircularProgressIndicator()),
    );
  }
}
