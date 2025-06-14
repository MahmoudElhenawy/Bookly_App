import 'package:bookly/features/home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:bookly/features/home/presentation/views/widgets/custtom_book_detiles_app_bar.dart';
import 'package:flutter/material.dart';

class BookDetilesViewBody extends StatelessWidget {
  const BookDetilesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var Width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          CusttomBoohDetilesAppBar(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Width * 0.17),
            child: CustomListViewItem(),
          ),
        ],
      ),
    );
  }
}
