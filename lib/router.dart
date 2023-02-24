import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_transition_animation/image_detail_page.dart';
import 'package:sample_transition_animation/image_list_page.dart';
import 'package:sample_transition_animation/main.dart';

enum AppRoute {
  home(
    path: '/',
    name: 'home',
  ),
  noTransitionPage(
    path: '/noTransitionPage',
    name: 'noTransitionPage',
  ),
  slideTransitionPage(
    path: '/slideTransitionPage',
    name: 'slideTransitionPage',
  ),
  slideTopToBottomTransitionPage(
    path: '/slideTopToBottomTransitionPage',
    name: 'slideTopToBottomTransitionPage',
  ),
  fadeTransitionPage(
    path: '/fadeTransitionPage',
    name: '/fadeTransitionPage',
  ),
  scaleTransitionPage(
    path: '/scaleTransitionPage',
    name: 'scaleTransitionPage',
  ),
  blackWhiteTransitionPage(
    path: '/blackWhiteTransitionPage',
    name: 'blackWhiteTransitionPage',
  ),
  wipeTrainsitionPage(
    path: '/wipeTransitionPage',
    name: 'wipeTransitionPage',
  ),
  imageListPage(
    path: '/imageListPage',
    name: 'imageListPage',
  ),
  imageDetailPage(
    path: '/imageListPage/imageDetailPage',
    name: 'imageDetailPage',
  ),
  page1(
    path: '/page1',
    name: 'page1',
  ),
  page2(
    path: '/page2',
    name: 'page2',
  );

  final String path;
  final String name;

  const AppRoute({
    required this.path,
    required this.name,
  });
}

