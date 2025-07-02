import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'custom_list_view_item.dart';

class BooksCarousel extends StatelessWidget {
  final List<String> bookImages;

  const BooksCarousel({super.key, required this.bookImages});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 250,
        enlargeCenterPage: true,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 1),
        autoPlayAnimationDuration: Duration(milliseconds: 300),
        viewportFraction: 0.5,
      ),
      items: bookImages.map((imageUrl) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: CustomListViewItem(imageUrl: imageUrl),
        );
      }).toList(),
    );
  }
}
