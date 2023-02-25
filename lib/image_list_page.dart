import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
                    onTap: () {
                      setState(() {
                        showImageDetail = true;
                        selectedIndex = index;
                      });
                    },
                  );
                },
                shrinkWrap: true,
              ),
            ),
          ),
        ),
        if (showImageDetail)
          ImageDetail(
              index: selectedIndex,
              onDragEnd: () {
                setState(() {
                  showImageDetail = false;
                });
              })
      ],
    );
  }
}

class ImageDetail extends StatefulWidget {
  final int index;
  final VoidCallback onDragEnd;
  const ImageDetail({
    super.key,
    required this.index,
    required this.onDragEnd,
  });

  @override
  State<ImageDetail> createState() => _ImageDetailState();
}

class _ImageDetailState extends State<ImageDetail> {
  Offset offset = const Offset(0, 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeData()
          .scaffoldBackgroundColor
          .withOpacity(max(0.5, 1 - offset.dy / 200)),
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
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              buildTransform(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTransform() {
    return Transform.translate(
      offset: offset,
      child: GestureDetector(
        onVerticalDragUpdate: (details) {
          if (details.delta.dy > 0) {
            setState(() {
              offset += details.delta;
            });
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
    );
  }
}

class Item extends StatelessWidget {
  final int index;
  final VoidCallback onTap;
  const Item({super.key, required this.index, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.grey.withOpacity(0.3),
        child: Center(
          child: Text("$index"),
        ),
      ),
    );
  }
}
