import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utsmobile/Booking_provider.dart';
import 'package:utsmobile/WalletProvider.dart';
import 'package:utsmobile/api.dart';
import 'package:utsmobile/firebase_options.dart';
import 'package:utsmobile/page/checkout.dart';
import 'package:utsmobile/page/CheckoutF.dart';
import 'package:utsmobile/page/bottonav.dart';
import 'package:utsmobile/page/confirmation.dart';
import 'package:utsmobile/page/edit_profile.dart';
import 'package:utsmobile/page/homeMovies.dart';
import 'package:utsmobile/page/movieDetails.dart';
import 'package:utsmobile/page/myticket.dart';
import 'package:utsmobile/page/mywallet.dart';
import 'package:utsmobile/page/profile.dart';
import 'package:utsmobile/page/selectPlaceDate.dart';
import 'package:utsmobile/page/selectSeat.dart';
import 'package:utsmobile/page/signin.dart';
import 'package:utsmobile/page/signup.dart';
import 'package:utsmobile/page/splash.dart';
import 'package:utsmobile/page/successcheckoutpage.dart';
import 'package:utsmobile/page/successtopup.dart';
import 'package:utsmobile/page/ticketdetails.dart';
import 'package:utsmobile/page/user_profile.dart';
import 'package:utsmobile/page/wallettopup.dart';
import 'package:utsmobile/Olah_data.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => olahData()),
        ChangeNotifierProvider(create: (context) => TmdbApi()),
        ChangeNotifierProvider(create: (context) => Bookingg()),
        ChangeNotifierProvider(create: (context) => Wallets()),
      ],
      // Inisialisasi DataProvider
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      // home:  profile(),
      routes: {
        '/': (context) => const SplashScreen(),
        '/bottomnav': (context) => const BottomNav(
              idx: 0,
            ),
        '/bottomnav1': (context) => const BottomNav(
              idx: 1,
            ),
        '/bottomnav2': (context) => const BottomNav(
              idx: 2,
            ),
        '/myticket': (context) => const myticket(),
        '/signin': (context) => const SignInPage(),
        '/signup': (context) => const SignUpPage(),
        '/profile': (context) => const profile(),
        '/checkout': (context) => const CheckOut(),
        '/checkoutf': (context) => const CheckoutF(),
        '/confirm': (context) => const ConfirmationPage(),
        '/homemovies': (context) => HomeMovies(),
        '/movedetails': (context) => const movieDetails(),
        '/mywallet': (context) => const mywallet(),
        '/selectdate': (context) => const selectPlaceDate(),
        '/selectseat': (context) => const selectSeat(),
        '/successcheckout': (context) => const SuccessCheckoutPage(),
        '/successtopup': (context) => const SuccessTopUp(),
        '/ticketdetails': (context) => const ticketdetails(),
        '/userprofile': (context) => UserProfilePage(),
        '/wallettopuup': (context) => const WalletTopUp(),
        '/editProfile': (context) => const edit_profile(),
      },
      initialRoute: '/',

      // home: StreamBuilder(
      //   stream: FirebaseAuth.instance.authStateChanges(),
      //   builder: (context, snapshot) {
      //     if (snapshot.hasData){
      //       return const homeMovies();
      //     }
      //     return SplashScreen();

      //   }
      // ),
    );
  }
}
