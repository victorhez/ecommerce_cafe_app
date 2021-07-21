import 'package:ecommerce_cafe_app/config/app_constants.dart';
import 'package:ecommerce_cafe_app/ui/screens/product/product_details_screen.dart';
import 'package:ecommerce_cafe_app/viewModel/GeneralVM.dart';
import 'package:ecommerce_cafe_app/viewModel/ProductVM.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return GestureDetector(
      onPanDown: (test) {
        FocusManager.instance.primaryFocus.unfocus();
      },
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<GeneralVM>(create: (_) => GeneralVM()),
          ChangeNotifierProvider<ProductVM>(create: (_) => ProductVM()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: ProductDetailsScreen.routeName,
          title: AppConstants.appName,
          theme: AppConstants.appTheme,
          navigatorKey: AppConstants.navigatorKey,
          supportedLocales: [
            Locale('en', 'US'), // English, no country code
          ],
          routes: {
            ProductDetailsScreen.routeName: (context) => ProductDetailsScreen(),
          },
        ),
      ),
    );
  }
}
