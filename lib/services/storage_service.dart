import 'package:flutter/foundation.dart';
import '../models/user_profile.dart';

/// Simple in-memory storage service for user profile
/// In production, this would use shared_preferences or a database
class StorageService extends ChangeNotifier {
  UserProfile? _userProfile;

  UserProfile? get userProfile => _userProfile;

  bool get hasUser => _userProfile != null;

  /// Save user name (registration step)
  Future<void> saveUserName(String userName) async {
    _userProfile = UserProfile(userName: userName);
    notifyListeners();
  }

  /// Update user profile with additional information
  Future<void> updateProfile({
    String? school,
    String? major,
    String? interests,
    String? background,
  }) async {
    if (_userProfile == null) return;

    _userProfile = _userProfile!.copyWith(
      school: school,
      major: major,
      interests: interests,
      background: background,
    );
    notifyListeners();
  }

  /// Clear all data
  void clearProfile() {
    _userProfile = null;
    notifyListeners();
  }
}
