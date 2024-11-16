import 'package:ecommerce/presentation/home/bloc/user_info_display_cubit.dart';
import 'package:ecommerce/presentation/home/bloc/user_info_display_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/configs/assets/app_images.dart';
import '../../../core/configs/assets/app_vectors.dart';
import '../../../core/configs/theme/app_colors.dart';
import '../../../domain/auth/entity/user.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserInfoDisplayCubit()..displayUserInfo(),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 40,
          right: 16,
          left: 16,
        ),
        child: BlocBuilder<UserInfoDisplayCubit, UserInfoDisplayState>(
          builder: (context, state) {
            if (state is UserInfoLoading){
              return const Center(child: CircularProgressIndicator());
            }
            if (state is UserInfoLoaded) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _profileImage(state.user),
                  _gender(state.user),
                  _card(),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  // Profile image widget
  Widget _profileImage(UserEntity user) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: user.image.isEmpty ? 
          const AssetImage(
            AppImages.profile
          ) : NetworkImage (
            user.image
          )
        ),
        color: Colors.white,
        shape: BoxShape.circle,
      ),
    );
  }

  // Gender widget
  Widget _gender(UserEntity user) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(
        horizontal: 16
      ),
      decoration: BoxDecoration(
        color: AppColors.secondBackground,
        borderRadius: BorderRadius.circular(100)
      ),
      child: Center(
        child: Text(
          user.gender == 1 ? 'Men' : 'Women',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
  // Card widget
  Widget _card() {
    return Container(
      height: 40,
      width: 40,
      decoration: const BoxDecoration(
        color: AppColors.primary,
        shape: BoxShape.circle
      ),
      child: SvgPicture.asset(
        AppVectors.bag,
        fit: BoxFit.none,
      ),
    );
  }
}