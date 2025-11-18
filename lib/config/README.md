# Profile Configuration Guide

This directory contains configuration files for the profile setup functionality.

## Features

### Multi-Select Majors
- Users can select **up to 3 majors**
- 37 predefined options available
- Searchable dialog interface

### Multi-Select Interests with Custom Options
- Users can select **up to 10 interests**
- 100+ predefined options organized by category
- **Users can add their own custom interests** not in the predefined list
- Searchable dialog interface

### Background Hints
- Helpful suggestions for travel experiences, work, and interesting facts

## Files

### `profile_config.dart`
Central configuration for all profile-related constants and data.

## Maintaining the Configuration

### Adding New Majors

To add new majors to the selection list:

1. Open `profile_config.dart`
2. Locate the `availableMajors` list
3. Add your new major(s) to the list in alphabetical order
4. Save the file

```dart
static const List<String> availableMajors = [
  'Computer Science',
  'Your New Major Here',  // Add here
  // ... rest of majors
];
```

### Adding New Interests

To add new interests:

1. Open `profile_config.dart`
2. Locate the `availableInterests` list
3. Add your new interest(s) in the appropriate category
4. Consider creating a new category if needed
5. Save the file

```dart
static const List<String> availableInterests = [
  // Technology & Innovation
  'Coding',
  'Your New Tech Interest',  // Add here
  
  // Creative Arts
  'Photography',
  'Your New Creative Interest',  // Add here
  // ... rest of interests
];
```

### Modifying Background Hints

To update the background field suggestions:

1. Open `profile_config.dart`
2. Locate the `backgroundHints` list
3. Add, remove, or modify hints as needed
4. Save the file

```dart
static const List<String> backgroundHints = [
  'Share your travel experiences',
  'Your new hint here',  // Add here
  // ... rest of hints
];
```

### Adjusting Maximum Selections

To change how many majors or interests a user can select:

1. Open `profile_config.dart`
2. Locate the selection limits
3. Change the values
4. Save the file

```dart
static const int maxInterestsSelection = 10;  // Change this number
static const int maxMajorsSelection = 3;      // Change this number
```

## Custom Interest Feature

### How It Works

Users can add their own custom interests in addition to selecting from the predefined list:

1. In the Interests dialog, users see an "Add custom interest" field
2. They type their custom interest and press "Add"
3. Custom interests appear as chips and can be selected/deselected
4. Custom interests are saved with their profile
5. Custom interests persist across sessions

### Benefits
- Flexibility for unique hobbies and interests
- No need to update the app for every possible interest
- Users feel more represented in their profiles

### Technical Details

The `MultiTagSelector` widget accepts an `allowCustom` parameter:

```dart
MultiTagSelector(
  title: 'Interests',
  availableTags: ProfileConfig.availableInterests,
  selectedTags: _selectedInterests,
  onSelected: (values) {
    setState(() => _selectedInterests = values);
  },
  maxSelection: ProfileConfig.maxInterestsSelection,
  allowCustom: true,  // Enables custom tag input
)
```

Custom tags are:
- Validated to not be empty
- Checked against duplicates
- Subject to the same max selection limit
- Stored as strings alongside predefined selections

## Production Considerations

### Loading from External Source

For production environments, you may want to load configurations from an API or database instead of hardcoding them. Here's how to extend:

1. Create a new service class:

```dart
class ProfileConfigService {
  Future<List<String>> fetchMajors() async {
    // Fetch from API
    final response = await http.get(Uri.parse('your-api-endpoint/majors'));
    return List<String>.from(jsonDecode(response.body));
  }
  
  Future<List<String>> fetchInterests() async {
    // Fetch from API
    final response = await http.get(Uri.parse('your-api-endpoint/interests'));
    return List<String>.from(jsonDecode(response.body));
  }
}
```

2. Update widgets to use async data:

```dart
class ProfileSetupScreen extends StatefulWidget {
  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  List<String> _majors = [];
  List<String> _interests = [];
  bool _isLoading = true;
  
  @override
  void initState() {
    super.initState();
    _loadConfigurations();
  }
  
  Future<void> _loadConfigurations() async {
    final service = ProfileConfigService();
    final majors = await service.fetchMajors();
    final interests = await service.fetchInterests();
    
    setState(() {
      _majors = majors;
      _interests = interests;
      _isLoading = false;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    
    return SingleTagSelector(
      title: 'Major',
      availableTags: _majors,  // Use fetched data
      // ... rest of configuration
    );
  }
}
```

### Caching Remote Configurations

To improve performance, cache the configurations:

```dart
class ProfileConfigService {
  static final ProfileConfigService _instance = ProfileConfigService._internal();
  factory ProfileConfigService() => _instance;
  ProfileConfigService._internal();
  
  List<String>? _cachedMajors;
  List<String>? _cachedInterests;
  DateTime? _lastFetch;
  
  Future<List<String>> getMajors({bool forceRefresh = false}) async {
    if (!forceRefresh && 
        _cachedMajors != null && 
        _lastFetch != null &&
        DateTime.now().difference(_lastFetch!) < Duration(hours: 24)) {
      return _cachedMajors!;
    }
    
    _cachedMajors = await _fetchMajorsFromApi();
    _lastFetch = DateTime.now();
    return _cachedMajors!;
  }
}
```

### Internationalization (i18n)

For multi-language support:

1. Use `flutter_localizations` package
2. Create translation files for each language
3. Update configuration to use localized strings:

```dart
class ProfileConfig {
  static List<String> getAvailableMajors(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return [
      localizations.majorComputerScience,
      localizations.majorEngineering,
      // ... etc
    ];
  }
}
```

## Validation

The configuration includes validation methods:

- `isValidMajor(String major)` - Check if a major exists in the list
- `isValidInterest(String interest)` - Check if an interest exists in the list

Use these when loading user profiles to ensure data integrity:

```dart
void loadUserProfile(UserProfile profile) {
  if (profile.major != null && !ProfileConfig.isValidMajor(profile.major!)) {
    // Handle invalid major (perhaps from old data)
    print('Warning: Invalid major "${profile.major}" found');
  }
}
```

## Testing

When adding new configurations, ensure they work correctly:

```dart
void main() {
  test('New major is available', () {
    expect(
      ProfileConfig.availableMajors.contains('Your New Major'),
      isTrue,
    );
  });
  
  test('Search functionality works', () {
    final results = ProfileConfig.searchMajors('comput');
    expect(results.contains('Computer Science'), isTrue);
  });
}
```

## Migration Strategy

When updating configurations that affect existing user data:

1. Keep old values in the list temporarily
2. Add new values
3. Provide migration logic if needed
4. Remove old values after a grace period

```dart
// Version 1.0 - Old
static const List<String> availableMajors = [
  'CS',  // Old abbreviation
];

// Version 2.0 - Transitioning
static const List<String> availableMajors = [
  'Computer Science',  // New full name
  'CS',  // Keep old for backwards compatibility
];

// Migration helper
static String migrateMajor(String oldMajor) {
  const migrations = {
    'CS': 'Computer Science',
    'EE': 'Electrical Engineering',
  };
  return migrations[oldMajor] ?? oldMajor;
}
```
