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
      body: const SafeArea(
        child: Center(
          child: Text(
            "ImageListPage",
          ),
        ),
      ),
    );
  }
}
