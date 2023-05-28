import 'package:flutter/material.dart';
import 'package:recipe/src/presentation/pages/bookmarks_page.dart';
import 'package:recipe/src/presentation/pages/home_page.dart';
import 'package:recipe/src/presentation/pages/profile_page.dart';

class AppNavBar extends StatelessWidget {
  const AppNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    void onOpenHomePageEvent() {
      Navigator.of(context).pushNamedAndRemoveUntil(
        HomePage.route,
        (route) => false,
      );
    }

    void onOpenFavPageEvent() {
      Navigator.of(context).pushNamedAndRemoveUntil(
        BookmarksPage.route,
        (route) => false,
      );
    }

    void onOpenProfilePageEvent() {
      Navigator.of(context).pushNamedAndRemoveUntil(
        ProfilePage.route,
        (route) => false,
      );
    }

    return Hero(
      tag: 'nav-bar',
      child: Container(
        height: 92.0,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          horizontal: 32.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(
                Icons.home_filled,
              ),
              color: Colors.black87,
              onPressed: onOpenHomePageEvent,
            ),
            IconButton(
              icon: const Icon(
                Icons.bookmark_rounded,
              ),
              color: Colors.black87,
              onPressed: onOpenFavPageEvent,
            ),
            IconButton(
              icon: const Icon(
                Icons.person_rounded,
              ),
              color: Colors.black87,
              onPressed: onOpenProfilePageEvent,
            ),
          ],
        ),
      ),
    );
  }
}