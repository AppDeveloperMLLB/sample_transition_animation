import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_transition_animation/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: goRouter,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            _buildGoToPageButton(
              AppRoute.noTransitionPage.name,
              "No Transition",
            ),
            _buildGoToPageButton(
              AppRoute.slideTransitionPage.name,
              "Slide Transition",
            ),
            _buildGoToPageButton(
              AppRoute.slideTopToBottomTransitionPage.name,
              "SlideTopToBottomTransitionPage",
            ),
            _buildGoToPageButton(
              AppRoute.fadeTransitionPage.name,
              "FadeTransitionPage",
            ),
            _buildGoToPageButton(
              AppRoute.scaleTransitionPage.name,
              "ScaleTransitionPage",
            ),
            _buildGoToPageButton(
              AppRoute.blackWhiteTransitionPage.name,
              "BlackWhiteTransitionPage",
            ),
            _buildGoToPageButton(
              AppRoute.wipeTrainsitionPage.name,
              "WipeTransitionPage",
            ),
            _buildGoToPageButton(
              AppRoute.imageListPage.name,
              "ImageListPage",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGoToPageButton(String goName, String text) {
    return ElevatedButton(
      onPressed: () {
        context.goNamed(goName);
      },
      child: Text(text),
    );
  }
}

class PageTemplate extends StatelessWidget {
  final String title;
  final String buttonText;
  final VoidCallback? onPressed;
  final Color color;
  const PageTemplate({
    super.key,
    required this.title,
    required this.buttonText,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      backgroundColor: color,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              PageTitleText(
                text: title,
              ),
              ElevatedButton(
                onPressed: onPressed,
                child: Text(buttonText),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PageTitleText extends StatelessWidget {
  final String text;
  const PageTitleText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: const TextStyle(fontSize: 20));
  }
}
