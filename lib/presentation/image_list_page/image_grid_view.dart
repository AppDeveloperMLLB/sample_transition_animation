import 'package:flutter/material.dart';
import 'package:sample_transition_animation/presentation/image_list_page/imaga_grid_item.dart';

double imageGridWidth = 0;
double imageGridHeight = 0;

class ImageGridView extends StatelessWidget {
  final void Function(int tapIndex) onTap;
  const ImageGridView({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        crossAxisCount: 3,
      ),
      itemCount: 40,
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return LayoutBuilder(
          builder: (context, constraints) {
            imageGridWidth = constraints.maxWidth;
            imageGridHeight = constraints.maxWidth;
            return ImageGridItem(
              index: index,
              onTap: () {
                onTap(index);
              },
            );
          },
        );
      },
      shrinkWrap: true,
    );
  }
}
