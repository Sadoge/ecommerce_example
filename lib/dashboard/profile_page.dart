import 'package:ecommerce_example/profile/address_page.dart';
import 'package:ecommerce_example/profile/payment_options_page.dart';
import 'package:ecommerce_example/styles.dart';
import 'package:ecommerce_example/widgets/basic_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.edit,
                  color: primaryColor,
                ),
                onPressed: () {},
              )
            ],
          ),
          Center(
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                image: DecorationImage(
                  image: AssetImage('assets/profile_image.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Sam Smets',
            style: mediumTitle,
          ),
          const SizedBox(height: 60),
          BasicMenuItem(
            iconData: MdiIcons.bell,
            title: 'Notifications',
          ),
          Divider(
            height: 50,
            color: Colors.grey,
          ),
          BasicMenuItem(
            iconData: MdiIcons.textBox,
            title: 'My Orders',
          ),
          Divider(
            height: 50,
            color: Colors.grey,
          ),
          BasicMenuItem(
            iconData: MdiIcons.homeSearch,
            title: 'Address',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AddressPage()),
              );
            },
          ),
          Divider(
            height: 50,
            color: Colors.grey,
          ),
          BasicMenuItem(
            iconData: MdiIcons.creditCardOutline,
            title: 'Payment',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => PaymentOptionsPage()),
              );
            },
          ),
          Divider(
            height: 50,
            color: Colors.grey,
          ),
          BasicMenuItem(
            iconData: MdiIcons.cog,
            title: 'Settings',
          ),
          Divider(
            height: 50,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
