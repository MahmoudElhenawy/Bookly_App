import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:bookly/features/search/presentation/views/widgets/custom_search_text_felid.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: CustomSearchTextFiled(),
          ),
          SizedBox(
            height: 16,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Search Result',
              style: Styles.textStyle18,
            ),
          ),
          Expanded(
            child: SearchResultListView(),
          ),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: BestSellerListViewItem(),
          );
        });
  }
}
