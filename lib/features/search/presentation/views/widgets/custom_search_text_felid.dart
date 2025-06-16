import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextFiled extends StatelessWidget {
  const CustomSearchTextFiled({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          enabledBorder: BulidOutlineInputBorder(),
          focusedBorder: BulidOutlineInputBorder(),
          hintText: 'Search',
          suffixIcon: const Icon(
            FontAwesomeIcons.magnifyingGlass,
            size: 22,
          ),
          labelText: 'Search',
          labelStyle: Styles.textStyle16),
    );
  }

  OutlineInputBorder BulidOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.white),
    );
  }
}
