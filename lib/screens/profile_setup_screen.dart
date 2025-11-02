import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/storage_service.dart';
import 'main_screen.dart';

/// Profile setup screen where user enters additional information
class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _schoolController = TextEditingController();
  final _majorController = TextEditingController();
  final _interestsController = TextEditingController();
  final _backgroundController = TextEditingController();

  @override
  void dispose() {
    _schoolController.dispose();
    _majorController.dispose();
    _interestsController.dispose();
    _backgroundController.dispose();
    super.dispose();
  }

  Future<void> _handleSaveProfile() async {
    if (_formKey.currentState!.validate()) {
      final storageService = context.read<StorageService>();
      await storageService.updateProfile(
        school: _schoolController.text.trim(),
        major: _majorController.text.trim(),
        interests: _interestsController.text.trim(),
        background: _backgroundController.text.trim(),
      );

      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const MainScreen(),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final userName = context.watch<StorageService>().userProfile?.userName ?? '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Setup'),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Hi $userName!',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Tell us more about yourself',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.grey[600],
                      ),
                ),
                const SizedBox(height: 32),
                TextFormField(
                  controller: _schoolController,
                  decoration: const InputDecoration(
                    labelText: 'School',
                    hintText: 'Enter your school name',
                    prefixIcon: Icon(Icons.school),
                    border: OutlineInputBorder(),
                  ),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your school';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _majorController,
                  decoration: const InputDecoration(
                    labelText: 'Major',
                    hintText: 'Enter your major or field of study',
                    prefixIcon: Icon(Icons.book),
                    border: OutlineInputBorder(),
                  ),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your major';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _interestsController,
                  decoration: const InputDecoration(
                    labelText: 'Interests',
                    hintText: 'What are your interests?',
                    prefixIcon: Icon(Icons.favorite),
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please share your interests';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _backgroundController,
                  decoration: const InputDecoration(
                    labelText: 'Background',
                    hintText: 'Tell us about your background',
                    prefixIcon: Icon(Icons.history_edu),
                    border: OutlineInputBorder(),
                    alignLabelWithHint: true,
                  ),
                  maxLines: 4,
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please share your background';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: _handleSaveProfile,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Complete Profile',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
