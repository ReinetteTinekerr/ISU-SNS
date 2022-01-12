import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:university_chat_app/core/pages/init.dart';
import 'package:university_chat_app/domain/data/data.dart';
import 'package:university_chat_app/widgets/expand_modal_ui.dart';
import 'package:university_chat_app/widgets/post_container.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  Future<void> showModal(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          builder: (context, scrollController) {
            return Column(
              children: [
                const ExpandModalUI(title: 'Create post'),
                Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(border: Border.all()),
                        padding: const EdgeInsets.all(4),
                        child: Text('$index'),
                      );
                    },
                    itemCount: 30,
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'Student Voice',
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.post_add_outlined),
          onPressed: () {
            showModal(context);
          },
        ),
        body: ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return PostContainer(post: post);
            }));
  }
}
