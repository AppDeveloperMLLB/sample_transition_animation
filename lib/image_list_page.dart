import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_transition_animation/router.dart';

class ImageListPage extends StatelessWidget {
  const ImageListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              crossAxisCount: 3,
            ),
            itemCount: 40,
            padding: const EdgeInsets.all(8),
            itemBuilder: (context, index) {
              return Item(
                index: index,
              );
            },
            shrinkWrap: true,
          ),
        ),
      ),
    );
  }
}

class Item extends StatelessWidget {
  final int index;
  const Item({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.goNamed(
          AppRoute.imageDetailPage.name,
          extra: index,
        );
      },
      child: Container(
        color: Colors.grey.withOpacity(0.3),
        child: Center(
          child: Text("$index"),
        ),
      ),
    );
  }
}
