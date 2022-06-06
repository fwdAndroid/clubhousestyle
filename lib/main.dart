import 'package:clubstyle_users/auth/signinpage.dart';
import 'package:clubstyle_users/provider/googleprovider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Stripe.publishableKey =
      'pk_test_51KxapZBmHAwiQPYIuhMu1UtbLnLzL0mQAxLN2aauvJxtHTjEFI5CGfA8yptCI7iklCb1ffAnrvxyR8e8iP3B88JA00GktN5pqZ';

  await Stripe.instance.applySettings();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GoogleSignInProvider()),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const SignIn()),
    );
  }
}
