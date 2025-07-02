import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/widgets/custom_error_mesage.dart';
import 'package:bookly/core/widgets/custom_loading_indecator.dart';
import 'package:bookly/features/home/presentation/manger/feature_books_cubit/featurebooks_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturebooksCubit, FeaturebooksState>(
      builder: (context, state) {
        if (state is FeaturebooksSuccess) {
          return CarouselSlider(
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height * 0.3,
              enlargeCenterPage: true,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 1),
              viewportFraction: 0.45,
            ),
            items: state.books.map((book) {
              return GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(
                    AppRouter.bookDetiles,
                    extra: book,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: CustomListViewItem(
                    imageUrl: book.volumeInfo.imageLinks?.thumbnail ?? '',
                  ),
                ),
              );
            }).toList(),
          );
        } else if (state is FeaturebooksFailure) {
          return CustomErrorMesage(errMessage: state.errMessage);
        } else {
          return CustomLoadingIndecator();
        }
      },
    );
  }
}
