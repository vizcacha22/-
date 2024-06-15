import 'package:LongLaoshi/language_selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/app_export.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Future.wait([
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
    PrefUtils().init()
  ]).then((value) {
    runApp(ProviderScope(child: MyApp()));
  });
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          theme: theme,
          title: 'LongLaoshi',
          navigatorKey: NavigatorService.navigatorKey,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            AppLocalizationDelegate(),
            //GlobalMaterialLocalizations.delegate,
            //GlobalWidgetsLocalizations.delegate,
            //GlobalCupertinoLocalizations.delegate
          ],
          supportedLocales: [
            Locale(
              'en',
              '',
            )
          ],
          initialRoute: AppRoutes
              .registroScreen, // Set the initial route to the RegistroScreen
          home:
              LanguageSelectionScreen(), // Set the HomeScreen as the home route
          routes: AppRoutes.routes,
        );
      },
    );
  }
}
