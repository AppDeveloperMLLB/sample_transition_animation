import 'package:flutter/material.dart';

class ImageGridItem extends StatelessWidget {
  final int index;
  final VoidCallback onTap;
  const ImageGridItem({super.key, required this.index, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.grey,
        child: Center(
          child: Text("$index"),
        ),
      ),
    );
  }
}
