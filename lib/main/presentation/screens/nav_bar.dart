import 'package:code_union_test/core/constants/app_colors.dart';
import 'package:code_union_test/main/domain/blocs/feed/feed_bloc.dart';
import 'package:code_union_test/main/domain/blocs/profile/profile_bloc.dart';
import 'package:code_union_test/main/presentation/screens/feed/feed_screen.dart';
import 'package:code_union_test/main/presentation/screens/profile/profile_screen.dart';
import 'package:code_union_test/main/presentation/widgets/app_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;

  final List<Widget> tabs = [
    BlocProvider<FeedBloc>(
      create: (context) => FeedBloc(),
      child: const FeedScreen(),
    ),
    BlocProvider<ProfileBloc>(
      create: (context) => ProfileBloc(),
      child: const ProfileScreen(),
    ),
    BlocProvider<ProfileBloc>(
      create: (context) => ProfileBloc(),
      child: const ProfileScreen(),
    ),
    BlocProvider<ProfileBloc>(
      create: (context) => ProfileBloc(),
      child: const ProfileScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: tabs,
      ),
      bottomNavigationBar: CupertinoTabBar(
        border: null,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
          HapticFeedback.lightImpact();
        },
        backgroundColor: AppColors.transparent,
        items: [
          BottomNavigationBarItem(
            icon: AppIcon(name: 'assets/feed.png', size: 24.0, color: getColor(0)),
          ),
          BottomNavigationBarItem(
            icon: AppIcon(name: 'assets/map.png', size: 24.0, color: getColor(1)),
          ),
          BottomNavigationBarItem(
            icon: AppIcon(name: 'assets/heart.png', size: 24.0, color: getColor(2)),
          ),
          BottomNavigationBarItem(
            icon: AppIcon(name: 'assets/profile.png', size: 24.0, color: getColor(3)),
          ),
        ],
      ),
    );
  }

  Color getColor(int index) => _currentIndex == index ? AppColors.blue : AppColors.black;
}
