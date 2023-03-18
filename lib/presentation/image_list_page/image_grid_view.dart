import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:sample_transition_animation/presentation/image_list_page/imaga_grid_item.dart';
import 'package:sample_transition_animation/presentation/image_list_page/image_detail_page.dart';

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
            return OpenContainer(
              openBuilder: (context, closedContainer) {
                return ImageDetailPage(
                  index: index,
                  onDragEnd: () {
                    closedContainer.call();
                  },
                );
              },
              closedShape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(0)),
              ),
              closedElevation: 0,
              closedBuilder: (context, openContainer) {
                return ImageGridItem(
                  index: index,
                  onTap: () {
                    openContainer.call();
                  },
                );
              },
            );
          },
        );
      },
      shrinkWrap: true,
    );
  }
}
