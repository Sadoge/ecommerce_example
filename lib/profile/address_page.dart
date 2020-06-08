import 'package:ecommerce_example/styles.dart';
import 'package:ecommerce_example/widgets/basic_app_bar.dart';
import 'package:ecommerce_example/widgets/basic_button.dart';
import 'package:ecommerce_example/widgets/basic_check_box.dart';
import 'package:ecommerce_example/widgets/basic_textfield.dart';
import 'package:flutter/material.dart';

class AddressPage extends StatefulWidget {
  AddressPage({Key key}) : super(key: key);

  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  TextEditingController _nameController =
      TextEditingController(text: 'Sam Smets');
  TextEditingController _addressController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _zipCodeController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  bool _isDefault = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 10, 40, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Name',
              style: smallTitle,
            ),
            const SizedBox(height: 10),
            BasicTextField(
              controller: _nameController,
              placeholder: 'Name',
            ),
            const SizedBox(height: 20),
            Text(
              'Adress',
              style: smallTitle,
            ),
            const SizedBox(height: 10),
            BasicTextField(
              controller: _addressController,
              placeholder: 'Adress',
            ),
            const SizedBox(height: 20),
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'City',
                        style: smallTitle,
                      ),
                      const SizedBox(height: 10),
                      BasicTextField(
                        controller: _cityController,
                        placeholder: 'City',
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
                        'ZIP Code',
                        style: smallTitle,
                      ),
                      const SizedBox(height: 10),
                      BasicTextField(
                        controller: _zipCodeController,
                        placeholder: 'ZIP code',
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Mobile Number',
              style: smallTitle,
            ),
            const SizedBox(height: 10),
            BasicTextField(
              controller: _mobileController,
              placeholder: 'Mobile Number',
            ),
            const SizedBox(height: 20),
            BasicCheckBox(
              value: _isDefault,
              label: "Set as default address",
              onValueChanged: (newValue) {
                setState(() {
                  _isDefault = newValue;
                });
              },
            ),
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
