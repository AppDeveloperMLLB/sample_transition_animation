import 'package:flutter/material.dart';
import 'package:sample_transition_animation/presentation/image_list_page/image_detail_view.dart';

class ImageDetailPage extends StatefulWidget {
  final int index;
  final VoidCallback onDragEnd;
  const ImageDetailPage({
    super.key,
    required this.index,
    required this.onDragEnd,
  });

  @override
  State<ImageDetailPage> createState() => _ImageDetailPageState();
}

class _ImageDetailPageState extends State<ImageDetailPage> {
  Offset offset = const Offset(0, 0);
  bool makeHalfTransparent = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeData()
          .scaffoldBackgroundColor
          .withOpacity(makeHalfTransparent ? 0.5 : 1),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () => widget.onDragEnd.call(),
        ),
        title: const Text("Image Detail"),
      ),
      body: SafeArea(
        child: Center(
          child: ImageDetailView(
            index: widget.index,
            onDragEnd: () => widget.onDragEnd.call(),
            onDragging: () {
              setState(() {
                makeHalfTransparent = true;
              });
            },
          ),
        ),
      ),
    );
  }
}
