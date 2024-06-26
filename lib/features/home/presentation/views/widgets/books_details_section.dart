import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_price.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/featured_list_view_item.dart';
import 'package:flutter/cupertino.dart';

class BooksDetailsSection extends StatelessWidget {
  const BooksDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const SizedBox(
          height: 33,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.204),
          child: const FeaturedListViewItem(),
        ),
        const SizedBox(
          height: 40,
        ),
        const Text(
          "The Jungle Book",
          style: Styles.textStyle30,
        ),
        Opacity(
          opacity: 0.7,
          child: Text(
            "Rudyard Kipling",
            style: Styles.textStyle18SemiBold.copyWith(
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        const BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(
          height: 37,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: BookPrice(),
        ),
      ],
    );
  }
}
