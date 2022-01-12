import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PageStats extends StatelessWidget {
  const PageStats({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          _PageButton(
            icon: Icon(
              MdiIcons.thumbUpOutline,
              size: 20.0,
            ),
            label: 'Like',
            onTap: () => print('Like'),
          ),
          _PageButton(
            icon: Icon(
              MdiIcons.commentOutline,
              size: 20.0,
            ),
            label: 'Message',
            onTap: () => print('Message'),
          ),
          _PageButton(
            icon: Icon(
              Icons.public,
              size: 25.0,
            ),
            label: 'Webpage',
            onTap: () => print('Webpage'),
          ),
          _PageButton(
            icon: Icon(
              Icons.info,
              size: 25.0,
            ),
            label: 'Info',
            onTap: () => print('Info'),
          ),
        ],
      ),
    );
  }
}

class _PageButton extends StatelessWidget {
  const _PageButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  final Icon icon;
  final String label;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: IconButton(
        icon: icon,
        onPressed: onTap,
      ),
    );
  }
}
