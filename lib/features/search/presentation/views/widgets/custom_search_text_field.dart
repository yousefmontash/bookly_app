import 'package:bookly_app/features/search/presentation/view%20models/cubits/search_results_cubit/search_results_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return TextField(
      controller: controller,
      onSubmitted: (value) async {
        await BlocProvider.of<SearchResultsCubit>(context)
            .getSearchResults(query: value);
      },
      decoration: InputDecoration(
        hintText: "Search...",
        suffixIcon: IconButton(
          onPressed: () async {
            await BlocProvider.of<SearchResultsCubit>(context)
                .getSearchResults(query: controller.text);
          },
          icon: const Opacity(
            opacity: 0.7,
            child: Icon(
              Icons.search,
            ),
          ),
          iconSize: 25,
        ),
        enabledBorder: searchOutlineInputBorder(),
        focusedBorder: searchOutlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder searchOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: Colors.white,
      ),
    );
  }
}
