/// Configuration for profile fields
/// This file contains static configurations that can be easily maintained and extended
class ProfileConfig {
  // Private constructor to prevent instantiation
  ProfileConfig._();

  /// Available majors for selection
  /// Add or remove majors as needed for your institution
  static const List<String> availableMajors = [
    'Computer Science',
    'Software Engineering',
    'Data Science',
    'Information Systems',
    'Electrical Engineering',
    'Mechanical Engineering',
    'Civil Engineering',
    'Chemical Engineering',
    'Business Administration',
    'Economics',
    'Finance',
    'Marketing',
    'Accounting',
    'Psychology',
    'Biology',
    'Chemistry',
    'Physics',
    'Mathematics',
    'Statistics',
    'English Literature',
    'History',
    'Political Science',
    'Sociology',
    'Anthropology',
    'Philosophy',
    'Art & Design',
    'Architecture',
    'Music',
    'Theater',
    'Film Studies',
    'Communications',
    'Journalism',
    'Education',
    'Nursing',
    'Medicine',
    'Law',
    'Environmental Science',
    'Other',
  ];

  /// Available interests for selection
  /// Organized by categories for better user experience
  static const List<String> availableInterests = [
    // Technology & Innovation
    'Coding',
    'Web Development',
    'Mobile Apps',
    'AI & Machine Learning',
    'Robotics',
    'Gaming',
    'Virtual Reality',
    'Blockchain',
    
    // Creative Arts
    'Photography',
    'Videography',
    'Graphic Design',
    'Drawing',
    'Painting',
    'Music',
    'Singing',
    'Playing Instruments',
    'Dancing',
    'Theater',
    'Writing',
    'Poetry',
    
    // Sports & Fitness
    'Basketball',
    'Football',
    'Soccer',
    'Tennis',
    'Swimming',
    'Running',
    'Cycling',
    'Hiking',
    'Rock Climbing',
    'Yoga',
    'Gym/Fitness',
    'Martial Arts',
    
    // Food & Cooking
    'Cooking',
    'Baking',
    'Food Photography',
    'Trying New Restaurants',
    'Coffee',
    'Wine Tasting',
    
    // Entertainment & Media
    'Movies',
    'TV Shows',
    'Anime',
    'Reading',
    'Comics',
    'Podcasts',
    
    // Travel & Adventure
    'Travel',
    'Backpacking',
    'Road Trips',
    'Camping',
    'Beach Activities',
    'Mountain Activities',
    
    // Social & Community
    'Volunteering',
    'Community Service',
    'Event Planning',
    'Networking',
    'Public Speaking',
    
    // Learning & Development
    'Languages',
    'Online Courses',
    'Workshops',
    'Reading Non-Fiction',
    'Research',
    
    // Hobbies & Leisure
    'Board Games',
    'Card Games',
    'Puzzles',
    'Collecting',
    'DIY Projects',
    'Gardening',
    'Pets',
    'Fashion',
    'Shopping',
    'Meditation',
    
    // Business & Entrepreneurship
    'Entrepreneurship',
    'Startups',
    'Investing',
    'Stock Trading',
    'Real Estate',
  ];

  /// Background field hints to guide users
  static const List<String> backgroundHints = [
    'Share your travel experiences (e.g., "Backpacked through Europe last summer")',
    'Mention your work experience (e.g., "Interned at Google", "Worked at a startup")',
    'Include interesting facts (e.g., "Speaks 3 languages", "Published author")',
    'Describe your achievements (e.g., "Won hackathon", "Started a club")',
    'Share your goals (e.g., "Aspiring entrepreneur", "Future doctor")',
  ];

  /// Get a single combined background hint
  static String get backgroundHint {
    return backgroundHints.join('\n• ');
  }

  /// Get a short background hint for input decoration
  static String get backgroundHintShort {
    return 'E.g., travel experiences, work, interesting facts about you...';
  }

  /// Maximum number of interests that can be selected
  static const int maxInterestsSelection = 10;
  
  /// Maximum number of majors that can be selected
  static const int maxMajorsSelection = 3;

  /// Validation: Check if major is valid
  static bool isValidMajor(String major) {
    return availableMajors.contains(major);
  }

  /// Validation: Check if interest is valid (includes custom interests)
  static bool isValidInterest(String interest) {
    // Allow custom interests - just check if not empty
    return interest.trim().isNotEmpty;
  }
  
  /// Check if interest is from predefined list
  static bool isPredefinedInterest(String interest) {
    return availableInterests.contains(interest);
  }

  /// Get majors filtered by search query
  static List<String> searchMajors(String query) {
    if (query.isEmpty) return availableMajors;
    
    final lowerQuery = query.toLowerCase();
    return availableMajors
        .where((major) => major.toLowerCase().contains(lowerQuery))
        .toList();
  }

  /// Get interests filtered by search query
  static List<String> searchInterests(String query) {
    if (query.isEmpty) return availableInterests;
    
    final lowerQuery = query.toLowerCase();
    return availableInterests
        .where((interest) => interest.toLowerCase().contains(lowerQuery))
        .toList();
  }
}
