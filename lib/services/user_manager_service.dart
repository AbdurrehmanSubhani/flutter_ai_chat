import 'package:flutter_chat_core/flutter_chat_core.dart';

class UserManagerService {
  late User user;

  void initUser(User user) {
    this.user = user;
  }

  User getTestUser() {
    return const User(
      id: 'test_user_id',
      name: 'Test User',
      imageSource:
          'https://img.freepik.com/free-psd/3d-illustration-person-with-sunglasses_23-2149436188.jpg',
    );
  }

  User getAIUser() {
    return const User(
      id: 'ai_user_id',
      name: 'AI User',
      imageSource:
          'https://gravatar.com/avatar/1f82b0492a0a938288c2d5b70534a1fb?s=400&d=robohash&r=x',
    );
  }

  User getUserById(String id) {
    if (id == user.id) {
      return user;
    } else if (id == getTestUser().id) {
      return getTestUser();
    } else if (id == getAIUser().id) {
      return getAIUser();
    }
    throw Exception('User not found');
  }
}
