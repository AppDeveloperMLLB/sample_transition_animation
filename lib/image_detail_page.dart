import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ImageDetailPage extends StatelessWidget {
  final int index;
  const ImageDetailPage({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Detail Page"),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onVerticalDragEnd: (details) {
                if (details.primaryVelocity! > 0) return;
                context.pop();
              },
              child: Container(
                color: Colors.grey.withOpacity(0.3),
                child: Center(
                  child: Text("$index"),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
