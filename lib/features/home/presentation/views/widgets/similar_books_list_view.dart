import 'package:bookly_app/features/home/presentation/views/widgets/featured_list_view_item.dart';
import 'package:flutter/material.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .14,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: FeaturedListViewItem(
              aspectRatio: 5 / 8,
              imageUrl: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fpixlr.com%2Fimage-generator%2F&psig=AOvVaw1L0i9hGkUwHwGSnCKxHlAv&ust=1720028069004000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCLDmgILyiIcDFQAAAAAdAAAAABAE",
            ),
          );
        },
      ),
    );
  }
}
