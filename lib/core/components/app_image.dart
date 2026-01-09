import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

class AppImage extends StatefulWidget {
  final String path;
  final double? height, width;
  final BoxFit? fit;
  final Color? color;
  final void Function(bool)? isLottieControlled;

  const AppImage({
    super.key,
    required this.path,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.color,
    this.isLottieControlled,
  });

  @override
  State<AppImage> createState() => _AppImageState();
}

class _AppImageState extends State<AppImage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.path.startsWith('http') || widget.path.startsWith('https')) {
      return Image.network(
        widget.path,
        height: widget.height,
        width: widget.width,
        fit: widget.fit,
        errorBuilder: (context, error, stackTrace) => Shimmer.fromColors(
          baseColor: Colors.red,
          highlightColor: Colors.yellow,
          child: Center(
            child: Text(
              '404',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      );
    }
    if (widget.path.endsWith('png')) {
      return Image.asset(
        'assets/images/${widget.path}',
        height: widget.height,
        width: widget.width,
        errorBuilder: (context, error, stackTrace) => Shimmer.fromColors(
          baseColor: Colors.red,
          highlightColor: Colors.yellow,
          child: Center(
            child: Text(
              'png',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      );
    }
    if (widget.path.endsWith('svg')) {
      return SvgPicture.asset(
        'assets/icons/${widget.path}',
        height: widget.height,
        width: widget.width,
        color: widget.color,
        errorBuilder: (context, error, stackTrace) => Shimmer.fromColors(
          baseColor: Colors.red,
          highlightColor: Colors.yellow,
          child: Center(
            child: Text(
              'svg',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      );
    }
    if (widget.path.endsWith('jpg')) {
      return Image.asset(
        'assets/images/${widget.path}',
        height: widget.height,
        width: widget.width,
        errorBuilder: (context, error, stackTrace) => Shimmer.fromColors(
          baseColor: Colors.red,
          highlightColor: Colors.yellow,
          child: Center(
            child: Text(
              'jpg',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      );
    } else if (widget.path.endsWith('json')) {
      if (widget.isLottieControlled != null) {
        return GestureDetector(
          onTap: () {
            if (_controller.isCompleted) {
              _controller.reverse();

              //widget.isLottieControlled?.call();
            } else {
              _controller.forward();
              // widget.isLottieControlled?.call();
            }
          },

          child: Lottie.asset(
            'assets/lottie/${widget.path}',
            height: widget.height,
            width: widget.width,

            controller: _controller,
            errorBuilder: (context, error, stackTrace) => Shimmer.fromColors(
              baseColor: Colors.red,
              highlightColor: Colors.yellow,
              child: Center(
                child: Text(
                  '404',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        );
      } else {
        return Lottie.asset(
          'assets/lottie/${widget.path}',
          height: widget.height,
          width: widget.width,
          controller: _controller,
          fit: widget.fit,
        );
      }
    } else {
      return Text('35');
    }
  }
}
