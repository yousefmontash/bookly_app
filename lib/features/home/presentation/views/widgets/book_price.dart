import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BookPrice extends StatelessWidget {
  const BookPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            textStyle: Styles.textStyle18SemiBold.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            backgroundColor: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
            textData: "19.99€",
          ),
        ),
        Expanded(
          child: CustomButton(
            textStyle: Styles.textStyle16Medium.copyWith(
              color: Colors.white,
              fontFamily: kGilroy,
              fontWeight: FontWeight.bold,
            ),
            backgroundColor: const Color(0xffEF8262),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            textData: "Free Preview",
          ),
        ),
      ],
    );
  }
}
