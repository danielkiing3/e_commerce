import 'package:e_commerce/data/repositories/user/user_repository.dart';
import 'package:e_commerce/features/shop/models/users/user_model.dart';
import 'package:e_commerce/utils/helpers/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepositoru = Get.put(UserRepository());

  /// Save user Record from any Registration Provider
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      if (userCredential != null) {
        // Convert name to First Name and Last Name
        final nameParts =
            UserModel.nameParts(userCredential.user?.displayName ?? '');
        final username =
            UserModel.generateUsername(userCredential.user?.displayName ?? '');

        // Map Data
        final user = UserModel(
            id: userCredential.user!.uid,
            firstName: nameParts[0],
            lastName:
                nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            username: username,
            email: userCredential.user!.email ?? '',
            phoneNumber: userCredential.user?.phoneNumber ?? '',
            profilePicture: userCredential.user?.photoURL ?? ' ');

        // Save user data in the db
        await userRepositoru.saveUserRecord(user);
      }
    } catch (e) {
      ULoaders.warningSnackBar(
        title: 'Data not saved',
        message:
            'Something went wrong while saving your information. You can re-save your data in the profile',
      );
    }
  }
}
