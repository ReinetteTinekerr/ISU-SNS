import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    );
    return const Padding(
      padding: EdgeInsets.only(top: 8, left: 8, right: 8),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10.0),
          prefixIcon: Icon(
            Icons.search,
          ),
          hintText: 'Search',
          border: border,
        ),
      ),
    );
  }
}
