import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:university_chat_app/widgets/expand_modal_ui.dart';

class PinnedChats extends StatelessWidget {
  const PinnedChats({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return DraggableScrollableSheet(
              expand: false,
              builder: (context, scrollController) {
                return Column(
                  children: [
                    const ExpandModalUI(title: 'Pinned Messages'),
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
      },
      icon: const Icon(MdiIcons.pin),
    );
  }
}
