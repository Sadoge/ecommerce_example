import 'package:ecommerce_example/styles.dart';
import 'package:ecommerce_example/widgets/basic_app_bar.dart';
import 'package:ecommerce_example/widgets/basic_button.dart';
import 'package:ecommerce_example/widgets/basic_textfield.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  ForgotPasswordPage({Key key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BasicAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 200,
                child: Text(
                  'Recover your account',
                  style: bigTitle,
                  textAlign: TextAlign.start,
                ),
              ),
              Expanded(
                child: Center(
                  child: Form(
                    child: ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        BasicTextField(
                          controller: _emailController,
                          placeholder: 'Enter email',
                        ),
                        const SizedBox(height: 20),
                        BasicButton(
                          title: "Next",
                          onTap: () {},
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
