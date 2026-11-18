import 'package:flutter/material.dart';
import 'package:cafe_burrito/core/constants/app_sizes.dart';
import 'package:cafe_burrito/core/theme/app_colors.dart';
import 'package:cafe_burrito/features/cafe/presentation/cafe_screen.dart';
import 'package:cafe_burrito/features/hud/presentation/hud_bar.dart';
import 'package:cafe_burrito/features/regulars/presentation/regulars_screen.dart';
import 'package:cafe_burrito/features/settings/presentation/settings_screen.dart';
import 'package:cafe_burrito/features/shop/presentation/shop_screen.dart';

const double _tempCoins = 1250000;
const double _tempGoldenBeans = 12;

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = [
    CafeScreen(),
    RegularsScreen(),
    ShopScreen(),
  ];

  void _onSettingsTap() {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (context) => const SettingsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            HudBar(
              coins: _tempCoins,
              goldenBeans: _tempGoldenBeans,
              onSettingsTap: _onSettingsTap,
            ),
            Expanded(
              child: IndexedStack(
                index: _selectedIndex,
                children: _screens,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: AppColors.espresso,
              width: AppSizes.outlineWidth,
            ),
          ),
        ),
        child: NavigationBar(
          selectedIndex: _selectedIndex,
          onDestinationSelected: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.local_cafe_rounded),
              label: 'Cafe',
            ),
            NavigationDestination(
              icon: Icon(Icons.pets_rounded),
              label: 'Regulars',
            ),
            NavigationDestination(
              icon: Icon(Icons.storefront_rounded),
              label: 'Shop',
            ),
          ],
        ),
      ),
    );
  }
}
