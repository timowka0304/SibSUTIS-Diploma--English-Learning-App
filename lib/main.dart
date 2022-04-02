import 'package:easy_peasy/components/others/shared_pref_user.dart';
import 'package:easy_peasy/routes.dart';
import 'package:easy_peasy/screens/main/main_screen.dart';
import 'package:easy_peasy/size_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/onboarding/onboarding_screen.dart';

int? onBoardingScreenIsViewed;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  getOnboardInfo().then((gettedInfo) {
    onBoardingScreenIsViewed = gettedInfo;
  });

  await Firebase.initializeApp();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(const MaterialApp(
      title: "Easy Peasy",
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
      ),
      initialRoute: onBoardingScreenIsViewed != null
          ? MainScreenCheck.routeName
          : OnboardingScreen.routeName,
      routes: routes,
    );
  }
}
