# Profile App

A modular and maintainable Flutter mobile application with user registration and profile management.

## Project Structure

```
lib/
├── main.dart                    # App entry point with provider setup
├── models/                      # Data models
│   └── user_profile.dart       # User profile data model
├── services/                    # Business logic and data management
│   └── storage_service.dart    # In-memory storage service with ChangeNotifier
├── screens/                     # Full-screen pages
│   ├── register_screen.dart    # User registration (username only)
│   ├── profile_setup_screen.dart # Profile setup (school, major, interests, background)
│   └── main_screen.dart        # Main app screen with tab navigation
└── widgets/                     # Reusable UI components
    └── profile_tab.dart        # Profile display tab
```

## Features

### 1. Registration Screen
- Simple username input with validation
- Clean, modern UI with Material Design 3
- Smooth navigation to profile setup

### 2. Profile Setup Screen
- Collects additional user information:
  - School name
  - Major/field of study
  - Interests
  - Background
- Form validation for all fields
- Multi-line text input for longer responses

### 3. Main Screen
- Tab-based navigation using NavigationBar
- Currently includes Profile tab
- Easily extensible for additional tabs

### 4. Profile Tab
- Displays all user information in card format
- Clean visual hierarchy with icons
- Logout functionality with confirmation dialog

## Architecture Highlights

### State Management
- Uses **Provider** package for simple and effective state management
- `StorageService` extends `ChangeNotifier` for reactive updates
- Clean separation between UI and business logic

### Modularity
- **Models**: Separate data structures with JSON serialization support
- **Services**: Centralized business logic and data management
- **Screens**: Individual full-screen pages with single responsibility
- **Widgets**: Reusable UI components

### Code Quality
- Proper null safety implementation
- Form validation throughout
- Resource cleanup (TextEditingController disposal)
- Proper use of const constructors for performance

## Getting Started

1. **Install dependencies:**
   ```bash
   flutter pub get
   ```

2. **Run the app:**
   ```bash
   flutter run
   ```

## Future Enhancements

- Persistent storage using shared_preferences or local database
- Additional tabs (Settings, Activity, etc.)
- Profile editing functionality
- Image upload for profile picture
- Backend integration for multi-device sync

## Dependencies

- `flutter`: SDK
- `provider`: ^6.1.2 - State management
- `cupertino_icons`: ^1.0.8 - iOS-style icons

## Notes

- Currently uses in-memory storage (data is lost on app restart)
- Ready for persistent storage integration
- Follows Flutter best practices and Material Design guidelines
