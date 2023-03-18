import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_transition_animation/presentation/image_list_page/image_detail_page.dart';
import 'package:sample_transition_animation/presentation/image_list_page/image_grid_view.dart';
import 'package:sample_transition_animation/router.dart';

class ImageListPage extends StatefulWidget {
  const ImageListPage({super.key});

  @override
  State<ImageListPage> createState() => _ImageListPageState();
}

class _ImageListPageState extends State<ImageListPage> {
  bool showImageDetail = false;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                context.goNamed(AppRoute.home.name);
              },
            ),
            title: const Text(
              "ImageListPage",
            ),
          ),
          body: SafeArea(
            child: Center(
              child: ImageGridView(
                onTap: (tapIndex) {
                  setState(() {
                    selectedIndex = tapIndex;
                    showImageDetail = true;
                  });
                },
              ),
            ),
          ),
        ),
        if (showImageDetail)
          ImageDetailPage(
            index: selectedIndex,
            onDragEnd: () {
              setState(() {
                showImageDetail = false;
              });
            },
          ),
      ],
    );
  }
}
