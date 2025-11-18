/// Model class representing user profile data
class UserProfile {
  final String userName;
  final String? school;
  final String? major;
  final String? interests;
  final String? background;
  final String? profileImagePath;

  UserProfile({
    required this.userName,
    this.school,
    this.major,
    this.interests,
    this.background,
    this.profileImagePath,
  });

  /// Create a copy of the profile with updated fields
  UserProfile copyWith({
    String? userName,
    String? school,
    String? major,
    String? interests,
    String? background,
    String? profileImagePath,
  }) {
    return UserProfile(
      userName: userName ?? this.userName,
      school: school ?? this.school,
      major: major ?? this.major,
      interests: interests ?? this.interests,
      background: background ?? this.background,
      profileImagePath: profileImagePath ?? this.profileImagePath,
    );
  }

  /// Convert to JSON for storage
  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'school': school,
      'major': major,
      'interests': interests,
      'background': background,
      'profileImagePath': profileImagePath,
    };
  }

  /// Create from JSON
  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      userName: json['userName'] as String,
      school: json['school'] as String?,
      major: json['major'] as String?,
      interests: json['interests'] as String?,
      background: json['background'] as String?,
      profileImagePath: json['profileImagePath'] as String?,
    );
  }
}
