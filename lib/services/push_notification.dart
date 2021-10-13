class PushNotificationsManager {
  PushNotificationsManager._();

  factory PushNotificationsManager() => _instance;

  static final PushNotificationsManager _instance =
      PushNotificationsManager._();

  Future<void> init() async {
    // if (!_initialized) {
    //   // For iOS request permission first.
    //   _firebaseMessaging.requestPermission();
    //   _firebaseMessaging.setAutoInitEnabled(true);

    //   // For testing purposes print the Firebase Messaging token
    //   String token = await _firebaseMessaging.getToken();
    //   print("FirebaseMessaging token: $token");

    //   _initialized = true;
    // }
  }
}
