import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/features/home/presentation/view%20models/cubits/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListViewSliver extends StatelessWidget {
  const BestSellerListViewSliver({super.key});

  @override
  Widget build(BuildContext context) {
    // the solution for the issue of SliverFillRemaining
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 30.0, right: 50, bottom: 20),
                  child: BestSellerListViewItem(
                    book: state.books[index],
                  ),
                );
              },
              childCount: state.books.length,
            ),
          );
        } else if (state is NewestBooksFailure) {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(
              errorMessage: state.errorMessage,
            ),
          );
        } else {
          return const SliverToBoxAdapter(
            child: CustomLoadingIndicator(),
          );
        }
      },
    );

    // return ListView.builder(
    //   physics: const NeverScrollableScrollPhysics(),
    //   padding: EdgeInsets.zero,
    //   itemCount: 15,
    //   itemBuilder: (context, index) {
    //     return const Padding(
    //       padding: EdgeInsets.only(left: 30.0, right: 50, bottom: 20),
    //       child: BestSellerListViewItem(),
    //     );
    //   },
    // );
  }
}
