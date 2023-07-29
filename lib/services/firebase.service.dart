import 'package:firebase_core/firebase_core.dart';
import 'package:maid/firebase_options.dart';

class FirebaseService {
  Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
