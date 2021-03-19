import 'package:flutter/material.dart';
import 'package:happy_postcode_flutter/pages/loading_page.dart';
import 'package:happy_postcode_flutter/pages/main_page.dart';
import 'package:happy_postcode_flutter/providers/address_provider.dart';
import 'package:provider/provider.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'components/app_theme.dart';
import 'core/network/network_manager.dart';
import 'service/IPostcode_service.dart';
import 'service/postcode_service.dart';

void main() async {
  await DotEnv.load(fileName: '.env');
  runApp(PostcodeApp());
}

class PostcodeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => new AddressProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Location Delivery',
        home: LoadingPage(),
        routes: {
          'home': (_) => MainPage(),
          'loading': (_) => LoadingPage(),
        },
        theme: AppTheme.buildTheme(),
      ),
    );
  }
}
