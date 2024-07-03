import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:bookly_app/features/search/presentation/view%20models/cubits/search_results_cubit/search_results_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchResultsCubit, SearchResultsState>(
      builder: (context, state) {
        if (state is SearchResultsSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: BestSellerListViewItem(book: state.books[index]),
                );
              },
              childCount: state.books.length,
            ),
          );
        } else if (state is SearchResultsFailure) {
          return SliverFillRemaining(
            child: CustomErrorWidget(
              errorMessage: state.errorMessage,
            ),
          );
        } else if (state is SearchResultsLoading) {
          return const SliverFillRemaining(
            child: CustomLoadingIndicator(),
          );
        } else {
          return const SliverFillRemaining();
        }
      },
    );
  }
}
