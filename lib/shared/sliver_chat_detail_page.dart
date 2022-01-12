import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:university_chat_app/domain/models/chat_message.dart';
import 'package:university_chat_app/widgets/chat.dart';
import 'package:university_chat_app/widgets/chat_settings.dart';
import 'package:university_chat_app/widgets/pinned_chats.dart';

class SliverChatDetailsPage extends ConsumerStatefulWidget {
  const SliverChatDetailsPage({Key? key, @PathParam('id') required this.chatID})
      : super(key: key);
  final String chatID;

  @override
  _SliverChatDetailsState createState() => _SliverChatDetailsState();
}

class _SliverChatDetailsState extends ConsumerState<SliverChatDetailsPage>
    with SingleTickerProviderStateMixin {
  final List<ChatMessage> messages = [
    ChatMessage(messageContent: 'Hello, Will', messageType: 'receiver'),
    ChatMessage(messageContent: 'How have you been?', messageType: 'receiver'),
    ChatMessage(
      messageContent: 'Hey Kriss, I am doing fine dude. wbu?',
      messageType: 'sender',
    ),
    ChatMessage(messageContent: 'ehhhh, doing OK.', messageType: 'receiver'),
    ChatMessage(
      messageContent: 'Is there any thing wrong?',
      messageType: 'sender',
    ),
  ];

  late TabController _tabController;
  ScrollController messageScrollController = ScrollController();
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    messageScrollController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  static const tabs = [Tab(text: 'Chat'), Tab(text: 'Posts')];

  @override
  build(BuildContext context) {
    final flexibleSpaceBar = FlexibleSpaceBar(
      title: Text(
        widget.chatID,
        style: const TextStyle(
          shadows: [Shadow(color: Colors.black, blurRadius: 8)],
        ),
      ),
      centerTitle: true,
      background: CarouselSlider(
        options: CarouselOptions(
          // height: 400.0,
          viewportFraction: 1,
          autoPlay: true,
          enableInfiniteScroll: true,
          scrollDirection: Axis.horizontal,
          enlargeCenterPage: true,
          autoPlayInterval: const Duration(seconds: 5),
          autoPlayAnimationDuration: const Duration(milliseconds: 500),
        ),
        items: [1, 2, 3, 4, 5].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return CachedNetworkImage(
                imageUrl:
                    'https://images.unsplash.com/flagged/photo-1554473675-d0904f3cbf38?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
                progressIndicatorBuilder: (context, url, progress) =>
                    CircularProgressIndicator(value: progress.progress),
                fit: BoxFit.cover,
                width: double.infinity,
              );
            },
          );
        }).toList(),
      ),
    );
    return Scaffold(
      body: NestedScrollView(
        controller: scrollController,
        headerSliverBuilder: (context, isScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              expandedHeight: 200,
              flexibleSpace: flexibleSpaceBar,
              actions: [
                PinnedChats(),
                ChatSettings(),
              ],
            ),
            SliverPersistentHeader(
              pinned: true,
              // floating: true,
              delegate: _SliverAppBarDelegate(
                child: TabBar(
                  controller: _tabController,
                  labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                  tabs: tabs,
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Chat(
              messages: messages,
              scrollController: messageScrollController,
              textFieldOnFocus: () {
                scrollController.animateTo(
                  scrollController.position.maxScrollExtent,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.decelerate,
                );
              },
            ),
            Container(child: Text('Texter')),
          ],
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.child,
  });

  final TabBar child;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      child: child,
    );
  }

  @override
  double get maxExtent => child.preferredSize.height;

  @override
  double get minExtent => child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
