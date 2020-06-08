import 'package:ecommerce_example/styles.dart';
import 'package:ecommerce_example/widgets/basic_app_bar.dart';
import 'package:ecommerce_example/widgets/basic_button.dart';
import 'package:ecommerce_example/widgets/basic_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentOptionsPage extends StatefulWidget {
  PaymentOptionsPage({Key key}) : super(key: key);

  @override
  _PaymentOptionsPageState createState() => _PaymentOptionsPageState();
}

class _PaymentOptionsPageState extends State<PaymentOptionsPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _cardNumberController = TextEditingController();
  TextEditingController _expirationMonthController = TextEditingController();
  TextEditingController _expirationYearController = TextEditingController();
  TextEditingController _cvcController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: ListView(
          children: <Widget>[
            Container(
              height: 170,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: primaryColor.withOpacity(0.5),
                    blurRadius: 30,
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      SvgPicture.asset('assets/visa.svg'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      SvgPicture.asset('assets/chip.svg'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _cardNumberController.text ?? "",
                    style: medium.copyWith(color: Colors.white),
                  ),
                  Spacer(),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Cardholder',
                              style: small.copyWith(color: Colors.white),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              _nameController.text ?? '',
                              style: smallTitle.copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Exp. Date',
                              style: small.copyWith(color: Colors.white),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "${_expirationMonthController.text}/${_expirationYearController.text}",
                              style: smallTitle.copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 40),
            Text(
              'Cardholder Name',
              style: smallTitle,
            ),
            const SizedBox(height: 10),
            BasicTextField(
              controller: _nameController,
              placeholder: 'Cardholder Name',
              onCompleted: () {
                setState(() {});
              },
            ),
            const SizedBox(height: 20),
            Text(
              'Card Number',
              style: smallTitle,
            ),
            const SizedBox(height: 10),
            BasicTextField(
              controller: _cardNumberController,
              placeholder: 'Card Number',
              onCompleted: () {
                setState(() {});
              },
            ),
            const SizedBox(height: 20),
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Cvv\\cvc',
                        style: smallTitle,
                      ),
                      const SizedBox(height: 10),
                      BasicTextField(
                        controller: _cvcController,
                        placeholder: 'Cvv\\cvc',
                        obscureText: true,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Exp. Date',
                        style: smallTitle,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: BasicTextField(
                              controller: _expirationMonthController,
                              placeholder: 'Month',
                              onCompleted: () {
                                setState(() {});
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: BasicTextField(
                              controller: _expirationYearController,
                              placeholder: 'Year',
                              onCompleted: () {
                                setState(() {});
                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(40),
        child: BasicButton(
          title: "Save",
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
