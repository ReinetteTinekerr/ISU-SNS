import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:university_chat_app/core/pages/init.dart';
import 'package:university_chat_app/domain/data/data.dart';
import 'package:university_chat_app/domain/models/post.dart';
import 'package:university_chat_app/widgets/page_stats.dart';
import 'package:university_chat_app/widgets/post_container.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Home'),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.post_add_outlined),
        onPressed: () {},
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            shape: const ContinuousRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            actions: [Container()],
            // pinned: true,
            automaticallyImplyLeading: false,
            expandedHeight: 260,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'ISU Echague',
                style: TextStyle(
                  overflow: TextOverflow.fade,
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      blurRadius: 10.0,
                    )
                  ],
                ),
              ),
              centerTitle: true,
              background: CachedNetworkImage(
                imageUrl:
                    'https://images.unsplash.com/20/cambridge.JPG?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib',
                progressIndicatorBuilder: (context, url, progress) =>
                    CircularProgressIndicator(value: progress.progress),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              // color: Colors.greenAccent,
              height: 50,
              child: PageStats(),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final Post post = posts[index];
                return PostContainer(post: post);
              },
              childCount: posts.length,
            ),
          ),
        ],
      ),
    );
  }
}
