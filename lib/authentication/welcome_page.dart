import 'package:ecommerce_example/authentication/login_page.dart';
import 'package:ecommerce_example/authentication/register_page.dart';
import 'package:ecommerce_example/styles.dart';
import 'package:ecommerce_example/widgets/basic_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 100),
            Text(
              'Simply',
              style: bigTitle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              'Select your photographer then go to the session',
              style: bigSubtitle,
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: SvgPicture.asset('assets/welcome_screen.svg'),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: BasicButton(
                    title: "Sign in",
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: BasicButton(
                    isInverted: true,
                    title: "Sign up",
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
