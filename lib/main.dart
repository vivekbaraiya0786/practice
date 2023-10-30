import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techinal_practice/controller/api/newscontroller.dart';
import 'package:techinal_practice/controller/api/weather_provider.dart';
import 'package:techinal_practice/controller/json/album_provider.dart';
import 'package:get/get.dart';
import 'package:techinal_practice/controller/json/pratice_controller.dart';
import 'package:techinal_practice/firebase_options.dart';
import 'package:techinal_practice/views/api/newshome.dart';
import 'package:techinal_practice/views/database/fetch_data.dart';
import 'package:techinal_practice/views/database/homepage.dart';
import 'package:techinal_practice/views/google_ads/ad_page.dart';
import 'package:techinal_practice/views/json/album_home_page.dart';
import 'package:techinal_practice/views/json/details_page.dart';
import 'package:techinal_practice/views/json/homepage.dart';
import 'package:techinal_practice/views/json/pratice_page.dart';
import 'package:techinal_practice/views/json/product_home.dart';
import 'package:techinal_practice/views/json/sholak_page.dart';
import 'package:techinal_practice/views/weather_api/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'controller/json/chepter_provider.dart';
import 'controller/json/prooduct_controller.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ChepterProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PraticeJsonProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AlbumProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => NewsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WeatherProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Product_Provider(),
        ),
      ],
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: "/Ad_Page",
          getPages: [
            GetPage(
              name: "/",
              page: () => const HomePage(),
            ),
            GetPage(
              name: "/Sholak_page",
              page: () => const Sholak_page(),
            ),
            GetPage(
              name: "/SholakDetailPage",
              page: () => const SholakDetailPage(),
            ),
            GetPage(
              name: "/Album_home",
              page: () => const Album_home(),
            ),
            GetPage(
              name: "/News_home",
              page: () => const News_home(),
            ),GetPage(
              name: "/weather_home",
              page: () => const weather_home(),
            ),GetPage(
              name: "/homepage",
              page: () => const homepage(),
            ),
            GetPage(
              name: "/fetchdata",
              page: () => const fetchdata(),
            ),GetPage(
              name: "/Pratice_page",
              page: () => const Pratice_page(),
            ),GetPage(
              name: "/Product_home",
              page: () => const Product_home(),
            ),
            GetPage(
              name: "/Ad_Page",
              page: () => const Ad_Page(),
            ),
          ],
        );
      },
    ),
  );
}

// import 'package:flutter/material.dart';
// import 'package:techinal_practice/controller/blob/internet_bloc.dart';
// import 'package:techinal_practice/views/blob/home_screen.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// void main() {
//   runApp(
//     BlocProvider(
//       create: (context) => InternetBloc(),
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData.light(useMaterial3: true),
//         darkTheme: ThemeData.dark(useMaterial3: true),
//         routes: {
//           '/': (context) => HomeScreen(),
//         },
//       ),
//     ),
//   );
// }
