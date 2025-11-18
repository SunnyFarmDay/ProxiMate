import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

/// Widget for picking and cropping profile images
class ProfileImagePicker extends StatelessWidget {
  final String? currentImagePath;
  final Function(String?) onImageSelected;
  final double radius;

  const ProfileImagePicker({
    super.key,
    this.currentImagePath,
    required this.onImageSelected,
    this.radius = 60,
  });

  Future<void> _pickAndCropImage(BuildContext context) async {
    try {
      // Pick image from gallery or camera
      final source = await _showImageSourceDialog(context);
      if (source == null) {
        debugPrint('Image source selection cancelled');
        return;
      }

      debugPrint('Picking image from: ${source == ImageSource.camera ? 'Camera' : 'Gallery'}');
      
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(
        source: source,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 85,
      );

      if (pickedFile == null) {
        debugPrint('No image picked');
        return;
      }

      debugPrint('Image picked: ${pickedFile.path}');
      
      // Check if file exists
      final file = File(pickedFile.path);
      final exists = await file.exists();
      debugPrint('Picked file exists: $exists, size: ${exists ? await file.length() : 0}');

      // Crop the image with circle overlay
      debugPrint('Starting image crop...');
      debugPrint('Calling ImageCropper().cropImage with path: ${pickedFile.path}');
      
      try {
        final croppedFile = await ImageCropper().cropImage(
          sourcePath: pickedFile.path,
          compressFormat: ImageCompressFormat.jpg,
          compressQuality: 85,
          aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
          uiSettings: [
            AndroidUiSettings(
              toolbarTitle: 'Crop Profile Image',
              toolbarColor: Colors.deepPurple,
              toolbarWidgetColor: Colors.white,
              statusBarColor: Colors.deepPurple,
              backgroundColor: Colors.black,
              initAspectRatio: CropAspectRatioPreset.square,
              lockAspectRatio: true,
              hideBottomControls: true,
              cropStyle: CropStyle.circle,
              showCropGrid: false,
              activeControlsWidgetColor: Colors.deepPurple,
              cropFrameColor: Colors.white,
              cropGridColor: Colors.white,
              dimmedLayerColor: Colors.black.withOpacity(0.8),
            ),
            IOSUiSettings(
              title: 'Crop Profile Image',
              aspectRatioLockEnabled: true,
              cropStyle: CropStyle.circle,
              resetAspectRatioEnabled: false,
            ),
          ],
        );

        debugPrint('Crop completed. Result: ${croppedFile?.path ?? 'null'}');

        if (croppedFile != null && croppedFile.path.isNotEmpty) {
          debugPrint('Image cropped successfully: ${croppedFile.path}');
          onImageSelected(croppedFile.path);
          
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Profile image updated'),
                backgroundColor: Colors.green,
                duration: Duration(seconds: 1),
              ),
            );
          }
        } else {
          debugPrint('Image crop cancelled or failed - croppedFile is null');
          // Fallback: use the original picked image
          debugPrint('Using original picked image as fallback');
          onImageSelected(pickedFile.path);
          
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Using original image (crop skipped)'),
                backgroundColor: Colors.orange,
                duration: Duration(seconds: 2),
              ),
            );
          }
        }
      } catch (cropError) {
        debugPrint('Error during crop: $cropError');
        debugPrint('Using original picked image due to error');
        // Fallback: use the original picked image
        onImageSelected(pickedFile.path);
        
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Using original image (crop failed: $cropError)'),
              backgroundColor: Colors.orange,
              duration: Duration(seconds: 2),
            ),
          );
        }
      }
    } catch (e) {
      debugPrint('Error picking/cropping image: $e');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to pick image: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<ImageSource?> _showImageSourceDialog(BuildContext context) async {
    return showDialog<ImageSource>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Choose Image Source'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Gallery'),
              onTap: () => Navigator.pop(context, ImageSource.gallery),
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera'),
              onTap: () => Navigator.pop(context, ImageSource.camera),
            ),
          ],
        ),
      ),
    );
  }

  void _showImageOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Change Photo'),
              onTap: () {
                Navigator.pop(context);
                _pickAndCropImage(context);
              },
            ),
            if (currentImagePath != null)
              ListTile(
                leading: const Icon(Icons.delete, color: Colors.red),
                title: const Text('Remove Photo', style: TextStyle(color: Colors.red)),
                onTap: () {
                  Navigator.pop(context);
                  onImageSelected(null);
                },
              ),
            ListTile(
              leading: const Icon(Icons.cancel),
              title: const Text('Cancel'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('ProfileImagePicker build - currentImagePath: $currentImagePath');
    
    return GestureDetector(
      onTap: () => _showImageOptions(context),
      child: Stack(
        children: [
          CircleAvatar(
            key: ValueKey(currentImagePath), // Force rebuild when path changes
            radius: radius,
            backgroundColor: Theme.of(context).primaryColor,
            backgroundImage: currentImagePath != null && currentImagePath!.isNotEmpty
                ? FileImage(File(currentImagePath!))
                : null,
            child: currentImagePath == null || currentImagePath!.isEmpty
                ? Icon(
                    Icons.person,
                    size: radius * 1.2,
                    color: Colors.white,
                  )
                : null,
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
              ),
              padding: const EdgeInsets.all(8),
              child: Icon(
                currentImagePath == null ? Icons.add_a_photo : Icons.edit,
                color: Colors.white,
                size: radius * 0.35,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
