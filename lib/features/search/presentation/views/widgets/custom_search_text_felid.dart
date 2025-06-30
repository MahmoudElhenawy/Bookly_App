import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextFiled extends StatelessWidget {
  final Function(String) onSearch;

  const CustomSearchTextFiled({super.key, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onSearch,
      decoration: InputDecoration(
        enabledBorder: BulidOutlineInputBorder(),
        focusedBorder: BulidOutlineInputBorder(),
        hintText: 'Search',
        suffixIcon: const Icon(
          FontAwesomeIcons.magnifyingGlass,
          size: 22,
        ),
        labelText: 'Search',
        labelStyle: Styles.textStyle16,
      ),
    );
  }

  OutlineInputBorder BulidOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.white),
    );
  }
}
