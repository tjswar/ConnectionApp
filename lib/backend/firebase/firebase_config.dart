import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBmw-aiWjlOp36G3wCV9yfLPSqdl2MChS4",
            authDomain: "connectionapp-7afda.firebaseapp.com",
            projectId: "connectionapp-7afda",
            storageBucket: "connectionapp-7afda.appspot.com",
            messagingSenderId: "637974148074",
            appId: "1:637974148074:web:d64f2624fcbe2baadab893",
            measurementId: "G-946Y0C4WDJ"));
  } else {
    await Firebase.initializeApp();
  }
}
