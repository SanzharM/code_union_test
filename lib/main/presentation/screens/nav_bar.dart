import 'package:code_union_test/core/constants/app_colors.dart';
import 'package:code_union_test/main/domain/blocs/feed/feed_bloc.dart';
import 'package:code_union_test/main/domain/blocs/profile/profile_bloc.dart';
import 'package:code_union_test/main/presentation/screens/profile/profile_screen.dart';
import 'package:code_union_test/main/presentation/widgets/app_icon.dart';
import 'package:flutter/cupertino.dart';
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
    BlocProvider<ProfileBloc>(
      create: (context) => ProfileBloc(),
      child: const ProfileScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() => _currentIndex = index);
      },
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: AppIcon(
            name: 'assets/feed.png',
            color: _currentIndex == 0 ? AppColors.blue : AppColors.black,
          ),
        ),
        BottomNavigationBarItem(
          icon: AppIcon(
            name: 'assets/heart.png',
            color: _currentIndex == 0 ? AppColors.blue : AppColors.black,
          ),
        ),
        BottomNavigationBarItem(
          icon: AppIcon(
            name: 'assets/map.png',
            color: _currentIndex == 0 ? AppColors.blue : AppColors.black,
          ),
        ),
        BottomNavigationBarItem(
          icon: AppIcon(
            name: 'assets/profile.png',
            color: _currentIndex == 0 ? AppColors.blue : AppColors.black,
          ),
        ),
      ],
    );
  }
}
