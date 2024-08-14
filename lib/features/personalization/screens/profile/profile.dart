import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/images/circular_image.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UAppBar(
        title: Text('Profile'),
        showBackArrow: true,
      ),

      /// -- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(USizes.defaultSpace),
          child: Column(
            children: [
              /// -- Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const UCircularImage(
                      imageString: UImages.user,
                      backgroundColor: Colors.transparent,
                      height: 80,
                      width: 80,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Change Profile Picture'),
                    ),
                  ],
                ),
              ),

              /// -- Divider
              const SizedBox(height: USizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: USizes.spaceBtwItems),

              /// Profile Information
              const USectionHeading(title: 'Profile Information'),
              const SizedBox(height: USizes.spaceBtwItems),
              UProfileMenu(
                  title: 'Name', value: 'Falola Victor', onPressed: () {}),
              UProfileMenu(
                  title: 'Username', value: 'ssoft3148', onPressed: () {}),

              /// -- Divider
              const SizedBox(height: USizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: USizes.spaceBtwItems),

              /// Personal Information
              const USectionHeading(title: 'Personal Information'),
              const SizedBox(height: USizes.spaceBtwItems),
              UProfileMenu(
                title: 'User ID',
                value: '567784',
                onPressed: () {},
                icon: Iconsax.copy,
              ),
              UProfileMenu(
                  title: 'E-mail',
                  value: 'soft.falola@gmail.com',
                  onPressed: () {}),
              UProfileMenu(
                  title: 'Phone Number',
                  value: '+234 9155975747',
                  onPressed: () {}),
              UProfileMenu(title: 'Gender', value: 'Male', onPressed: () {}),
              UProfileMenu(
                  title: 'Date of Birth',
                  value: '8 Dec, 2004',
                  onPressed: () {}),

              const Divider(),
              const SizedBox(height: USizes.spaceBtwItems),

              /// -- Close Account
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Close Account',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
