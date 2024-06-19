import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';

class BestSellerListViewSliver extends StatelessWidget {
  const BestSellerListViewSliver({super.key});

  @override
  Widget build(BuildContext context) {
    // the solution for the issue of SliverFillRemaining
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return const Padding(
              padding: EdgeInsets.only(left: 30.0, right: 50, bottom: 20),
              child: BestSellerListViewItem());
        },
        childCount: 15,
      ),
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
