import 'package:flutter/material.dart';
import 'package:my_first_app/Screens/consumer_product_screen.dart';
import 'package:my_first_app/providers/selector_cart_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Clone",
        theme: ThemeData(
          // fontFamily: 'RopaSans',
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.blue,

            ///flipkart

            ///whatApp
            // backgroundColor: Colors.teal,

            iconTheme: IconThemeData(color: Colors.white),
          ),
        ),
        // home: const App(
        //   name: 'login',
        // ),
        // home: const StatefulWidgetScreen(),
        // home: const WhatsAppLandingScreen(),
        // home: const WrapWidgetScreen(),
        // home: const CardWeidget(),
        // home: const TableScreen(),
        // home: const ListTileScreen(),
        // home: const AspectRatioScreen(),
        // home: const BaseLineScreen(),
        // home: const TonyStarkScreen(),
        // home: const FlutterSatTest(),
        // home: const GridViewScreen(),
        // home: const SilverAppBarScreen(),
        // home: const FbLandingScreen(),
        home: const ConsumerProductScreen(),
        // home: const SelectorProductScreen(),
      ),
    );
  }
}
