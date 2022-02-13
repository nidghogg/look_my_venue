import 'dart:io';

import '../locator.dart';
import '../models/user_model.dart';
import '../repository/auth_repo.dart';
import '../repository/storage_repo.dart';

class UserController {
  late UserModel _currentUser;
  final AuthRepo _authRepo = locator.get<AuthRepo>();

  final StorageRepo _storageRepo = locator.get<StorageRepo>();
  late Future init;

  UserController() {
    init = initUser();
  }

  Future<UserModel> initUser() async {
    _currentUser = await _authRepo.getUser();
    return _currentUser;
  }

  UserModel get currentUser => _currentUser;

  Future<void> uploadProfilePicture(File image) async {
    _currentUser.avatarUrl = await _storageRepo.uploadFile(image);
  }

  Future<String> getDownloadUrl() async {
    return await _storageRepo.getUserProfileImage(currentUser.uid);
  }

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    _currentUser = await _authRepo.signInWithEmailAndPassword(
        email: email, password: password);

    _currentUser.avatarUrl = await getDownloadUrl();
  }

  void updateDisplayName(String displayName) {
    _currentUser.displayName = displayName;
    _authRepo.updateDisplayName(displayName);
  }

  Future<bool> validateCurrentPassword(String password) async {
    return await _authRepo.validatePassword(password);
  }

  void updateUserPassword(String password) {
    _authRepo.updatePassword(password);
  }
}