final goRouter = GoRouter(
  initialLocation: AppRoute.home.path,
  routes: [
    GoRoute(
      path: AppRoute.home.path,
      name: AppRoute.home.name,
      builder: (context, state) => const MyHomePage(title: "Sample Transition"),
    ),
    GoRoute(
      path: AppRoute.noTransitionPage.path,
      name: AppRoute.noTransitionPage.name,
      pageBuilder: (context, state) => NoTransitionPage(
        child: PageTemplate(
          title: "NoTransitionPage",
          buttonText: "Home",
          onPressed: () => context.goNamed(AppRoute.home.name),
          color: Colors.green,
        ),
      ),
    ),
    GoRoute(
      path: AppRoute.slideTransitionPage.path,
      name: AppRoute.slideTransitionPage.name,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: PageTemplate(
            title: "SlideTransitionPage",
            buttonText: "Home",
            onPressed: () => context.goNamed(AppRoute.home.name),
            color: Colors.green),
        transitionsBuilder: (context, animation, secondaryAnimation, widget) {
          const begin = Offset(-1.0, 0.0);
          const end = Offset.zero;

          final Animatable<Offset> tween = Tween(begin: begin, end: end).chain(
            CurveTween(curve: Curves.easeInOut),
          );

          final Animation<Offset> offsetAnimation = animation.drive(tween);
          return SlideTransition(
            position: offsetAnimation,
            child: widget,
          );
        },
      ),
    ),
    GoRoute(
      path: AppRoute.slideTopToBottomTransitionPage.path,
      name: AppRoute.slideTopToBottomTransitionPage.name,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: PageTemplate(
          title: "SlideTopToBottomTransitionPage",
          buttonText: "Home",
          onPressed: () => context.goNamed(AppRoute.home.name),
          color: Colors.green,
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, widget) {
          const begin = Offset(0.0, -1.0);
          const end = Offset.zero;

          final Animatable<Offset> tween = Tween(begin: begin, end: end).chain(
            CurveTween(curve: Curves.easeInOut),
          );

          final Animation<Offset> offsetAnimation = animation.drive(tween);
          return SlideTransition(
            position: offsetAnimation,
            child: widget,
          );
        },
      ),
    ),
    GoRoute(
      path: AppRoute.fadeTransitionPage.path,
      name: AppRoute.fadeTransitionPage.name,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: PageTemplate(
          title: "FadeTransitionPage",
          buttonText: "Home",
          onPressed: () => context.goNamed(AppRoute.home.name),
          color: Colors.green,
        ),
        transitionDuration: const Duration(
          seconds: 1,
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, widget) {
          const begin = 0.0;
          const end = 1.0;

          final Animatable<double> tween = Tween(begin: begin, end: end).chain(
            CurveTween(curve: Curves.easeInOut),
          );

          final Animation<double> opacityAnimation = animation.drive(tween);
          return FadeTransition(
            opacity: opacityAnimation,
            child: widget,
          );
        },
      ),
    ),
    GoRoute(
      path: AppRoute.scaleTransitionPage.path,
      name: AppRoute.scaleTransitionPage.name,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: PageTemplate(
          title: "ScaleTransitionPage",
          buttonText: "Home",
          onPressed: () => context.goNamed(AppRoute.home.name),
          color: Colors.green,
        ),
        transitionDuration: const Duration(
          seconds: 1,
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, widget) {
          const begin = 0.0;
          const end = 1.0;

          final Animatable<double> tween = Tween(begin: begin, end: end).chain(
            CurveTween(curve: Curves.easeInOut),
          );

          final Animation<double> scaleAnimation = animation.drive(tween);
          return ScaleTransition(
            scale: scaleAnimation,
            child: widget,
          );
        },
      ),
    ),
    GoRoute(
      path: AppRoute.blackWhiteTransitionPage.path,
      name: AppRoute.blackWhiteTransitionPage.name,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: PageTemplate(
          title: "BlackWhiteTransitionPage",
          buttonText: "Home",
          onPressed: () => context.goNamed(AppRoute.home.name),
          color: Colors.green,
        ),
        transitionDuration: const Duration(
          seconds: 2,
        ),
        reverseTransitionDuration: const Duration(
          seconds: 2,
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, widget) {
          final color = ColorTween(
            begin: Colors.transparent,
            end: Colors.black,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: const Interval(
                0.0,
                0.5,
                curve: Curves.easeInOut,
              ),
            ),
          );
          final opacity = Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: const Interval(
                0.5,
                1.0,
                curve: Curves.easeInOut,
              ),
            ),
          );
          return AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              return Container(
                color: color.value,
                child: Opacity(
                  opacity: opacity.value,
                  child: child,
                ),
              );
            },
            child: widget,
          );
        },
      ),
    ),
    GoRoute(
      path: AppRoute.wipeTrainsitionPage.path,
      name: AppRoute.wipeTrainsitionPage.name,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: PageTemplate(
          title: "WipeTransitionPage",
          buttonText: "Home",
          onPressed: () => context.goNamed(AppRoute.home.name),
          color: Colors.green,
        ),
        transitionDuration: const Duration(
          seconds: 2,
        ),
        reverseTransitionDuration: const Duration(
          seconds: 2,
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, widget) {
          final opacity = Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            ),
          );

          return AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              return ClipPath(
                clipper: WipeClipper(opacity.value),
                child: child,
              );
            },
            child: widget,
          );
        },
      ),
    ),
    GoRoute(
      path: AppRoute.imageListPage.path,
      name: AppRoute.imageListPage.name,
      builder: (context, state) {
        return const ImageListPage();
      },
      routes: [
        GoRoute(
          path: "imageDetailPage",
          name: AppRoute.imageDetailPage.name,
          builder: (context, state) {
            final index = state.extra as int;
            return ImageDetailPage(
              index: index,
            );
          },
        ),
      ],
    ),
  ],
);

class WipeClipper extends CustomClipper<Path> {
  const WipeClipper(this.progress) : super();

  final double progress;

  @override
  Path getClip(Size size) {
    return Path()
      ..addRect(Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: size.width * progress,
        height: size.height,
      ))
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
