import 'package:ecommerce_example/authentication/forgot_password_page.dart';
import 'package:ecommerce_example/authentication/register_page.dart';
import 'package:ecommerce_example/dashboard/dashboard_page.dart';
import 'package:ecommerce_example/styles.dart';
import 'package:ecommerce_example/widgets/basic_button.dart';
import 'package:ecommerce_example/widgets/basic_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 100),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(5, 5),
                    blurRadius: 15,
                    color: Colors.black.withOpacity(0.15),
                  )
                ],
              ),
              child: SvgPicture.asset('assets/logo.svg'),
            ),
            const SizedBox(height: 80),
            Expanded(
              child: Form(
                child: ListView(
                  children: <Widget>[
                    const SizedBox(height: 20),
                    BasicTextField(
                      controller: _emailController,
                      iconData: MdiIcons.emailOutline,
                      placeholder: 'Email',
                    ),
                    const SizedBox(height: 20),
                    BasicTextField(
                      controller: _passwordController,
                      iconData: MdiIcons.lockOutline,
                      obscureText: true,
                      canToggleObscureText: true,
                      placeholder: 'Password',
                    ),
                    const SizedBox(height: 5),
                    GestureDetector(
                      child: Text(
                        "Forgot password?",
                        style: linkText,
                        textAlign: TextAlign.end,
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ForgotPasswordPage(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 40),
                    BasicButton(
                      title: "Sign in",
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => DashboardPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
              child: Text(
                "Create an account?",
                style: linkText,
              ),
            )
          ],
        ),
      ),
    );
  }
}
