import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ImageDetailPage extends StatefulWidget {
  final int index;
  const ImageDetailPage({
    super.key,
    required this.index,
  });

  @override
  State<ImageDetailPage> createState() => _ImageDetailPageState();
}

class _ImageDetailPageState extends State<ImageDetailPage> {
  double _imagePosY = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            _imagePosY == 0 ? Colors.blue : Colors.blue.withOpacity(0.3),
        title: const Text("Image Detail Pagemfアチョxxxdっっdd"),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(),
                ),
                Positioned.fill(
                  top: _imagePosY,
                  bottom: 80,
                  child: GestureDetector(
                    onVerticalDragUpdate: (details) {
                      print("aaa");
                      if (details.delta.dy > 0) {
                        setState(() {
// aa
                          _imagePosY += details.delta.dy;
                        });
                      }
                    },
                    onVerticalDragEnd: (details) {
                      if (_imagePosY > 0) {
                        context.pop();
                      }
                    },
                    child: Container(
                      color: Colors.grey.withOpacity(0.3),
                      child: Center(
                        child: Text("${widget.index}"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
