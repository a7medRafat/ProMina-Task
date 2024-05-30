import 'package:flutter/material.dart';

import '../../config/colors/app_colors.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key, required this.title, this.img});

  final String title;
  final String? img;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: true,
        titleSpacing: 4,
        elevation: 0,
        backgroundColor: AppColors.scaffoldColor,
        leading: Padding(
          padding: const EdgeInsets.all(10),
          child: GestureDetector(
            onTap: () => Scaffold.of(context).openDrawer(),
            child: CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage(img!),
            ),
          ),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
