import 'package:flutter_test/flutter_test.dart';
import 'package:playground/services/storage_service.dart';
import 'package:playground/services/api_service.dart';
import 'package:openapi/openapi.dart';

void main() {
  group('Activity Selection Integration Tests', () {
    late ApiService apiService;
    late StorageService storageService;

    setUp(() {
      apiService = ApiService();
      storageService = StorageService();
    });

    test('should load activities from API and use them for invitations', () async {
      try {
        // Load activities from API
        final activities = await apiService.getActivities();
        expect(activities.isNotEmpty, true);
        print('Loaded ${activities.length} activities from API');
        
        // Get first activity for testing
        final firstActivity = activities.first;
        print('Using activity: ${firstActivity.name} (${firstActivity.id})');

        // Test that we can create an invitation with this activity
        final invitationCreate = InvitationCreate((b) => b
          ..senderId = 1
          ..receiverId = 2
          ..activityId = firstActivity.id
          ..restaurant = firstActivity.name // Use activity name as restaurant
          ..status = 'pending'
          ..sentByMe = true
          ..nameCardCollected = false
          ..chatOpened = false);

        final result = await apiService.createInvitation(invitationCreate);
        expect(result.id, isNotEmpty);
        expect(result.activityId, firstActivity.id);
        expect(result.restaurant, firstActivity.name);
        
        print('Successfully created invitation with activity: ${result.id}');
      } catch (e) {
        fail('Failed to create invitation with activity: $e');
      }
    });
  });
}