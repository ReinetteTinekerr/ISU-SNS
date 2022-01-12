import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:university_chat_app/config/routes/app_router.gr.dart';
import 'package:university_chat_app/constants/constants.dart';
import 'package:university_chat_app/core/pages/home/menu_item.dart';
import 'package:university_chat_app/provider/providers.dart';

final appbarVisibleStateProvider = StateProvider<bool>((ref) => true);

GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

class MainPage extends ConsumerStatefulWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      // animationCurve: Curves.easeOut,
      routes: const [
        HomeTab(),
        ChatsTab(),
        DiscoverTab(),
        DepartmentsTab(),
        CoursesTab(),
      ],

      builder: (context, child, animation) {
        // final tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          key: _drawerKey,
          // appBar: SlidingAppBar(
          //   visible: _visible.state,
          //   controller: _controller,
          //   child: _AppBar(
          //     title: tabsRouter.current.name.replaceFirst('Tab', ''),
          //   ),
          // ),
          endDrawer: const _Drawer(),
          body: child,
        );
      },
      bottomNavigationBuilder: (_, tabsRouter) {
        return _BottomNavigationBar(tabsRouter: tabsRouter);
      },
    );
  }
}

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: GoogleFonts.aBeeZee(
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: InkWell(
            child: const CircleAvatar(),
            onTap: () => _drawerKey.currentState?.openEndDrawer(),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar({
    Key? key,
    required this.tabsRouter,
  }) : super(key: key);

  final TabsRouter tabsRouter;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: tabsRouter.activeIndex,
      onTap: tabsRouter.setActiveIndex,
      items: const [
        BottomNavigationBarItem(icon: Icon(MdiIcons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(MdiIcons.chat), label: 'Chats'),
        BottomNavigationBarItem(
            icon: Icon(MdiIcons.accountVoice), label: 'Student Voice'),
        BottomNavigationBarItem(
          icon: Icon(MdiIcons.accountGroup),
          label: 'Departments',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Course'),
      ],
    );
  }
}

class _Drawer extends ConsumerWidget {
  const _Drawer({
    Key? key,
  }) : super(key: key);

  ListTile buildItem(BuildContext context, MenuItem item) {
    return ListTile(
      leading: Icon(item.icon),
      title: Text(
        item.title,
        style: const TextStyle(fontSize: 16),
      ),
      onTap: () {
        // AutoRouter.of(context).pushNamed(item.routeName);
        AutoRouter.of(context).navigate(item.route);
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(settingsControllerProvider.notifier);
    bool isDark = state.isDarkTheme;
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                  accountName: const Text(
                    'username',
                  ),
                  accountEmail: const Text(
                    'username@isu.edu.ph',
                  ),
                  currentAccountPicture: InkWell(
                    child: const CircleAvatar(),
                    onTap: () =>
                        AutoRouter.of(context).push(const ProfileRoute()),
                  ),
                ),
                ...DefaultDrawerItems.all
                    .map((item) => buildItem(context, item))
                    .toList(),
              ],
            ),
          ),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: Container(
              margin: const EdgeInsets.all(5),
              child: Column(
                children: [
                  const Divider(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        tooltip: 'About',
                        icon: const Icon(Icons.help_outline_sharp),
                        onPressed: () {
                          showAboutDialog(
                            context: context,
                            applicationName: 'Chat App',
                            applicationIcon: Image.asset(
                              'assets/icons/isu_icon.png',
                              width: 32,
                              height: 32,
                            ),
                            children: [
                              const Text(
                                'Developers:',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const Text(developers),
                            ],
                          );
                        },
                      ),
                      IconButton(
                        tooltip: 'Dark Mode',
                        icon: Icon(
                          isDark
                              ? Icons.brightness_5_outlined
                              : Icons.brightness_4_outlined,
                        ),
                        onPressed: () {
                          isDark = !isDark;
                          if (isDark != state.isDarkTheme) {
                            state.updateThemeMode(
                              isDark ? ThemeMode.dark : ThemeMode.light,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DefaultDrawerItems {
  static const schedule = MenuItem('Schedule', Icons.schedule, ScheduleRoute());
  static const notes = MenuItem('Notes', Icons.note_alt_outlined, NotesRoute());
  static const grades =
      MenuItem('Grades', Icons.grade, GradesRoute()); // student stats
  static const settings = MenuItem('Settings', Icons.settings, SettingsRoute());

  static const all = <MenuItem>[
    schedule,
    grades,
    notes,
    settings,
  ];
}
