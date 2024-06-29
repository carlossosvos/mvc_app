import 'package:firebase_core/firebase_core.dart';
import 'package:mvc_app/services/preferences_service.dart';
import 'firebase_options.dart';


// Función setup donde haremos inicializaciones de nuestros servicios.
Future<void> setup() async {
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await PreferencesService().init();

}
