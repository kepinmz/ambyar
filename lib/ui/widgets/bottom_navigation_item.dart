import 'package:ambyar_app/cubit/page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ambyar_app/shared/theme.dart';

class BottomNavigationItem extends StatelessWidget {
  final int index;
  final String imageUrl;
  const BottomNavigationItem({
    Key? key,
    required this.index,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PageCubit>().setPage(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          Image.asset(
            imageUrl,
            width: 24,
            height: 24,
            color: context.read<PageCubit>().state == index
                ? kWhiteColor
                : kBackgroundColor,
          ),
          Container(
            width: 30,
            height: 3,
            decoration: BoxDecoration(
              color: context.read<PageCubit>().state == index
                  ? kWhiteColor
                  : kTrasnparentColor,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ],
      ),
    );
  }
}
