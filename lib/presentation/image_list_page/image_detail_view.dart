import 'package:flutter/material.dart';

class ImageDetailView extends StatefulWidget {
  final int index;
  final VoidCallback onDragEnd;
  final VoidCallback onDragging;
  const ImageDetailView({
    super.key,
    required this.index,
    required this.onDragEnd,
    required this.onDragging,
  });

  @override
  State<ImageDetailView> createState() => _ImageDetailViewState();
}

class _ImageDetailViewState extends State<ImageDetailView>
    with SingleTickerProviderStateMixin {
  Offset offset = const Offset(0, 0);

  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Transform.translate(
          offset: offset,
          child: GestureDetector(
            onVerticalDragUpdate: (details) {
              if (details.delta.dy > 0) {
                setState(() {
                  offset += details.delta;
                });
                widget.onDragging.call();
              }
            },
            onVerticalDragEnd: (details) {
              widget.onDragEnd.call();
            },
            child: Container(
              width: MediaQuery.of(context).size.width * (0.8),
              height: MediaQuery.of(context).size.width * (0.4),
              color: Colors.grey,
              child: Center(
                child: Text("${widget.index}"),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
