import 'package:ecommerce/common/bloc/categories/categories_display_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/bloc/categories/categories_display_state.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesDisplayCubit()..displayCategories(),
      child: BlocBuilder<CategoriesDisplayCubit,CategoriesDisplayState>(
        builder: (context, state) {
          if (state is CategoriesLoading) {
            return const CircularProgressIndicator();
          }
          if (state is CategoriesLoaded) {
            return Column(
              children: [
                _seaAll(),
                const SizedBox(height: 20, ),
                _categories()
              ],
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _seaAll() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Categories',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16
              ),
            ),
            GestureDetector(
              onTap: (){
              },
              child: const Text(
                'See All',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16
                ),
              ),
            )
          ],
        ),
    );
  }

  Widget _categories() {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(
        horizontal: 16
      ),
        itemBuilder: (contetx,index) {
          return Column(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  )
                ),
              const SizedBox(height: 10,),
              Text(
                'Text',
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14
                ),
              )
            ],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 15),
        itemCount: 5,
      ),
    );
  }
}