import 'package:flutter/material.dart';

class ChatNavigationTabBar extends StatelessWidget {
  const ChatNavigationTabBar({
    Key? key,
    required TabController tabController,
    required this.tabs,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;
  final List<Tab> tabs;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelStyle: TextStyle(fontWeight: FontWeight.bold),
      tabs: tabs,
      // isScrollable: true,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      controller: _tabController,
    );
  }
}
